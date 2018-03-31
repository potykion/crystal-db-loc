import pytest

from crystal.tables.localize import HasRuColumnsTableLocalizer, OnlyRuColumnsTableLocalizer, identify_table_type


@pytest.fixture()
def only_ru_columns_table():
    return ''


@pytest.mark.parametrize('table, type_', [
    ('RefrTabl', 'ONLY_RU_COLUMNS'),
    ('AcOpTabl', 'HAS_RU_COLUMNS'),
    ('SingTabl', 'NO_RU_COLUMNS')
])
def test_identify_table_type(table, type_):
    assert identify_table_type(table) == type_


@pytest.mark.parametrize('table, localizer', [
    ('RefrTabl', OnlyRuColumnsTableLocalizer),
    ('DensTabl', OnlyRuColumnsTableLocalizer),

    ('AcOpTabl', HasRuColumnsTableLocalizer),
    ('HeadTabl', HasRuColumnsTableLocalizer),
    ('ElemTabl', HasRuColumnsTableLocalizer)
])
def test_localize(table, localizer):
    localization_data = localizer(table).localize()

    with open(f'../scripts/localize_tables/{table}-loc.sql', encoding='utf-8') as f:
        expected = f.read()

    assert localization_data == expected
