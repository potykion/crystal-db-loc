from crystal.id_tables.tables import LANGUAGE_TABLES_WITH_ID_PK
from crystal.tables.columns import drop_computed_columns, fetch_table_columns, get_primary_key


def upload_table_data(table):
    columns = drop_computed_columns(table, fetch_table_columns(table))
    pk = get_primary_key(table)
    if pk:
        columns.remove(pk)

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
    return f'''insert into Crystal.dbo.{table}
({columns_str})
select 
{columns_str_with_mapped_sing}
from Crystal_en.dbo.{table};'''


if __name__ == '__main__':
    with open('../../scripts/upload_tables.sql', 'w', encoding='utf-8') as f:
        for table in LANGUAGE_TABLES_WITH_ID_PK:
            print(upload_table_data(table), file=f)
