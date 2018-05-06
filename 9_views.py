from common.file_utils import from_json
from common.table import find_table_pks, get_columns


def create_compatibility_view(table):
    invariant_table = f'{table}Invariant'
    invariant_table_pk = find_table_pks(invariant_table)[0]

    invariant_table_columns = get_columns(invariant_table)
    invariant_table_columns.remove(invariant_table_pk)
    invariant_table_columns.append(f'{invariant_table}.{invariant_table_pk}')

    language_table = f'{table}Language'
    language_table_pk = find_table_pks(language_table)[0]
    language_table_fk = f'{table}ID'

    language_table_columns = get_columns(language_table)
    language_table_columns.remove('LanguageID')
    language_table_columns.remove(language_table_pk)
    language_table_columns.remove(language_table_fk)

    columns_str = ', '.join([*language_table_columns, *invariant_table_columns])

    return f'''CREATE VIEW dbo.{table}
WITH SCHEMABINDING
AS select {columns_str}
from dbo.{language_table}
join dbo.{invariant_table} on
{table}Language.{language_table_fk} = {table}Invariant.{invariant_table_pk}
where LanguageID = 1
go'''


def create_language_compatibility_view(table):
    table_without_language = table
    table = f'{table}Language'

    columns = get_columns(table)
    columns.remove('LanguageID')
    columns_str = ', '.join(columns)

    return f'''CREATE VIEW dbo.{table_without_language}
WITH SCHEMABINDING
AS select {columns_str}
from dbo.{table}
where LanguageId = 1
go'''


if __name__ == '__main__':
    tables_with_types = from_json('data/1_tables_with_types.json')

    with open('sql/9_views [Crystal].sql', 'w', encoding='utf-8') as f:
        print('use Crystal;', file=f)
        print('GO', file=f)

        for table, type_ in tables_with_types.items():
            if type_ == 'HAS_RU_COLUMNS':
                view_str = create_compatibility_view(table)
            elif type_ == 'ONLY_RU_COLUMNS':
                view_str = create_language_compatibility_view(table)
            else:
                continue

            print(view_str, file=f)
