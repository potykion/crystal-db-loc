import os

from crystal.tables.localize import identify_table_type, OnlyRuColumnsTableLocalizer, HasRuColumnsTableLocalizer
from crystal.tables.tables import fetch_table_names, filter_system_tables, create_id_pk, create_pk

DATABASE = os.getenv('DATABASE', 'Crystal')

COMMON_STUFF = '''-- Создаем таблицу для возможных языков
CREATE TABLE dbo.Languages (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(2)
);
-- Создаем языки
INSERT INTO dbo.Languages 
(Name)
VALUES
('ru'),  ('en');
GO
-- Отключаем триггеры        
sp_msforeachtable 'ALTER TABLE ? DISABLE TRIGGER all'
GO
'''

IS_EN_DB = DATABASE == 'Crystal_en'

if __name__ == '__main__':

    tables = list(filter_system_tables(fetch_table_names()))

    with open(f'scripts/{DATABASE}-translate.sql', encoding='utf-8', mode='w') as f:
        print(F'use {DATABASE};\n', file=f)

        if not IS_EN_DB:
            print(COMMON_STUFF, file=f)
            print(create_pk('DensTabl', 'ID'), file=f)

        for table in tables:
            type_ = identify_table_type(table)

            if type_ == 'ONLY_RU_COLUMNS':
                print(OnlyRuColumnsTableLocalizer(table).localize(), file=f)
            elif type_ == 'HAS_RU_COLUMNS':
                localized = HasRuColumnsTableLocalizer(table).localize()

                if table == 'ElemTabl' and IS_EN_DB:
                    localized = localized.replace(
                        'DROP INDEX IX_ElemTabl ON ElemTablInvariant;',
                        'ALTER TABLE dbo.ElemTablInvariant DROP CONSTRAINT U_ElemTabl;'
                    )

                print(localized, file=f)
