from common.config import DATABASE
from common.db import db
from common.file_utils import from_json
from common.table import get_tables, find_tables_pks, find_table_pks, get_columns, drop_related_computed_columns

IGNORE_TABLES = [
    'Bibliogr', 'EquationTabl',
    'HeadTabl', 'RefrTabl',
    'SingTabl', 'Properties',
    'Languages'
]


def delete_duplicates_in_invariant_table(table, fk_tables=None):
    return '\nGO\n\n'.join([
        create_unique_id_mapping(table),
        *update_fk_tables(table, fk_tables),
        _delete_duplicates(table),
        delete_unique_id_mapping(table),
        ''
    ])


def create_unique_id_mapping(table):
    pk = find_table_pks(table)[0]

    columns = get_columns(table)
    columns.remove(pk)
    columns = drop_related_computed_columns(columns, table)
    columns_str = ', '.join(columns)

    join_columns_str = ' and\n'.join([
        f'(t1.{column} = t2.{column} or t1.{column} is NULL and t2.{column} is NULL)'
        for column in columns
    ])

    return f'''SELECT t2.{pk} as OldID, t1.MinID as NewID
INTO {table}UniqueIdMapping
FROM
  (SELECT MIN({pk}) as MinID, {columns_str}
   FROM {table}
   GROUP BY {columns_str}) t1
INNER JOIN
  {table} t2 ON
{join_columns_str};'''


def update_fk_tables(table, fk_tables):
    fk_tables = fk_tables or list_related_tables(table)

    for fk_table, fk_column in fk_tables:
        yield f'''UPDATE {fk_table}
SET {fk_table}.{fk_column} = NewID
FROM {fk_table}
INNER JOIN {table}UniqueIdMapping U
ON {fk_table}.{fk_column} = U.OldID
WHERE U.OldID <> U.NewID;'''


def list_related_tables(table):
    return [
        (fk['FKTABLE_NAME'], fk['FKCOLUMN_NAME'])
        for fk in db.query(f"exec sp_fkeys '{table}'").all()
    ]


def _delete_duplicates(table):
    pk = find_table_pks(table)[0]

    return f'''DELETE FROM {table}
WHERE {table}.{pk} Not IN
(SELECT NewID FROM {table}UniqueIdMapping);'''


def delete_unique_id_mapping(table):
    return f'''drop table {table}UniqueIdMapping;'''


def delete_duplicates_in_language_table(table):
    pk = find_table_pks(table)[0]

    columns = get_columns(table)
    columns.remove(pk)
    columns = list(drop_related_computed_columns(columns, table))
    columns_str = ', '.join(columns)

    return f'''DELETE FROM {table} WHERE {pk} NOT IN (SELECT MIN({pk}) FROM {table} GROUP BY {columns_str});'''


if __name__ == '__main__':
    tables = get_tables()
    tables_with_types = from_json('data/1_tables_with_types.json')

    tables_pks = find_tables_pks(tables)
    target_tables = [
        table
        for table in tables
        if tables_pks[table][0] == 'ID'
           and tables_with_types.get(table) != 'NO_RU_COLUMNS'
           and not any(table.startswith(ignore_table) for ignore_table in IGNORE_TABLES)
    ]
    target_tables = sorted(target_tables, key=lambda table: table.endswith('Invariant'), reverse=True)

    with open(F'sql/7_duplicates [{DATABASE}].sql', 'w', encoding='utf-8') as f:
        print(f'use {DATABASE};\nGO\n', file=f)

        for table in target_tables:
            if table.endswith('Invariant'):
                delete_duplicates_str = delete_duplicates_in_invariant_table(table)
            else:
                delete_duplicates_str = delete_duplicates_in_language_table(table)

            print(delete_duplicates_str, file=f)

    s = 'as'
