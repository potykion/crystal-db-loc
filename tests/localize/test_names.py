from crystal.tables.tables import fetch_table_names, filter_system_tables


def test_fetch_table_names():
    tables = list(fetch_table_names())
    assert len(tables) == 43


def test_filter_system_tables():
    tables = filter_system_tables(fetch_table_names())
    underscore_tables = 7
    users_table = 1
    assert len(list(tables)) == 43 - underscore_tables - users_table
