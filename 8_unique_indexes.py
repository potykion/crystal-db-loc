from common.config import DATABASE
from common.table import get_tables, get_columns, find_table_pks, drop_related_computed_columns

IGNORE_TABLES = [
    'RefrTabl',
    'Languages',
    'Bibliogr'
]


def create_unique_index(table):
    columns = get_columns(table)
    pk = find_table_pks(table)[0]
    columns.remove(pk)
    columns = drop_related_computed_columns(columns, table)

    columns_str = ', '.join(columns)
    create_unique_constraint = f'ALTER TABLE {table} ADD CONSTRAINT U_{table} UNIQUE ({columns_str})'
    return create_unique_constraint


if __name__ == '__main__':
    tables = get_tables()
    tables = [
        table
        for table in tables
        if (table.endswith('Language') or table.endswith('Invariant'))
           and not any(table.startswith(ignore_table) for ignore_table in IGNORE_TABLES)
    ]

    with open(F'sql/8_unique_indexes [{DATABASE}].sql', 'w', encoding='utf-8') as f:
        print(f'use {DATABASE};\ngo\n', file=f)
        for table in tables:
            if table == 'GrafTablLanguage' or table == 'ConstSelInvariant':
                continue

            print(create_unique_index(table), file=f)

        print('''alter table dbo.ConstSelInvariant
add [__Equation] as (left([Equation],(50)));
go
ALTER TABLE ConstSelInvariant ADD CONSTRAINT U_ConstSelInvariant UNIQUE (HeadClue, SingCode, __Equation, NazvSel, ZnachSel, Bknumber)
go''', file=f)
        print('''alter table dbo.GrafTablLanguage
add [__Signatur] as (left([Signatur],(50)));
go
ALTER TABLE GrafTablLanguage ADD CONSTRAINT U_GrafTablLanguage UNIQUE (GrafTablID, LanguageID, NameGraf, __Signatur)
go
''', file=f)
