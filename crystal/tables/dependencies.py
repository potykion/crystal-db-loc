from itertools import chain

from crystal.db import db


def list_columns_constraints(table, columns):
    default_constraints = list_default_constraints(table)
    column_default_constraints = [
        constraint['name']
        for constraint in default_constraints
        if constraint['column_name'] in columns
    ]

    other_constraints = list_table_constraints(table)
    column_table_constraints = [
        constraint['CONSTRAINT_NAME']
        for constraint in other_constraints
        if constraint['COLUMN_NAME'] in columns
    ]

    return set(column_default_constraints + column_table_constraints)


def list_table_constraints(table):
    return db.query(
        f"SELECT * FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE  WHERE TABLE_NAME='{table}'"
    )


def list_default_constraints(table):
    table_id = f"OBJECT_ID('{table}')"
    return db.query(
        f"select *, COL_NAME({table_id}, parent_column_id) as column_name "
        f"from sys.default_constraints WHERE parent_object_id = {table_id}"
    )


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


def delete_dependencies(table, columns, table_name=None):
    table_name = table_name or table
    constraints = sorted(list_columns_constraints(table, columns))
    drop_constraints = (
        f"ALTER TABLE dbo.{table_name} DROP CONSTRAINT {constraint};"
        for constraint in constraints
    )
    indexes = list_column_indexes(table, columns)
    drop_indexes = (
        f'DROP INDEX {index} ON {table_name};'
        for index in indexes
        if index not in constraints
    )
    drop_dependencies_str = '\n'.join(chain(drop_constraints, drop_indexes))

    if drop_dependencies_str:
        return f'''-- Удаляем ограничения и индексы
{drop_dependencies_str}'''
    else:
        return ''