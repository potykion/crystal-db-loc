from crystal.db import db


def list_column_indexes(table, columns):
    query = f'''
    SELECT i.name AS index_name  
      ,COL_NAME(ic.object_id,ic.column_id) AS column_name  
      ,ic.index_column_id  
      ,ic.key_ordinal  
      ,ic.is_included_column  
    FROM sys.indexes AS i  
    INNER JOIN sys.index_columns AS ic   
      ON i.object_id = ic.object_id AND i.index_id = ic.index_id  
    WHERE i.object_id = OBJECT_ID('{table}');  
    '''
    indexes = db.query(query)
    return set(
        index['index_name']
        for index in indexes
        if index['column_name'] in columns
    )
