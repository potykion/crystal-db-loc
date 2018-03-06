from crystal.tables.localize import identify_table_type, localize_only_ru_columns_table, localize_has_ru_columns_table
from crystal.tables.tables import fetch_table_names, filter_system_tables

if __name__ == '__main__':

    tables = list(filter_system_tables(fetch_table_names()))

    with open('translate.sql', encoding='utf-8', mode='w') as f:
        print('use Crystal;', file=f)
        for table in tables:
            type_ = identify_table_type(table)

            if type_ == 'ONLY_RU_COLUMNS':
                print(localize_only_ru_columns_table(table), file=f)
            elif type_ == 'HAS_RU_COLUMNS':
                print(localize_has_ru_columns_table(table), file=f)
