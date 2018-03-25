from crystal.id_tables.tables import LANGUAGE_TABLES_WITH_ID_PK
from crystal.tables.columns import filter_system_columns, fetch_text_columns
from crystal.tables.dependencies import delete_dependencies


def delete_constraints():
    for table in LANGUAGE_TABLES_WITH_ID_PK:
        text_columns = list(filter_system_columns(fetch_text_columns(table)))
        yield delete_dependencies(table, text_columns)


if __name__ == '__main__':
    with open('../../scripts/delete_constraints.sql', 'w', encoding='utf-8') as f:
        print('use Crystal;', file=f)
        for delete_command in delete_constraints():
            print(delete_command, file=f)
