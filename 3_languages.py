import json

from common.config import DATABASE, LANGUAGE

if __name__ == '__main__':
    with open('data/1_tables_with_types.json') as f:
        tables_with_types = json.load(f)

    tables_with_language_data = [
        table
        for table, type_ in tables_with_types.items()
        if type_ != 'NO_RU_COLUMNS'
    ]

    add_language_str = '\n'.join(
        f'ALTER TABLE dbo.{table} ADD LanguageID int NOT NULL CONSTRAINT DF_{table}_LanguageID DEFAULT({LANGUAGE});'
        for table in tables_with_language_data
    )

    with open(f'sql/3_languages [{DATABASE}].sql', 'w') as f:
        print(f'''use {DATABASE};
GO
CREATE TABLE dbo.Languages (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(2)
);
INSERT INTO dbo.Languages
(Name)
VALUES
('ru'),  ('en');
GO
{add_language_str}''', file=f)
