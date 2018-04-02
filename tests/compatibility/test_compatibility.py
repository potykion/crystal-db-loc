import pytest

from crystal.id_tables.compatibility import create_compatibility_view, create_language_compatibility_view


@pytest.mark.parametrize('table, method', [
    ('HeadTabl', create_compatibility_view),
    ('RefrTablLanguage', create_language_compatibility_view),

])
def test_create_compatibility_view(table, method):
    actual = method(table)

    with open(f'../../scripts/compatibility/{table}.sql') as f:
        expected = f.read()

    assert actual == expected
