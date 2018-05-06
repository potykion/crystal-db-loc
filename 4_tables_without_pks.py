import json

from common.config import DATABASE
from common.table import find_tables_pks, get_columns, drop_computed_columns


def find_tables_without_pks(tables, table_pks):
    return [
        table
        for table in tables
        if not table_pks[table] or
           'HeadClue' in table_pks[table] and table not in ['SingTabl', 'HeadTabl']
    ]


if __name__ == '__main__':
    with open('data/1_tables_with_types.json') as f:
        tables_with_types = json.load(f)

    tables = [
        table
        for table, type_ in tables_with_types.items()
        if type_ != 'NO_RU_COLUMNS'
    ]
    table_pks = find_tables_pks(tables)

    tables_without_pk = find_tables_without_pks(tables, table_pks)
    with open(F'data/4_tables_without_pks [{DATABASE}].json', 'w') as f:
        json.dump(tables_without_pk, f)

    if DATABASE == 'Crystal_en':
        with open('sql/4_tables_without_pks [Crystal_en].sql', 'w', encoding='utf-8') as f:
            print('''use Crystal_en;
GO''', file=f)
            for table in tables_without_pk:
                columns = get_columns(table)
                columns_without_computed = drop_computed_columns(table, columns)

                columns_str = ', '.join(columns_without_computed)
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
select 
{columns_str_with_mapped_sing}
from Crystal_en.dbo.{table};
'''
                print(query, file=f)
