from typing import Iterable

from crystal.db import db


def fetch_table_names():
    tables = db.query('SELECT * FROM sys.tables')
    yield from (table['name'] for table in tables)


def filter_system_tables(tables: Iterable[str]):
    yield from (table for table in tables if table[0].isupper() and table not in ['Users'])


def create_id_pk(table):
    return f'''---Создаем столбец ID для {table}
ALTER TABLE dbo.{table} ADD ID INT IDENTITY(1,1);
GO
{create_pk(table, 'ID')}'''


def create_pk(table, column):
    return f'''---Создаем PK для {table}
ALTER TABLE dbo.{table} ADD PRIMARY KEY ({column});
GO
'''
