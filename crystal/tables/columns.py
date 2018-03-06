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
        if info['is_computed']:
            formula = get_computed_column_formula(table, info['name'])
            return f'as {formula}'
        elif info['type_name'] in CHAR_TYPES:
            return F"{info['type_name']}({info['max_length']})"
        else:
            return info['type_name']

    columns_str = ','.join(f"'{column}'" for column in columns)

    query = (
        f"SELECT *, TYPE_NAME(system_type_id) as type_name FROM sys.columns "
        f"WHERE name in ({columns_str}) AND object_id = OBJECT_ID('{table}')"
    )
    infos = db.query(query)
    return {
        info['name']: _format_column_type(info)
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


def get_computed_column_formula(table, column):
    columns = db.query(
        f"SELECT * FROM sys.computed_columns WHERE name = '{column}' and object_id = OBJECT_ID('{table}')")
    return columns.first()['definition']


def drop_computed_columns(table, columns):
    columns_str = ','.join(f"'{column}'" for column in columns)
    query = (
        f"SELECT *, TYPE_NAME(system_type_id) as type_name FROM sys.columns "
        f"WHERE name in ({columns_str}) AND object_id = OBJECT_ID('{table}') "
        "AND is_computed = 0"
    )
    non_computed_columns = db.query(query)
    return [
        column['name']
        for column in non_computed_columns
    ]


def filter_computed_columns(table, columns):
    columns_str = ','.join(f"'{column}'" for column in columns)
    query = (
        f"SELECT *, TYPE_NAME(system_type_id) as type_name FROM sys.columns "
        f"WHERE name in ({columns_str}) AND object_id = OBJECT_ID('{table}') "
        "AND is_computed = 1"
    )
    non_computed_columns = db.query(query)
    return [
        column['name']
        for column in non_computed_columns
    ]
