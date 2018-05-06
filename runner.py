import os
import subprocess
from contextlib import contextmanager


@contextmanager
def set_eng_db(fake=False):
    if fake:
        os.environ['FAKE'] = '1'
    else:
        os.environ['DATABASE'] = 'Crystal_en'

    yield

    os.environ.pop('FAKE', None)
    os.environ['DATABASE'] = 'Crystal'


def stage_1():
    subprocess.call('python 0_tables.py')
    subprocess.call('python 1_table_types.py')
    subprocess.call('python 2_drop_constraints.py')
    with set_eng_db():
        subprocess.call('python 2_drop_constraints.py')
    subprocess.call('python 3_languages.py')
    with set_eng_db():
        subprocess.call('python 3_languages.py')


def stage_2():
    subprocess.call('python 4_tables_without_pks.py')
    with set_eng_db():
        subprocess.call('python 4_tables_without_pks.py')


def stage_3():
    subprocess.call('python 5_localize.py')
    with set_eng_db(fake=True):
        subprocess.call('python 5_localize.py')

def stage_4():
    subprocess.call('python 6_upload.py')
    subprocess.call('python 7_duplicates.py')
    subprocess.call('python 8_unique_indexes.py')

if __name__ == '__main__':
    # stage_1()
    # stage_2()
    # stage_3()
    stage_4()