import os

from crystal.id_tables.tables import TABLES_WITH_NON_ID_PK
from crystal.tables.localize import identify_table_type, OnlyRuColumnsTableLocalizer, HasRuColumnsTableLocalizer
from crystal.tables.tables import fetch_table_names, filter_system_tables, create_id_pk, create_pk

DATABASE = os.getenv('DATABASE', 'Crystal')

IS_EN_DB = DATABASE == 'Crystal_en'

if __name__ == '__main__':

    if IS_EN_DB:
        tables = TABLES_WITH_NON_ID_PK
    else:
        tables = list(filter_system_tables(fetch_table_names()))

    with open(f'scripts/{DATABASE}-translate.sql', encoding='utf-8', mode='w') as f:
        print(F'use {DATABASE};\nGO\n', file=f)

        for table in tables:
            type_ = identify_table_type(table)

            if type_ == 'ONLY_RU_COLUMNS':
                print(OnlyRuColumnsTableLocalizer(table).localize(), file=f)
            elif type_ == 'HAS_RU_COLUMNS':
                localized = HasRuColumnsTableLocalizer(table).localize()
                print(localized, file=f)
