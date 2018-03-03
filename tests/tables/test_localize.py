import pytest

from crystal.tables.localize import identify_table_type, localize_only_ru_columns_table, localize_has_ru_columns_table


@pytest.fixture()
def only_ru_columns_table():
    return 'RefrTabl'


@pytest.fixture()
def has_ru_columns_table():
    return 'AcOpTabl'


@pytest.mark.parametrize('table, type_', [
    ('RefrTabl', 'ONLY_RU_COLUMNS'),
    ('AcOpTabl', 'HAS_RU_COLUMNS'),
    ('SingTabl', 'NO_RU_COLUMNS')
])
def test_identify_table_type(table, type_):
    assert identify_table_type(table) == type_


def test_localize_only_ru_columns_table(only_ru_columns_table):
    localization_data = localize_only_ru_columns_table(only_ru_columns_table)

    assert localization_data == f'''
    --- Таблица - {only_ru_columns_table}
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.{only_ru_columns_table} ADD LanguageID int NOT NULL DEFAULT(1);
    GO    
    --- Добавляем Language к названию
    sp_rename {only_ru_columns_table} {only_ru_columns_table}Language;
    GO
    '''


def test_localize_has_ru_columns_table(has_ru_columns_table):
    localization_data = localize_has_ru_columns_table(has_ru_columns_table)

    ru_columns_with_types_str = ',\n\t\t'.join([
        'E varchar(20)', 'Nsv varchar(20)', 'Uzv varchar(20)'
    ])
    ru_columns_str = 'E, Nsv, Uzv'

    drop_constraints = f'''ALTER TABLE dbo.{has_ru_columns_table}Invariant DROP CONSTRAINT U_AcOpTabl;'''

    primary_key = 'ID'

    expected = f'''
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
    {drop_constraints}
    ALTER TABLE dbo.{has_ru_columns_table}Invariant DROP COLUMN {ru_columns_str};
    '''
    assert localization_data == expected
