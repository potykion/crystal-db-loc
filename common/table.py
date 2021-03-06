from operator import itemgetter
from typing import Iterator

from common.db import db


REDUNDANT_TABLES = [
    'Users',
    'Properties_Complex'
]

ru_alphabet = 'йцукенгшщзхъфывапролджэячсмитьбюё'


def is_ru(value):
    return any(char_ in ru_alphabet for char_ in str(value))


def find_tables_pks(tables):
    return dict(
        sorted(
            zip(
                tables,
                map(find_table_pks, tables)
            ),
            key=itemgetter(1))
    )


def find_table_pks(table):
    return [
        pk['COLUMN_NAME']
        for pk in db.query(f'sp_pkeys {table}').all()
    ]


def get_columns(table):
    return [
        column['COLUMN_NAME']
        for column in db.query(f'sp_columns {table}')
    ]


def find_ru_columns(table):
    rows = get_rows(table)
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

    # not language-dependent columns
    columns -= {'SingType', 'SingCode'}

    if table.startswith('HeadTabl'):
        columns -= {'System'}

    return columns


def get_rows(table):
    return db.query(f'SELECT * FROM {table}')


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


def get_tables():
    table_names: Iterator[str] = (
        table['TABLE_NAME']
        for table in db.query('sp_tables')
        if table['TABLE_TYPE'] == 'TABLE'
    )
    tables = [
        table
        for table in table_names
        if not table.startswith('_') and
           not table[0].islower() and
           table not in REDUNDANT_TABLES
    ]
    return tables


def filter_computed_columns(table, columns):
    columns_str = ','.join(f"'{column}'" for column in columns)
    query = (
        f"SELECT *, TYPE_NAME(system_type_id) as type_name FROM sys.columns "
        f"WHERE name in ({columns_str}) AND object_id = OBJECT_ID('{table}') "
        "AND is_computed = 1"
    )
    return [
        column['name']
        for column in db.query(query)
    ]


def drop_related_computed_columns(columns, table):
    computed_columns = filter_computed_columns(table, columns)
    for column in computed_columns:
        columns.remove(column.strip('_'))
    return columns