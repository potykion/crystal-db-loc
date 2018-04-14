# Info

Script generators for Crystal DB multi-language support.

# Script execution order

## Preparations
1. Disable triggers, create PK for DensTabl: prepare.sql
2. Drop all unique indexes: delete_indexes_Crystal.sql; delete_indexes_Crystal_en.sql

## Localization
1. Create Language table: language_table_Crystal.sql
2. Add language id - add_laguage_id_Crystal.sql; add_laguage_id_Crystal_en.sql
3. Upload tables with id pk from en db to ru db - upload_tables.sql
4. Apply localization script - Crystal-translate.sql; Crystal_en-translate.sql
5. Upload rest of language tables from en db to ru db - Crystal_en-to-Crystal.sql

## Delete duplicates
1. Delete duplicates and update FK from Invariant tables - delete_duplicates.sql;
2. Delete duplicates from Language tables - language_duplicates.sql
3. Add unique indexes - unique.sql

## Compatibility and add new data
1. Create compatibility views: compatibility.sql
2. Add new url-columns - url.sql

# References

1. [SQL Server Disabling All Triggers](https://stackoverflow.com/questions/7176720/sql-server-disabling-all-triggers-cannot-find-the-object-xxxx-because-it-doe)
2. [Delete duplicates and update FK](http://weblogs.sqlteam.com/jeffs/archive/2004/10/07/2190.aspx)
3. [Delete duplicates](https://stackoverflow.com/questions/18932/how-can-i-remove-duplicate-rows)
4. [Insert as case](https://stackoverflow.com/questions/44976581/sql-add-a-new-column-based-on-case-expression-and-looking-up-values-from-anothe?rq=1)
5. [How can foreign key constraints be temporarily disabled using T-SQL?](https://stackoverflow.com/questions/159038/how-can-foreign-key-constraints-be-temporarily-disabled-using-t-sql?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)