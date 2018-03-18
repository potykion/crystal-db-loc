from itertools import chain
from operator import itemgetter

from crystal.tables.columns import filter_system_columns, find_ru_columns, \
    fetch_text_columns, identify_columns_types, get_primary_key, drop_computed_columns, filter_computed_columns, \
    fetch_table_columns
from crystal.tables.constraints import list_columns_constraints
from crystal.tables.indexes import list_column_indexes
from crystal.utils.utils import iter_len


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


def localize_only_ru_columns_table(only_ru_columns_table):
    return f'''
    --- Таблица - {only_ru_columns_table}
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.{only_ru_columns_table} ADD LanguageID int NOT NULL DEFAULT(1);
    GO    
    --- Добавляем Language к названию
    sp_rename '{only_ru_columns_table}', '{only_ru_columns_table}Language';
    GO
    '''


def localize_has_ru_columns_table(has_ru_columns_table):
    ru_columns = tuple(filter_system_columns(find_ru_columns(has_ru_columns_table)))
    ru_columns_str = ', '.join(sorted(drop_computed_columns(has_ru_columns_table, ru_columns)))
    computed_columns = sorted(filter_computed_columns(has_ru_columns_table, ru_columns))
    computed_ru_columns_str = ', '.join(computed_columns)
    drop_columns_str = ', '.join(filter(None, [computed_ru_columns_str, ru_columns_str]))

    index_columns_str = f'{has_ru_columns_table}ID, LanguageID'
    if computed_columns:
        columns_without_related_computed_columns = [
            column
            for column in ru_columns
            if f'__{column}' not in computed_columns
        ]
        columns_without_related_computed_columns_str = ', '.join(columns_without_related_computed_columns)
        index_columns_str = ', '.join([index_columns_str, columns_without_related_computed_columns_str])
    else:
        index_columns_str = ', '.join([index_columns_str, ru_columns_str])

    primary_key = get_primary_key(has_ru_columns_table)

    table_columns = tuple(fetch_table_columns(has_ru_columns_table))
    invariant_table_columns = [
        column
        for column in table_columns
        if column not in ru_columns and column != primary_key
    ]
    invariant_index_columns_str = ', '.join(invariant_table_columns)

    # todo create translation table
    # http://weblogs.sqlteam.com/jeffs/archive/2004/10/07/2190.aspx

    ru_columns_with_types = sorted(
        identify_columns_types(has_ru_columns_table, ru_columns).items(),
        key=itemgetter(0)
    )
    ru_columns_with_types_str = ',\n\t\t'.join(
        f'{column} {type_}'
        for column, type_ in ru_columns_with_types
    )

    constraints = sorted(list_columns_constraints(has_ru_columns_table, ru_columns))
    drop_constraints = (
        f"ALTER TABLE dbo.{has_ru_columns_table}Invariant DROP CONSTRAINT {constraint};"
        for constraint in constraints
    )

    indexes = list_column_indexes(has_ru_columns_table, ru_columns)
    drop_indexes = (
        f'DROP INDEX {index} ON {has_ru_columns_table}Invariant;'
        for index in indexes
        if index not in constraints
    )

    drop_dependencies_str = '\n\t'.join(chain(drop_constraints, drop_indexes))

    return f'''
    --- Таблица {has_ru_columns_table}
    --- Переименовываем {has_ru_columns_table}
    sp_rename '{has_ru_columns_table}', '{has_ru_columns_table}Invariant';
    GO
    --- Создаем таблицу {has_ru_columns_table}Language
    CREATE TABLE dbo.{has_ru_columns_table}Language
    (
        ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
        {has_ru_columns_table}ID INT NOT NULL,
        LanguageID INT NOT NULL DEFAULT 1,
        {ru_columns_with_types_str}
    );
    GO    
    --- Создаем FK для {has_ru_columns_table}Language
    ALTER TABLE dbo.{has_ru_columns_table}Language
    ADD CONSTRAINT FK_{has_ru_columns_table}Language_{has_ru_columns_table}Invariant FOREIGN KEY ({has_ru_columns_table}ID)
        REFERENCES dbo.{has_ru_columns_table}Invariant ({primary_key})     
        ON DELETE CASCADE    
        ON UPDATE CASCADE    
    ;    
    GO
    -- Вставляем столбцы
    INSERT INTO dbo.{has_ru_columns_table}Language ({has_ru_columns_table}ID, {ru_columns_str})
    SELECT {primary_key} AS {has_ru_columns_table}Id, {ru_columns_str}
    FROM {has_ru_columns_table}Invariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    {drop_dependencies_str}
    ALTER TABLE dbo.{has_ru_columns_table}Invariant DROP COLUMN {drop_columns_str};
    GO
    '''
