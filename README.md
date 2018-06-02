# crystal-db-loc

Скрипты для реструктуризации базы данных.

# Запуск

Для запуска необходимо установить зависимости из файла requirements.txt и выполнить файл runner.py.

Запуск файла runner.py необходимо осуществить в 4 этапа (каждый этап - функция, например, stage_1),  
после выполнения каждого этапа необходимо выполнить сгенерированные скрипты хранящиеся в директории /sql.

Например, при выполнении этапа 1 (stage_1) генерируются скрипты:
```
2_drop_constraints [Crystal].sql
2_drop_constraints [Crystal_en].sql
3_languages [Crystal].sql
3_languages [Crystal_en].sql
```

После их выполнения необходимо выполнить этап 2 (stage_2), и выполнить скрипты:
```
4_tables_without_pks [Crystal].sql
4_tables_without_pks [Crystal_en].sql
```

И т.д.

# Описание скриптов реструктуризации

- 0_tables.py - выгрузка всех таблиц из бд без учета системных таблиц
- 1_table_types.py - определние типов таблиц 
- 2_drop_constraints.py - удаление ограничений, отключение триггеров
- 3_languages.py - добавление столбца-языка
- 4_tables_without_pks.py - поиск таблиц без первичного ключа, добавление ключа для Crystal-таблиц, загрузка таблиц без первисного ключа из Crystal_en.
- 5_localize.py - реализация многоязычности, посредством разделения таблицы на таблицу-инвариант и языковую таблицу 
- 6_upload.py - загрузка таблиц с первичным ключом из Crystal_en
- 7_duplicates.py - поисл у удаление дубликатов
- 8_unique_indexes.py - создание уникальных индексов
- 9_views.py - создание представлений для обеспечения совместимости со старым сайтом

# Дополнительные скрипты

- page_context_generator.py - генерация данных, необходимых для генерации страниц в [crystal-pages](https://github.com/potykion/crystal-pages)