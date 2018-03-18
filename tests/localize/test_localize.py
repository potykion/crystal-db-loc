import pytest

from crystal.tables.localize import identify_table_type, localize_only_ru_columns_table, localize_has_ru_columns_table


@pytest.fixture()
def only_ru_columns_table():
    return 'RefrTabl'


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


@pytest.mark.parametrize('table', [
    'AcOpTabl', 'HeadTabl', 'ElemTabl'
])
def test_localize_has_ru_columns_tables(table):
    localization_data = localize_has_ru_columns_table(table)

    with open(f'../scripts/{table}-loc.sql', encoding='utf-8') as f:
        expected = f.read()

    assert localization_data == expected
