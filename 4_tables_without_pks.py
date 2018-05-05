import json

from utils.db import DATABASE
from utils.table import find_tables_pks


def find_tables_without_pks(tables, table_pks):
    return [
        table
        for table in tables
        if not table_pks[table] or
           'HeadClue' in table_pks[table] and table not in ['SingTabl', 'HeadTabl']
    ]


if __name__ == '__main__':
    with open('data/1_tables_with_types.json') as f:
        tables_with_types = json.load(f)

    tables = [
        table
        for table, type_ in tables_with_types.items()
        if type_ != 'NO_RU_COLUMNS'
    ]
    table_pks = find_tables_pks(tables)

    tables_without_pk = find_tables_without_pks(tables, table_pks)
    with open(F'data/4_tables_without_pks [{DATABASE}].json', 'w') as f:
        json.dump(tables_without_pk, f)
