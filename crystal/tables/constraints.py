from crystal.db import db


def list_constraints(table):
    return db.query(f"SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME='{table}'")


def filter_unique_constraints(constraints):
    return (
        constraint
        for constraint in constraints
        if constraint['CONSTRAINT_TYPE'] == 'UNIQUE'
    )
