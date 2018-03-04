from operator import itemgetter

from crystal.tables.column_names import filter_system_columns, find_ru_columns, \
    fetch_text_columns, identify_columns_types, get_primary_key
from crystal.tables.constraints import list_columns_constraints
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
    sp_rename {only_ru_columns_table} {only_ru_columns_table}Language;
    GO
    '''


def localize_has_ru_columns_table(has_ru_columns_table):
    ru_columns = tuple(filter_system_columns(find_ru_columns(has_ru_columns_table)))
    ru_columns_str = ', '.join(sorted(ru_columns))

    ru_columns_with_types = sorted(
        identify_columns_types(has_ru_columns_table, ru_columns).items(),
        key=itemgetter(0)
    )
    ru_columns_with_types_str = ',\n\t\t'.join(
        f'{column} {type_}'
        for column, type_ in ru_columns_with_types
    )

    primary_key = get_primary_key(has_ru_columns_table)

    constraints = list_columns_constraints(has_ru_columns_table, ru_columns)
    drop_constraints_str = '\n\t\t'.join(
        f"ALTER TABLE dbo.{has_ru_columns_table}Invariant DROP CONSTRAINT {constraint};"
        for constraint in constraints
    )

    return f'''
    --- Таблица {has_ru_columns_table}
    --- Переименовываем {has_ru_columns_table}
    sp_rename {has_ru_columns_table}, {has_ru_columns_table}Invariant;
    GO
    --- Создаем таблицу {has_ru_columns_table}Language
    CREATE TABLE dbo.{has_ru_columns_table} 
    (
        ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
        {has_ru_columns_table}ID INT NOT NULL,
        LanguageID INT NOT NULL DEFAULT 1,
        {ru_columns_with_types_str}
    );
    GO    
    --- Создаем FK для {has_ru_columns_table}Language
    ALTER TABLE dbo.{has_ru_columns_table}Laguage
    ADD CONSTRAINT FK_{has_ru_columns_table}Language_{has_ru_columns_table}Invariant FOREIGN KEY ({has_ru_columns_table}ID)
        REFERENCES dbo.{has_ru_columns_table} ({primary_key})     
        ON DELETE CASCADE    
        ON UPDATE CASCADE    
    ;    
    GO
    -- Вставляем столбцы
    INSERT INTO dbo.{has_ru_columns_table}Language ({has_ru_columns_table}ID, {ru_columns_str})
    SELECT {primary_key} AS {has_ru_columns_table}Id, {ru_columns_str}
    FROM {has_ru_columns_table}Invariant;
    GO
    -- Удаляем "русские" столбцы, а также заыисимости
    {drop_constraints_str}
    ALTER TABLE dbo.{has_ru_columns_table}Invariant DROP COLUMN {ru_columns_str};
    '''
