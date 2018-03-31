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
2. [Delete duplicates and update FK](http://weblogs.sqlteam.com/jeffs/archive/2004/10/07/2190.aspx)
3. [Delete duplicates](https://stackoverflow.com/questions/18932/how-can-i-remove-duplicate-rows)