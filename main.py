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

        print('ALTER TABLE DensTablLanguage ADD PRIMARY KEY (ID);', file=f)
        print('''
        -- Создаем таблицу для возможных языков
        CREATE TABLE dbo.Languages (
            ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
            Name varchar(2)
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
        ''')