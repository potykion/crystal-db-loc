import os
from operator import itemgetter

from common.config import DATABASE, LANGUAGE
from common.db import db
from common.file_utils import from_json
from common.table import find_table_pks, find_ru_columns, filter_computed_columns

CHAR_TYPES = [
    'char', 'varchar', 'nchar', 'nvarchar',
]

TEXT_TYPES = CHAR_TYPES + [
    'text', 'ntext'
]

DELETE_LANGUAGE_ID_CONSTRAINT = '''-- Удаляем LanguageID ограничение
ALTER TABLE {0} DROP CONSTRAINT DF_{1}_LanguageID'''


def get_text_columns(table):
    return [
        column['COLUMN_NAME']
        for column in db.query(f'exec sp_columns {table}')
        if column['TYPE_NAME'] in TEXT_TYPES
    ]


def identify_columns_types(table, columns):
    def _format_column_type(info):
        if info['is_computed']:
            formula = get_computed_column_formula(table, info['name'])
            return f'as {formula}'
        elif info['type_name'] in CHAR_TYPES:
            return F"{info['type_name']}({info['max_length']})"
        else:
            return info['type_name']

    columns_str = ','.join(f"'{column}'" for column in columns)

    query = (
        f"SELECT *, TYPE_NAME(system_type_id) as type_name FROM sys.columns "
        f"WHERE name in ({columns_str}) AND object_id = OBJECT_ID('{table}')"
    )
    infos = db.query(query)
    return {
        info['name']: _format_column_type(info)
        for info in infos
    }


def get_computed_column_formula(table, column):
    query = f"SELECT * FROM sys.computed_columns WHERE name = '{column}' and object_id = OBJECT_ID('{table}')"
    computed_columns = db.query(query)
    computed_column = computed_columns.first()

    formula: str = computed_column['definition']
    name = computed_column['name']

    if formula.startswith('(left') and name.startswith('__'):
        related_computed_column = name.strip('_')
        result_formula = f"(CONVERT(VARCHAR(32), HASHBYTES('MD5', {related_computed_column}), 2))"
    else:
        result_formula = formula

    return result_formula


class Localizer:
    def __init__(self, table):
        self.table = table

    def localize(self):
        raise NotImplementedError


class OnlyRuColumnsTableLocalizer(Localizer):
    def __init__(self, table):
        super().__init__(table)

        self.text_columns = get_text_columns(self.table)

    def localize(self):
        queries = '\nGO\n'.join(list(filter(None, [
            DELETE_LANGUAGE_ID_CONSTRAINT.format(self.table, self.table),
            self._rename_table()
        ])))

        return f'--- Таблица - {self.table}\n{queries}\nGO\n'

    def _add_language_column(self):
        return f'''--- Добавляем столбец LanguageID
ALTER TABLE dbo.{self.table} ADD LanguageID int NOT NULL DEFAULT(1);'''

    def _rename_table(self):
        return f'''--- Добавляем Language к названию
sp_rename '{self.table}', '{self.table}Language';'''


class HasRuColumnsTableLocalizer(Localizer):
    def __init__(self, table):
        super().__init__(table)
        self.pk = find_table_pks(table)[0]

        self.ru_columns = sorted(find_ru_columns(table))
        self.computed_columns = sorted(filter_computed_columns(table, self.ru_columns))
        self.ru_columns_without_computed = sorted(set(self.ru_columns) - set(self.computed_columns))

    def localize(self):
        queries = '\nGO\n'.join(

            filter(
                None,
                [
                    self._rename_to_invariant(),
                    self._create_language_table(),
                    self._add_foreign_key_to_language_table(),
                    self._insert_data_from_invariant(),
                    DELETE_LANGUAGE_ID_CONSTRAINT.format(F'{self.table}Invariant', self.table),
                    self._delete_language_dependent_columns(),
                ]
            )

        )

        return f'''--- Таблица {self.table}\n{queries}\nGO\n'''

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
    LanguageID INT NOT NULL DEFAULT {LANGUAGE},
    {ru_columns_with_types_str}
);'''

    def _add_foreign_key_to_language_table(self):
        return f'''--- Создаем FK для {self.table}Language
ALTER TABLE dbo.{self.table}Language
ADD CONSTRAINT FK_{self.table}Language_{self.table}Invariant FOREIGN KEY ({self.table}ID)
    REFERENCES dbo.{self.table}Invariant ({self.pk})
    ON DELETE CASCADE
    ON UPDATE CASCADE
;'''

    def _delete_language_dependent_columns(self):
        drop_columns_str = ', '.join(self.computed_columns + self.ru_columns_without_computed + ['LanguageID'])
        return f'''-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.{self.table}Invariant DROP COLUMN {drop_columns_str};'''

    def _insert_data_from_invariant(self):
        insert_columns_str = ', '.join(self.ru_columns_without_computed + ['LanguageID'])

        return f'''-- Вставляем столбцы
INSERT INTO dbo.{self.table}Language ({self.table}ID, {insert_columns_str})
SELECT {self.pk} AS {self.table}Id, {insert_columns_str}
FROM {self.table}Invariant;'''


if __name__ == '__main__':
    tables_with_types = from_json('data/1_tables_with_types.json')

    if 'FAKE' in os.environ:
        database = 'Crystal_en'
        tables_without_pk = from_json(f'data/4_tables_without_pks [{database}].json')
    else:
        database = DATABASE
        tables_without_pk = []

    with open(f'sql/5_localize [{database}].sql', 'w', encoding='utf-8') as f:
        print(f'''use {database};
GO''', file=f)

        for table, type_ in tables_with_types.items():
            if table in tables_without_pk:
                continue

            if type_ == 'ONLY_RU_COLUMNS':
                localize_str = OnlyRuColumnsTableLocalizer(table).localize()
            elif type_ == 'HAS_RU_COLUMNS':
                localize_str = HasRuColumnsTableLocalizer(table).localize()
            else:
                continue

            print(localize_str, file=f)
