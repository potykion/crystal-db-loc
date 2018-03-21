from crystal.tables.columns import fetch_table_columns, drop_computed_columns, get_primary_key
from crystal.tables.tables import fetch_table_names, filter_system_tables

if __name__ == '__main__':
    with open('scripts/Crystal_en-to-Crystal.sql', 'w', encoding='utf-8') as f:

        print('''INSERT INTO Crystal.dbo.SingTabl
(HeadClue, SingType, SingClue)
SELECT HeadClue, SingType, SingClue
from Crystal_en.dbo.SingTabl;
''', file=f)

        tables = filter_system_tables(fetch_table_names())
        language_tables = [
            table
            for table in tables
            if table.endswith('Language')
        ]

        for table in language_tables:
            columns = drop_computed_columns(table, fetch_table_columns(table))
            primary_key = get_primary_key(table)
            columns.remove(primary_key)

            columns_str = ', '.join(columns)

            print(f'''insert into Crystal.dbo.{table} 
({columns_str})
select {columns_str}
from Crystal_en.dbo.{table}
''', file=f)
