from crystal.config import DATABASE
from crystal.db import db
from crystal.tables.tables import fetch_table_names, filter_system_tables

SELECT_INDEXES = 'select * from sys.indexes where name is not null and is_primary_key = 0 order by name;'


def list_tables():
    return list(filter_system_tables(fetch_table_names()))


def list_indexes():
    return db.query(SELECT_INDEXES).all(as_dict=True)


def is_table_index(index, tables):
    return any(index['name'].endswith(table) for table in tables)


if __name__ == '__main__':
    tables = list_tables()

    indexes = list_indexes()
    indexes = [
        index
        for index in indexes
        if is_table_index(index, tables)
    ]

    with open(F'scripts/delete_indexes_{DATABASE}.sql', 'w') as f:
        print(f'use {DATABASE}\nGO', file=f)
        for index in indexes:
            *_, table = index['name'].split('_')
            index_name = index['name']

            if index['is_unique_constraint']:
                print(f'ALTER TABLE dbo.{table} DROP CONSTRAINT {index_name};\nGO', file=f)
            else:
                print(f"DROP INDEX {index_name} ON {table};\nGO", file=f)
