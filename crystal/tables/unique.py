from crystal.tables.columns import fetch_table_columns, get_primary_key, drop_related_computed_columns
from crystal.tables.tables import filter_system_tables, fetch_table_names

if __name__ == '__main__':
    tables = [
        table
        for table in filter_system_tables(fetch_table_names())
        if (table.endswith('Language') or table.endswith('Invariant')) and
           not table.startswith('HeadTabl')
    ]

    with open('../../scripts/unique.sql', 'w', encoding='utf-8') as f:
        print('use Crystal;', file=f)
        for table in tables:
            columns = list(fetch_table_columns(table))
            pk = get_primary_key(table)
            columns.remove(pk)
            columns = drop_related_computed_columns(columns, table)

            columns_str = ', '.join(columns)
            create_unique_constraint = f'ALTER TABLE {table} ADD CONSTRAINT U_{table} UNIQUE ({columns_str})'
            print(create_unique_constraint, file=f)
