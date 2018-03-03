from typing import Iterable

from crystal.db import db


def fetch_table_names():
    tables = db.query('SELECT * FROM sys.tables')
    yield from (table['name'] for table in tables)


def filter_system_tables(tables: Iterable[str]):
    yield from (table for table in tables if table[0].isupper())
