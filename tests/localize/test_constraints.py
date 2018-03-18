from crystal.tables.constraints import list_default_constraints


def test_list_default_constraints():
    constraints = list_default_constraints('HeadTabl')
    constraint_columns = set(constraint['column_name'] for constraint in constraints)
    assert {'System', 'Expert', 'Help', 'Class'} == constraint_columns

