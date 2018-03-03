ru_alphabet = 'йцукенгшщзхъфывапролджэячсмитьбюё'


def is_ru(value):
    return any(char_ in ru_alphabet for char_ in str(value))


def iter_len(iter_):
    return sum(1 for _ in iter_)
