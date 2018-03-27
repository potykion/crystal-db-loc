# Info

Script generators for Crystal DB multi-language support.

# Script execution order

1. Add language id - Crystal_transfer_id_tables.sql; Crystal_en_transfer_id_tables.sql
2. Delete constrains - delete_constraints_Crystal.sql; delete_constraints_Crystal_en.sql
3. Upload tables with id pk from en db to ru db - upload_tables.sql
4. Apply localization script - Crystal-translate.sql; Crystal_en-translate.sql
5. Upload rest of language tables from en db to ru db - Crystal_en-to-Crystal.sql

# References

1. [SQL Server Disabling All Triggers](https://stackoverflow.com/questions/7176720/sql-server-disabling-all-triggers-cannot-find-the-object-xxxx-because-it-doe)