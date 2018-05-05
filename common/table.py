from operator import itemgetter

from common.db import db

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

    return columns


def get_rows(table):
    return db.query(f'SELECT * FROM {table}')
