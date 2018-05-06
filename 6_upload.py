from common.file_utils import from_json
from common.table import get_columns, drop_computed_columns

if __name__ == '__main__':
    tables = from_json('data/0_tables.json')
    tables_without_pk = from_json('data/4_tables_without_pks [Crystal_en].json')
    tables_with_types = from_json('data/1_tables_with_types.json')

    # ['Bibliogr', 'ElemTablNew', 'HeadTabl', 'Properties']
    tables_to_upload = [
        table
        for table in tables
        if table not in tables_without_pk
           and tables_with_types[table] != 'NO_RU_COLUMNS'
    ]

    with open('sql/6_upload [Crystal_en].sql', 'w', encoding='utf-8') as f:
        print('''use Crystal_en;
GO
''', file=f)
        for table in tables_to_upload:
            language_table = f'{table}Language'
            columns = get_columns(language_table)

            columns_to_upload = drop_computed_columns(language_table, columns)
            if 'ID' in columns_to_upload:
                columns_to_upload.remove('ID')

            columns_str = ', '.join(columns_to_upload)
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

            query = f'''insert into Crystal.dbo.{language_table}
({columns_str})
select 
{columns_str_with_mapped_sing}
from Crystal_en.dbo.{language_table}
'''
            if language_table == 'BibliogrLanguage':
                query += '''where BibliogrID in (SELECT BibliogrID 
FROM Crystal.dbo.BibliogrLanguage)
'''

            query += ';'

            print(query, file=f)
