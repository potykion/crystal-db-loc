from operator import itemgetter

from utils.db import db


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
