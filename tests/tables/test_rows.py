import pytest

from crystal.tables.rows import fetch_table_rows


@pytest.fixture()
def table():
    return 'AcOpTabl'


def test_table_rows_fetch(table):
    rows = fetch_table_rows(table)
    assert len(list(rows)) == 238
