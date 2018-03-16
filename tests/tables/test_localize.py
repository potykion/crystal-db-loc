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
    sp_rename '{only_ru_columns_table}', '{only_ru_columns_table}Language';
    GO
    '''


def test_localize_has_ru_columns_table_with_unique_constraint(has_ru_columns_table):
    localization_data = localize_has_ru_columns_table(has_ru_columns_table)

    ru_columns_with_types_str = ',\n\t\t'.join([
        'E varchar(20)', 'Nsv varchar(20)', 'Uzv varchar(20)'
    ])
    ru_columns_str = 'E, Nsv, Uzv'
    full_ru_columns_str = f'{has_ru_columns_table}ID, LanguageID, E, Nsv, Uzv'
    invariant_columns_str = 'HeadClue, SingCode, WaveLeng, Nzv, M1, M2, M3, Bknumber'

    drop_constraints = f'''ALTER TABLE dbo.{has_ru_columns_table}Invariant DROP CONSTRAINT U_AcOpTabl;'''

    primary_key = 'ID'

    expected = f'''
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
    {drop_constraints}
    ALTER TABLE dbo.{has_ru_columns_table}Invariant DROP COLUMN {ru_columns_str};
    GO
    -- Создаем уникальный индекс для {has_ru_columns_table}Language
    CREATE UNIQUE INDEX U_{has_ru_columns_table}Language ON {has_ru_columns_table}Language ({full_ru_columns_str});   
    GO
    -- Создаем уникальный индекс для {has_ru_columns_table}Invariant
    CREATE UNIQUE INDEX U_{has_ru_columns_table}Invariant ON {has_ru_columns_table}Invariant ({invariant_columns_str});   
    GO
    '''
    assert localization_data == expected


def test_localize_has_ru_columns_table_with_default_constraints():
    has_ru_columns_table = 'HeadTabl'
    localization_data = localize_has_ru_columns_table(has_ru_columns_table)

    ru_columns_with_types_str = ',\n\t\t'.join([
        'Expert varchar(32)', 'System varchar(128)'
    ])
    ru_columns_str = 'Expert, System'
    full_ru_columns_str = f'{has_ru_columns_table}ID, LanguageID, Expert, System'
    invariant_column_string = 'Help, Class'

    constraints = ['DF_HeadTabl_Expert', 'DF_HeadTabl_System']
    drop_constraints = '\n\t'.join(
        f'''ALTER TABLE dbo.{has_ru_columns_table}Invariant DROP CONSTRAINT {constraint};'''
        for constraint in constraints
    )

    primary_key = 'HeadClue'

    expected = f'''
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
    {drop_constraints}
    ALTER TABLE dbo.{has_ru_columns_table}Invariant DROP COLUMN {ru_columns_str};
    GO
    -- Создаем уникальный индекс для {has_ru_columns_table}Language
    CREATE UNIQUE INDEX U_{has_ru_columns_table}Language ON {has_ru_columns_table}Language ({full_ru_columns_str});   
    GO
    -- Создаем уникальный индекс для {has_ru_columns_table}Invariant
    CREATE UNIQUE INDEX U_{has_ru_columns_table}Invariant ON {has_ru_columns_table}Invariant ({invariant_column_string});   
    GO
    '''

    assert localization_data == expected


def test_localize_has_ru_columns_table_with_computed_columns():
    has_ru_columns_table = 'ElemTabl'
    localization_data = localize_has_ru_columns_table(has_ru_columns_table)

    ru_columns_with_types_str = ',\n\t\t'.join([
        'MethodP varchar(512)',
        '__MethodP as (left([MethodP],(50)))',
    ])
    index_columns_str = f'{has_ru_columns_table}ID, LanguageID, __MethodP'
    invariant_index_columns_str = f'HeadClue, SingCode, Nazbparam, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber'

    indexes = ['IX_ElemTabl']
    drop_indexes_str = '\n\t'.join(
        f'DROP INDEX {index} ON {has_ru_columns_table}Invariant;'
        for index in indexes
    )

    primary_key = 'ID'

    expected = f'''
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
    INSERT INTO dbo.{has_ru_columns_table}Language ({has_ru_columns_table}ID, MethodP)
    SELECT {primary_key} AS {has_ru_columns_table}Id, MethodP
    FROM {has_ru_columns_table}Invariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    {drop_indexes_str}
    ALTER TABLE dbo.{has_ru_columns_table}Invariant DROP COLUMN __MethodP, MethodP;
    GO
    -- Создаем уникальный индекс для {has_ru_columns_table}Language
    CREATE UNIQUE INDEX U_{has_ru_columns_table}Language ON {has_ru_columns_table}Language ({index_columns_str});   
    GO
    -- Создаем уникальный индекс для {has_ru_columns_table}Invariant
    CREATE UNIQUE INDEX U_{has_ru_columns_table}Invariant ON {has_ru_columns_table}Invariant ({invariant_index_columns_str});   
    GO
    '''

    assert localization_data == expected
