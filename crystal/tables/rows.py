from typing import Iterable

from records import RecordCollection, Record

from crystal.db import db


def fetch_table_rows(table) -> Iterable[Record]:
    return db.query(f'SELECT * FROM {table}')
