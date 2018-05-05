from urllib.parse import quote_plus

from records import Database

from common.config import DATABASE


def _build_database_url(database=DATABASE, server='.\SQLEXPRESS', driver='SQL Server', ):
    params = quote_plus(f'DRIVER={driver};SERVER={server};DATABASE={database};')
    database_url = f'mssql+pyodbc:///?odbc_connect={params}'
    return database_url


database_url = _build_database_url()
db = Database(database_url)
