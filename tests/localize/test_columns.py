import pytest

from crystal.tables.columns import fetch_table_columns, get_primary_key, filter_system_columns, find_ru_columns, \
    fetch_text_columns
from crystal.utils.utils import iter_len


@pytest.fixture()
def table():
    return 'AcOpTabl'


def test_table_columns_fetch(table):
    columns = list(fetch_table_columns(table))
    assert len(columns) == 12


def test_get_primary_key(table):
    primary_key = get_primary_key(table)
    assert primary_key == 'ID'


def test_ru_columns_search(table):
    columns = find_ru_columns(table)
    assert columns == {'Uzv', 'Nsv', 'E', 'SingCode'}


def test_filter_system_columns(table):
    columns = filter_system_columns(find_ru_columns(table))
    assert set(columns) == {'Uzv', 'Nsv', 'E'}

def test_fetch_text_columns(table):
    columns = fetch_text_columns(table)
    assert iter_len(columns) == 5