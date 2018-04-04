from crystal.db import db
from crystal.tables.tables import filter_system_tables, fetch_table_names


def build_command(table, url):
    return f'''dotnet aspnet-codegenerator razorpage -m {table} -dc CrystalContext -udl -outDir Pages\Substances\{url} --referenceScriptLibraries'''


if __name__ == '__main__':
    properties = db.query('select * from PropertiesLanguage join PropertiesInvariant on PropertiesID=ID').all()
    property_tables = {
        property_['TableName']: property_['TableNameUrl']
        for property_ in properties
    }

    tables = list(filter_system_tables(fetch_table_names()))
    tables = [
        table
        for table in tables
        if any(table.startswith(property_table) for property_table in property_tables)
           and not table.endswith('Invariant')
    ]

    table_urls = {
        table: property_tables[table.strip('Language')]
        for table in tables
        if table.strip('Language') in property_tables
    }

    with open('scripts/codegen-pages.txt', 'w', encoding='utf-8') as f:
        for table, url in table_urls.items():
            print(build_command(table, url), file=f)
