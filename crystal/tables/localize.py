from itertools import chain
from operator import itemgetter

from crystal.tables.columns import get_primary_key, filter_system_columns, find_ru_columns, drop_computed_columns, \
    filter_computed_columns, identify_columns_types, fetch_text_columns
from crystal.tables.constraints import list_columns_constraints
from crystal.tables.indexes import list_column_indexes
from crystal.utils.utils import iter_len


class Localizer:
    def __init__(self, table):
        self.table = table

    def localize(self):
        raise NotImplementedError


class OnlyRuColumnsTableLocalizer(Localizer):
    def localize(self):
        return f'''--- Таблица - {self.table}
--- Добавляем столбец LanguageID
ALTER TABLE dbo.{self.table} ADD LanguageID int NOT NULL DEFAULT(1);
GO
--- Добавляем Language к названию
sp_rename '{self.table}', '{self.table}Language';
GO
'''


class HasRuColumnsTableLocalizer(Localizer):
    def __init__(self, table):
        super().__init__(table)
        self.pk = get_primary_key(table)

        self.ru_columns = sorted(filter_system_columns(find_ru_columns(table)))
        self.computed_columns = sorted(filter_computed_columns(table, self.ru_columns))
        self.ru_columns_without_computed = sorted(set(self.ru_columns) - set(self.computed_columns))

    def localize(self):
        queries = '\nGO\n'.join([
            self._rename_to_invariant(),
            self._create_language_table(),
            self._add_foreign_key(),
            self._insert_data_from_invariant(),
            self._delete_dependencies(),
            self._delete_language_dependent_columns(),
            ''
        ])

        return f'''--- Таблица {self.table}\n{queries}'''

    def _rename_to_invariant(self):
        return f"--- Переименовываем {self.table}\nsp_rename '{self.table}', '{self.table}Invariant';"

    def _create_language_table(self):
        ru_columns_with_types = sorted(
            identify_columns_types(self.table, self.ru_columns).items(),
            key=itemgetter(0)
        )
        ru_columns_with_types_str = ',\n    '.join(
            f'{column} {type_}'
            for column, type_ in ru_columns_with_types
        )

        return f'''--- Создаем таблицу {self.table}Language
CREATE TABLE dbo.{self.table}Language
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    {self.table}ID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    {ru_columns_with_types_str}
);'''

    def _add_foreign_key(self):
        return f'''--- Создаем FK для {self.table}Language
ALTER TABLE dbo.{self.table}Language
ADD CONSTRAINT FK_{self.table}Language_{self.table}Invariant FOREIGN KEY ({self.table}ID)
    REFERENCES dbo.{self.table}Invariant ({self.pk})
    ON DELETE CASCADE
    ON UPDATE CASCADE
;'''

    def _delete_language_dependent_columns(self):
        drop_columns_str = ', '.join(self.computed_columns + self.ru_columns_without_computed)
        return f'''-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.{self.table}Invariant DROP COLUMN {drop_columns_str};'''

    def _delete_dependencies(self):
        constraints = sorted(list_columns_constraints(self.table, self.ru_columns))
        drop_constraints = (
            f"ALTER TABLE dbo.{self.table}Invariant DROP CONSTRAINT {constraint};"
            for constraint in constraints
        )
        indexes = list_column_indexes(self.table, self.ru_columns)
        drop_indexes = (
            f'DROP INDEX {index} ON {self.table}Invariant;'
            for index in indexes
            if index not in constraints
        )
        drop_dependencies_str = '\n'.join(chain(drop_constraints, drop_indexes))

        return f'''-- Удаляем ограничения и индексы
{drop_dependencies_str}'''

    def _insert_data_from_invariant(self):
        insert_columns_str = ', '.join(self.ru_columns_without_computed)

        return f'''-- Вставляем столбцы
INSERT INTO dbo.{self.table}Language ({self.table}ID, {insert_columns_str})
SELECT {self.pk} AS {self.table}Id, {insert_columns_str}
FROM {self.table}Invariant;'''


def identify_table_type(table):
    columns = tuple(filter_system_columns(fetch_text_columns(table)))
    ru_columns = tuple(filter_system_columns(find_ru_columns(table)))

    columns_count = iter_len(columns)
    ru_columns_count = iter_len(ru_columns)

    if ru_columns_count and columns_count == ru_columns_count:
        return 'ONLY_RU_COLUMNS'
    elif ru_columns_count and columns_count != ru_columns_count:
        return 'HAS_RU_COLUMNS'
    else:
        return 'NO_RU_COLUMNS'