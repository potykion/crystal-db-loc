from urllib.parse import quote_plus

from records import Database


def _connect_to_db(database='Crystal'):
    driver = 'SQL Server'
    server = '.\SQLEXPRESS'

    params = quote_plus(f'DRIVER={driver};SERVER={server};DATABASE={database};')
    database_url = f'mssql+pyodbc:///?odbc_connect={params}'
    return Database(database_url)


db = _connect_to_db()
