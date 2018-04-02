from crystal.tables.columns import get_primary_key, fetch_table_columns
from crystal.tables.tables import filter_system_tables, fetch_table_names


def create_compatibility_view(table):
    invariant_table = f'{table}Invariant'
    invariant_table_pk = get_primary_key(invariant_table)

    invariant_table_columns = list(fetch_table_columns(invariant_table))
    invariant_table_columns.remove(invariant_table_pk)
    invariant_table_columns.append(f'{invariant_table}.{invariant_table_pk}')

    language_table = f'{table}Language'
    language_table_pk = get_primary_key(language_table)
    language_table_fk = f'{table}ID'

    language_table_columns = list(fetch_table_columns(language_table))
    language_table_columns.remove('LanguageID')
    language_table_columns.remove(language_table_pk)
    language_table_columns.remove(language_table_fk)
    if 'SystemUrl' in language_table_columns:
        language_table_columns.remove('SystemUrl')

    columns_str = ', '.join([*language_table_columns, *invariant_table_columns])

    return f'''CREATE VIEW dbo.{table}
WITH SCHEMABINDING
AS select {columns_str}
from dbo.{language_table}
join dbo.{invariant_table} on
{table}Language.{language_table_fk} = {table}Invariant.{invariant_table_pk}
where LanguageID = 1'''


def create_language_compatibility_view(table):
    table_without_language = table.strip('Language')

    columns = list(fetch_table_columns(table))
    columns.remove('LanguageID')
    columns_str = ', '.join(columns)

    return f'''CREATE VIEW dbo.{table_without_language}
WITH SCHEMABINDING
AS select {columns_str}
from dbo.{table}
where LanguageId = 1'''


if __name__ == '__main__':
    tables = list(filter_system_tables(fetch_table_names()))

    language_tables = [
        table
        for table in tables
        if table.endswith('Language')
    ]

    target_split_tables = []
    target_language_tables = []
    for table in language_tables:
        table_without_language = table.strip('Language')
        table_has_invariant_analogue = [table for table in tables if table.startswith(table_without_language)] == \
                                       [f'{table_without_language}Language', f'{table_without_language}Invariant', ]

        if table_has_invariant_analogue:
            target_split_tables.append(table_without_language)
        else:
            target_language_tables.append(table)

    with open('../../scripts/compatibility.sql', 'w', encoding='utf-8') as f:
        print('use Crystal;', file=f)
        print('GO', file=f)

        for table in target_split_tables:
            print(create_compatibility_view(table), file=f)
            print('GO', file=f)

        for table in target_language_tables:
            print(create_language_compatibility_view(table), file=f)
            print('GO', file=f)
