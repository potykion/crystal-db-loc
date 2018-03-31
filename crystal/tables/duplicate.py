from crystal.tables.columns import get_primary_key, fetch_table_columns, filter_computed_columns, \
    drop_related_computed_columns
from crystal.tables.tables import filter_system_tables, fetch_table_names, list_related_tables


def delete_duplicates(table):
    return '\nGO\n\n'.join([
        create_unique_id_mapping(table),
        *update_fk_tables(table),
        _delete_duplicates(table),
        delete_unique_id_mapping(table),
        ''
    ])


def create_unique_id_mapping(table):
    pk = get_primary_key(table)

    columns = list(fetch_table_columns(table))
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


def update_fk_tables(table):
    foreign_keys = list_related_tables(table)

    for fk_table, fk_column in foreign_keys:
        yield f'''UPDATE {fk_table}
SET {fk_table}.{fk_column} = NewID
FROM {fk_table}
INNER JOIN {table}UniqueIdMapping U
ON {fk_table}.{fk_column} = U.OldID
WHERE U.OldID <> U.NewID;'''


def _delete_duplicates(table):
    pk = get_primary_key(table)

    return f'''DELETE FROM {table}
WHERE {table}.{pk} Not IN
(SELECT NewID FROM {table}UniqueIdMapping);'''


def delete_unique_id_mapping(table):
    return f'''drop table {table}UniqueIdMapping;'''


if __name__ == '__main__':
    invariant_tables = [
        table
        for table in filter_system_tables(fetch_table_names())
        if table.endswith('Invariant')
    ]

    with open('../../scripts/delete_duplicates.sql', 'w', encoding='utf-8') as f:
        print('use Crystal;', file=f)
        for table in invariant_tables:
            print(delete_duplicates(table), file=f)