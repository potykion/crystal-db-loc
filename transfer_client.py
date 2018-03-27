from crystal.id_tables.tables import TABLES_WITH_NON_ID_PK
from crystal.tables.columns import fetch_table_columns, drop_computed_columns, get_primary_key
from crystal.tables.tables import fetch_table_names, filter_system_tables

if __name__ == '__main__':
    with open('scripts/Crystal_en-to-Crystal.sql', 'w', encoding='utf-8') as f:

        tables = filter_system_tables(fetch_table_names())
        language_tables = [
            table
            for table in tables
            if table.endswith('Language') and
               table[:-len('Language')] in TABLES_WITH_NON_ID_PK
        ]

        for table in language_tables:
            columns = list(fetch_table_columns(table))
            pk = get_primary_key(table)
            if pk == 'ID':
                columns.remove(pk)

            columns = drop_computed_columns(table, columns)

            columns_str = ', '.join(columns)
            columns_str_with_mapped_sing = columns_str.replace('SingCode', '''SingCode = (case SingCode 
            when 'c' then 'к'
            when 'h' then 'г'
            when 'm' then 'м'
            when 'r' then 'р'
            when 're' then 'рэ'
            when 't' then 'т'
            when 'tg' then 'тг'
            when 'tr' then 'тр'
            end)''')

            query = f'''insert into Crystal.dbo.{table} 
({columns_str})
select {columns_str_with_mapped_sing}
from Crystal_en.dbo.{table}
'''
            if table == 'BibliogrLanguage':
                query += '''where BibliogrID in (SELECT BibliogrID 
FROM Crystal.dbo.BibliogrLanguage)'''

            print(query, file=f)
