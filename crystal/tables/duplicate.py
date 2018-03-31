from crystal.tables.columns import get_primary_key, fetch_table_columns, drop_related_computed_columns
from crystal.tables.tables import fetch_table_names, filter_system_tables


def delete_duplicates(table):
    pk = get_primary_key(table)
    columns = list(fetch_table_columns(table))
    columns.remove(pk)
    columns = list(drop_related_computed_columns(columns, table))
    columns_str = ', '.join(columns)

    return f'''DELETE FROM {table} WHERE {pk} NOT IN (SELECT MIN({pk}) FROM {table} GROUP BY {columns_str});'''


if __name__ == '__main__':
    tables = [
        table
        for table in filter_system_tables(fetch_table_names())
        if table.endswith('Language')
           and not (table.startswith('HeadTabl') or table.startswith('RefrTabl'))
    ]

    with open('../../scripts/language_duplicates.sql', 'w', encoding='utf-8') as f:
        print('use Crystal;', file=f)
        for table in tables:
            print(delete_duplicates(table), file=f)
