from datetime import date

from crystal.tables.localize import identify_table_type, OnlyRuColumnsTableLocalizer, HasRuColumnsTableLocalizer
from crystal.tables.tables import fetch_table_names, filter_system_tables

if __name__ == '__main__':

    tables = list(filter_system_tables(fetch_table_names()))

    with open(f'scripts/translate-{date.today()}.sql', encoding='utf-8', mode='w') as f:
        print('use Crystal;', file=f)
        for table in tables:
            type_ = identify_table_type(table)

            if type_ == 'ONLY_RU_COLUMNS':
                print(OnlyRuColumnsTableLocalizer(table).localize(), file=f)
            elif type_ == 'HAS_RU_COLUMNS':
                print(HasRuColumnsTableLocalizer(table).localize(), file=f)

        print('''
        --- Добавим primary key для DensTablLanguage 
        ALTER TABLE DensTablLanguage ADD PRIMARY KEY (ID);

        -- Создаем таблицу для возможных языков
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
        ''', file=f)
