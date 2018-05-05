import json
from typing import Iterator

from utils.db import db

REDUNDANT_TABLES = [
    'Users',
    'Properties_Complex'
]

if __name__ == '__main__':
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

    with open('data/0_tables.json', 'w') as f:
        json.dump(tables, f)
