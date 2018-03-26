from crystal.id_tables.tables import LANGUAGE_TABLES_WITH_ID_PK, TABLES_WITH_NON_ID_PK


def add_language_id(database, language_id):
    add_language_id_str = '\n'.join(
        [
            f'ALTER TABLE dbo.{table} ADD LanguageID int NOT NULL DEFAULT({language_id});'
            for table in LANGUAGE_TABLES_WITH_ID_PK + TABLES_WITH_NON_ID_PK
        ]
    )
    return f'use {database};\n{add_language_id_str}'


if __name__ == '__main__':
    for database, language_id in [
        ('Crystal', 1),
        ('Crystal_en', 2),
    ]:
        with open(f'../../scripts/{database}_transfer_id_tables.sql', 'w') as f:
            print(add_language_id(database, language_id), file=f)
