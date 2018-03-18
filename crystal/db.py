from urllib.parse import quote_plus

from records import Database

database = 'Crystal'
driver = 'SQL Server'
server = '.\SQLEXPRESS'

params = quote_plus(f'DRIVER={driver};SERVER={server};DATABASE={database};')
database_url = f'mssql+pyodbc:///?odbc_connect={params}'

db = Database(database_url)
