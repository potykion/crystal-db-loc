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
