import json

from common.table import get_tables


if __name__ == '__main__':
    tables = get_tables()

    with open('data/0_tables.json', 'w') as f:
        json.dump(tables, f)
