import pytest

from crystal.tables.duplicate import delete_duplicates


@pytest.mark.parametrize('table', [
    'Elastic1Invariant',
    'PropertiesInvariant'
])
def test_delete_duplicates(table):
    with open(f'../../scripts/delete_duplicates_tables/{table}-dup.sql') as f:
        actual = delete_duplicates(table)
        expected = f.read()
        assert actual == expected
