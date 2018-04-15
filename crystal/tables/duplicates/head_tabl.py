from crystal.tables.duplicates.fk import delete_duplicates
from crystal.tables.tables import list_related_tables

if __name__ == '__main__':
    head_tabl = 'HeadTablInvariant'
    sing_tabl = 'SingTabl'
    head_tabl_related = dict(list_related_tables(head_tabl))
    sing_tabl_related = {table: column for table, column in list_related_tables(sing_tabl) if column != 'SingCode'}
    related = {**head_tabl_related, **sing_tabl_related}.items()
    print(delete_duplicates(head_tabl, related))
