from urllib.parse import quote_plus

from records import Database

from crystal.config import DATABASE


def _connect_to_db():
    driver = 'SQL Server'
    server = '.\SQLEXPRESS'

    params = quote_plus(f'DRIVER={driver};SERVER={server};DATABASE={DATABASE};')
    database_url = f'mssql+pyodbc:///?odbc_connect={params}'
    return Database(database_url)


db = _connect_to_db()
