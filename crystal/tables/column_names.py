from operator import itemgetter

from crystal.db import db
from crystal.tables.rows import fetch_table_rows
from crystal.utils.utils import is_ru

SYSTEM_COLUMNS = [
    'SingCode', 'SingType'
]
TEXT_TYPES = [
    'char', 'varchar',
    'nchar', 'nvarchar',
    'text', 'ntext'
]
CHAR_TYPES = [
    'char', 'varchar',
    'nchar', 'nvarchar',
]


def fetch_table_columns(table):
    return map(
        itemgetter('COLUMN_NAME'),
        db.query(f'exec sp_columns {table}')
    )


def identify_columns_types(table, columns):
    def _format_column_type(info):
        if info['DATA_TYPE'] in CHAR_TYPES:
            return F"{info['DATA_TYPE']}({info['CHARACTER_MAXIMUM_LENGTH']})"
        else:
            return info['DATA_TYPE']

    columns_str = ','.join(f"'{column}'" for column in columns)
    query = F"SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{table}' AND COLUMN_NAME IN ({columns_str})"
    infos = db.query(query)
    return {
        info['COLUMN_NAME']: _format_column_type(info)
        for info in infos
    }


def get_primary_key(table):
    return db.query(f'sp_pkeys {table}').first()['COLUMN_NAME']


def filter_system_columns(columns):
    yield from (
        column
        for column in columns
        if column not in SYSTEM_COLUMNS
    )


def fetch_text_columns(table):
    columns = db.query(f'exec sp_columns {table}')
    yield from (
        column['COLUMN_NAME']
        for column in columns
        if column['TYPE_NAME'] in TEXT_TYPES
    )


def find_ru_columns(table):
    rows = fetch_table_rows(table)
    columns = set()

    for row in rows:
        row_dict = row.as_dict()

        if len(columns) == len(row_dict):
            break

        for column, value in row_dict.items():
            if column in columns:
                continue

            if is_ru(value):
                columns.add(column)

    return columns
