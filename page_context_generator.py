import json

from common.table import get_columns, find_table_pks, drop_computed_columns


def try_remove(list_, item):
    try:
        list_.remove(item)
    except ValueError:
        pass


def get_page_table_columns(table):
    table_columns_without_pk = [
        field
        for field in get_columns(table)
        if field not in find_table_pks(table)
    ]
    table_columns_without_pk_and_computed = drop_computed_columns(
        table,
        table_columns_without_pk
    )
    return table_columns_without_pk_and_computed


def build_context_for_table(table):
    language_table_columns = get_page_table_columns(f'{table}Language')
    try_remove(language_table_columns, f'{table}ID')
    try_remove(language_table_columns, f'LanguageID')

    invariant_table_columns = get_page_table_columns(f'{table}Invariant')
    try_remove(invariant_table_columns, 'HeadClue')

    if 'SingCode' in invariant_table_columns:
        try_remove(invariant_table_columns, 'SingCode')
        has_sing = True
    else:
        has_sing = False

    if 'Bknumber' in invariant_table_columns:
        has_references = True
        try_remove(invariant_table_columns, 'Bknumber')
    else:
        has_references = False

    context = {
        'model': table,
        'language_fields': [
            {'name': field, 'raw': False}
            for field in language_table_columns
        ],
        'invariant_fields': [
            {'name': field, 'raw': False}
            for field in invariant_table_columns
        ],
        'has_references': has_references,
        'has_sing': has_sing
    }

    return context


if __name__ == '__main__':
    with open('data/1_tables_with_types.json') as f:
        tables_with_types = json.load(f)

    split_tables = [
        table
        for table, type_ in tables_with_types.items()
        if type_ == 'HAS_RU_COLUMNS' and
           table not in ['Bibliogr', 'LastModified', 'Properties']
    ]

    contexts = list(map(build_context_for_table, split_tables))

    with open('data/page_contexts.json', 'w', encoding='utf-8') as f:
        json.dump(contexts, f)
