# SQLite IMPORT CSV #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-import-csv/

## Обзор ##############################

В этом руководстве вы узнаете несколько способов импорта данных из CSV файла в таблицы SQLite: используя sqlite3 и инструменты SQLite Studio.

## Импорт CSV файла искользуя sqlite3

В первом сценарии, вы хотите импортировать данные из файла CSV в таблицу, которая не существует в БД SQLite:

1. Сначала sqlite3 создаст таблицу. Она использует первую строку CSV файла как имена столбцов.
2. Затем, sqlite3 импортирует данные из CSV файла в табилцу.

Мы будем импортировать CSV файл под названием `city.csv`, который имеет две колонки: `name` и `product`. Вы можете скачать его по [ссылке][city_csv] для тренировки.

Для импорта `city.csv` в таблицу, выполните следуюшее:

1. Задайте режим SQLite как csv, для взамиодействия с файлом как csv. Чтобы выполнить это используйте команду `.mode` как показано ниже:

```````````````````````````````````````
sqlite> .mode csv
```````````````````````````````````````

2. Используйте команду `.import FILE TABLE` для импорта из файла `city.csv` в таблицу `cities`:

```````````````````````````````````````
sqlite> .import city.csv cities
```````````````````````````````````````

Для проверки импорта используйте команду `.schemas` для отображения структуры таблицы `cities`:

``````````````````````````````````````` SQL
sqlite> .schema cities
CREATE TABLE cities (
  name TEXT,
  population TEXT
);
```````````````````````````````````````

Для отображения данных используйте следующее выражение:

``````````````````````````````````````` SQL
SELECT
  name,
  population
FROM
  cities;
```````````````````````````````````````

Во втором сценарии, табилца уже существует в БД и вам нужно только импортировать данные.

1. Удалите таблицу `cities`, которую создали выше:

```````````````````````````````````````
DROP TABLE IF EXISTS cities;
```````````````````````````````````````

2. Используйте следующее выражение для сождания таблицы:

``````````````````````````````````````` SQL
CREATE TABLE cities (
  name TEXT NOT NULL,
  population INTEGER NOT NULL
);
```````````````````````````````````````

В случае когда таблица уже существует, sqlite3 использует первую строку файла как данные. Поэтому вы должны удалить первую строку с названием столбцов.

Следующая команда импортирует файл `city_without_header.csv` в таблицу `cities`:

```````````````````````````````````````
sqlite> .mode csv
sqlite> .import city_without_header.csv` cities
```````````````````````````````````````

## Импорт CSV файл в таблицу, используя SQLite Studio

Большинство инструментов SQLite GUI поддерживают импорт в форматах CSV, tab-delimited формат и т.д.

Мы будем использовать SQLite Studio для демонстрации импорта CSV файла в таблицу, предполагая, что таблица для импорта уже существует.

1. Выберите пункт меню Tools

2. Выберите БД и таблицу в которую планируете производить импорт

3. Выберите тип импорта (`CSV`), файл, кодировку, и разделитель (`,`)

---------------------------------------

Предидущее руководство < [SQLite DUMP COMMAND][prev]  
Следующее руководство > [SQLite EXPORT CSV][next]

[prev]: ../48_DumpCommand/translate.md
[next]: ../50_ExportCSV/translate.md

[city_csv]: https://www.sqlitetutorial.net/wp-content/uploads/2016/05/city.csv