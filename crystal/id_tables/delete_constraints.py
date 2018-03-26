from crystal.id_tables.tables import LANGUAGE_TABLES_WITH_ID_PK, TABLES_WITH_NON_ID_PK
from crystal.tables.columns import filter_system_columns, fetch_text_columns
from crystal.tables.dependencies import delete_dependencies


def delete_constraints(database, tables):
    for table in tables:
        text_columns = list(filter_system_columns(fetch_text_columns(table)))
        delete_command = delete_dependencies(table, text_columns)

        if table == 'ElemTabl' and database == 'Crystal_en':
            delete_command = delete_command.replace(
                'DROP INDEX IX_ElemTabl ON ElemTabl;',
                'ALTER TABLE dbo.ElemTabl DROP CONSTRAINT U_ElemTabl;'
            )

        yield delete_command


if __name__ == '__main__':
    for database, tables in [
        ('Crystal', LANGUAGE_TABLES_WITH_ID_PK + TABLES_WITH_NON_ID_PK),
        ('Crystal_en', TABLES_WITH_NON_ID_PK)
    ]:
        with open(f'../../scripts/delete_constraints_{database}.sql', 'w', encoding='utf-8') as f:
            print(f'use {database};', file=f)
            for delete_command in delete_constraints(database, tables):
                print(delete_command, file=f)
