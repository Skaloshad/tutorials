# SQLite DESCRIBE TABLE #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-describe-table/

## Обзор ##############################

В этом руководстве вы узнаете о некоторых способах отображения структуры таблицы в SQLite.

## Получение структуры таблицы посредством командной строки SQLite

Для получения структуры таблицы путем командной строки SQLite следуйте следующим шагам:

1. Подключитесть к БД через командную строку:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sqlite3 c:\sqlite\db\chinook.db
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2. Затем выполните следующую команду:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.schema table_name
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Например, следующая команда выводит выражение, которое создает таблицу `albums`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.schema albums
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> Обратите внимание, что тут нет точки с запятой после названия таблицы. Если вы добавите точку с запятой, команда `.schema` подумает, что это часть названия таблицы `albums;` и не вернет ничего, так как такой таблицы не существует.

Вот вывод:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE IF NOT EXISTS "albums"
(
    [AlbumId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Title] NVARCHAR(160)  NOT NULL,
    [ArtistId] INTEGER  NOT NULL,
    FOREIGN KEY ([ArtistId]) REFERENCES "artists" ([ArtistId])
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_AlbumArtistId] ON "albums" ([ArtistId]);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Другой способ вывести структуру таблицы, это использовать команду `PRAGMA`. Для того чтобы использовать ее, введите следующие команды:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.header on
.mode column
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем используйте команду `PRAGMA`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pragma table_info('albums');
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ниже показан вывод команды:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cid  name      type           notnull  dflt_value  pk
---  --------  -------------  -------  ----------  --
0    AlbumId   INTEGER        1                    1
1    Title     NVARCHAR(160)  1                    0
2    ArtistId  INTEGER        1                    0
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Получение структуры таблицы через выражение SQL

Вы можете найти структуру таблицы путем выбора данных из таблицы `sqlite_schema` как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT sql
FROM sqlite_schema
WHERE name = 'albums';
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Вот вывод:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE "albums"
(
    [AlbumId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Title] NVARCHAR(160)  NOT NULL,
    [ArtistId] INTEGER  NOT NULL,
    FOREIGN KEY ([ArtistId]) REFERENCES "artists" ([ArtistId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---------------------------------------

Предидущее руководство < [SQLite SHOW TABLES][prev]  
Следующее руководство > [SQLite DUMP COMMAND][next]

[prev]: ../46_ShowTables/translate.md
[next]: ../48_DumpCommand/translate.md