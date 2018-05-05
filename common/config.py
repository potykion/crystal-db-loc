import os

DATABASE = os.getenv('DATABASE', 'Crystal')
LANGUAGE = 1 if DATABASE == 'Crystal' else 2
