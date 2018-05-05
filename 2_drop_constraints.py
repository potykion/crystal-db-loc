import json

from utils.db import db, DATABASE


def is_table_index(index, tables):
    return any(table.lower() in index['name'].lower() for table in tables)


def drop_index(index):
    *_, table = index['name'].split('_')
    index_name = index['name']

    if index['is_unique_constraint']:
        return f'ALTER TABLE dbo.{table} DROP CONSTRAINT {index_name};'
    else:
        return f"DROP INDEX {index_name} ON {table};"


if __name__ == '__main__':
    with open('data/0_tables.json') as f:
        tables = json.load(f)

    indexes = db.query('select * from sys.indexes where name is not null and is_primary_key = 0 order by name;')
    table_indexes = [
        index
        for index in indexes
        if is_table_index(index, tables)
    ]

    drop_indexes_str = '\nGO\n'.join(map(drop_index, table_indexes))

    with open(f'sql/2_drop_constraints [{DATABASE}].sql', 'w') as f:
        print(f'''sp_msforeachtable 'ALTER TABLE ? DISABLE TRIGGER all'
GO
ALTER TABLE dbo.Properties DROP CONSTRAINT DF_Properties_TableName;
GO
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_Expert;
GO
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_Help;
GO
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_System;
GO
{drop_indexes_str}''', file=f)
