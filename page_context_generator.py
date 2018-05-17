import json
from functools import partial

from common.db import db
from common.table import get_columns, find_table_pks, drop_computed_columns

PROPERTIES_QUERY = '''
select * from dbo.PropertiesLanguage 
join dbo.PropertiesInvariant 
on PropertiesLanguage.PropertiesID = PropertiesInvariant.NOMPROP 
where LanguageID = 1
'''


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

    if table_columns_without_pk:
        table_columns_without_pk_and_computed = drop_computed_columns(
            table,
            table_columns_without_pk
        )
    else:
        table_columns_without_pk_and_computed = table_columns_without_pk

    return table_columns_without_pk_and_computed


def build_context_for_table(table_with_properties, invariant_with_suffix=True):
    table, properties = table_with_properties

    try:
        language_table_columns = get_page_table_columns(f'{table}Language')
        try_remove(language_table_columns, f'{table}ID')
        try_remove(language_table_columns, f'LanguageID')
        try_remove(language_table_columns, 'HeadClue')
    except Exception:
        language_table_columns = []

    invariant_table_columns, has_references, has_sing = _extract_invariant_data(table, invariant_with_suffix)

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
        'has_sing': has_sing,
        'model_dir': properties['TableNameUrl'],
        'model_id': properties['NOMPROP']
    }

    return context


def _extract_invariant_data(table, with_suffix=True):
    invariant_table = table + ('Invariant' if with_suffix else '')

    invariant_table_columns = get_page_table_columns(invariant_table)
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

    return invariant_table_columns, has_references, has_sing


def _build_contexts(tables, table_properties, invariant_with_suffix=True):
    tables_with_properties = []

    for table in tables:
        if table == 'HeatExpn':
            tables_with_properties.append((table, table_properties['HeatExpn0']))
            tables_with_properties.append((table, table_properties['HeatExpn1']))
        elif table in table_properties:
            tables_with_properties.append((table, table_properties[table]))
        else:
            print(table)

    context_builder = partial(build_context_for_table, invariant_with_suffix=invariant_with_suffix)
    contexts = list(map(context_builder, tables_with_properties))
    return contexts


if __name__ == '__main__':
    with open('data/1_tables_with_types.json') as f:
        tables_with_types = json.load(f)

    HAS_RU_COLUMNS_tables = [
        table
        for table, type_ in tables_with_types.items()
        if table not in ['Bibliogr', 'LastModified', 'Properties', 'HeadTabl', 'SingTabl']
           and type_ == 'HAS_RU_COLUMNS'
    ]
    table_properties = {
        property_['TableName']: property_
        for property_ in db.query(PROPERTIES_QUERY)
    }
    contexts = _build_contexts(HAS_RU_COLUMNS_tables, table_properties)

    NO_RU_COLUMNS_tables = {'Wavepure', 'SistTabl', 'LitrTabl'}
    contexts.extend(_build_contexts(NO_RU_COLUMNS_tables, table_properties, invariant_with_suffix=False))

    with open('data/page_contexts.json', 'w', encoding='utf-8') as f:
        json.dump(contexts, f)
