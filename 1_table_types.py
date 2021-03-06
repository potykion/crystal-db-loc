import json
from collections import defaultdict
from operator import itemgetter

from common.db import db
from common.table import find_tables_pks, get_columns, find_ru_columns


def find_tables_fks(tables):
    table_fks = defaultdict(list)

    for table in tables:
        fks = db.query(f'sp_fkeys {table}')

        for fk in fks:
            fk_table = fk['FKTABLE_NAME']
            fk_column = fk['FKCOLUMN_NAME']
            table_fks[fk_table].append(fk_column)

    return table_fks


def find_tables_types(tables, table_pks, table_fks):
    table_types = (
        (table, identify_table_type(table, table_pks[table], table_fks[table]))
        for table in tables
    )
    table_types = sorted(table_types, key=itemgetter(1))
    return dict(table_types)


def identify_table_type(table, fks, pks):
    columns = get_columns(table)
    columns_without_fk_and_pk = [
        column
        for column in columns
        if column not in pks and
           column not in fks
    ]

    ru_columns = find_ru_columns(table)

    columns_count = len(columns_without_fk_and_pk)
    ru_columns_count = len(ru_columns)

    if ru_columns_count and columns_count == ru_columns_count:
        return 'ONLY_RU_COLUMNS'
    elif ru_columns_count and columns_count != ru_columns_count:
        return 'HAS_RU_COLUMNS'
    else:
        return 'NO_RU_COLUMNS'


if __name__ == '__main__':
    with open('data/0_tables.json') as f:
        tables = json.load(f)

    table_fks = find_tables_fks(tables)
    table_pks = find_tables_pks(tables)

    with open('data/1_tables_pks.json', 'w') as f:
        json.dump(table_pks, f)

    tables_with_type = find_tables_types(tables, table_pks, table_fks)

    with open('data/1_tables_with_types.json', 'w') as f:
        json.dump(tables_with_type, f)
