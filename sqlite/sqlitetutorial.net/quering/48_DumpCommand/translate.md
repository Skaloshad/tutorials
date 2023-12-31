# SQLite DUMP COMMAND #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-dump/

## Обзор ##############################

В этом руководстве вы узнаете, как использовать команду SQLite `dump` для резервного копирования и восстановления БД.

SQLite посравляет инструмент `sqlite3`, который позволяет взаимодействовать с БД SQLite используя командную строку.

Используя инструмент `sqlite3` вы можете выполнять выражения SQLite для выбора и обновления в базе данных. Также, вы можете использовать так назывемые `dot` комманды, для выполнения различных полезных поераций с БД.

Одной из таких команд является команда `.dump`, которая позволяет делать резервную копию БД или таблицы в текстовый файл.

## Резервное копирование БД в файл, использую SQLite dump

Следующая команда открывает новое соединение с БД SQLite `chinook.db`:

~~~ cmd ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
C:\sqlite>sqlite3 c:\sqlite\chinook.db
sqlite>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Для резервного копирования БД в файл, используется команда `.dump`. Эта команда конвертирует структуру БД и данных SQLite в один текстовый файл.

По умолчанию, команда `.dump` выводит выражения SQL на экран. Для вывода в файл, используется команда `.output FILENAME`.

Следующая команда определяет выходной файл `chinook.sql` и выполняет резервное копирование БД `chinook.db` в файл `chinook.sql`:

~~~ cmd ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sqlite> .output ./chinook.sql
sqlite> .dump
sqlite> .exit
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Резервное копирование определенной таблицы

Для резервного копирования определенной таблицы, вы определяете название таблицы после команды `.dump`. Например, следующая команда сохраняет таблицу `albums` в файл `albums.sql`:

~~~ cmd ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sqlite> .output albums.sql
sqlite> .dump albums
sqlite> .quit
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Следующее изображение показывает содержание файла `albums.sql`:

![albums]

## Резервное копирование только структуры, используя `schema`

Для резервного копирования структуры БД, используется команда `.schema`.

Следующая команда задает выходной файл `chinook_stucture.sql` и сохраняет структуру таблиц в этот файл:

~~~ cmd ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sqlite> .output chinook_structure.sql
sqlite> .schema
sqlite> .quit
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ниже показано содержание файла `chinook_structure.sql`:

![chinook_structure]

## Резервное копирование одной или нескольких таблиц в файл

Для копирования данных таблицы в текстовый файл, следуйте следующим шагам:

1. Задайте режим `insert` используя команду `.mode`:

~~~ cmd ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sqlite> .mode insert
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

После этого, каздая инструкция `SELECT` будет выдавать результат как выражение `INSERT`, вместо чистых текстовых данных.

2. Задайте выходной файл вместо дефолтного вывода в консоль. Следующая команда задает выходной файл `data.sql`:

~~~ cmd ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sqlite> .output data.sql
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

3. Введите выражение `SELECT` которое выберет все данные из таблицы, которые вы хотите сохраниеть. Следующая команда возвращает данные из таблицы `artists`:

~~~ cmd ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sqlite> SELECT * FROM artists;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Проверьте файл `data.sql`, если все хорошо, вы увидите следующее:

![artists]

Для сохранения данных из других таблиц, вы можете выбрать из с помощью `SELECT`.

---------------------------------------

Предидущее руководство < [SQLite DESCRIBE TABLE][prev]  
Следующее руководство > [SQLite IMPORT CSV][next]

[prev]: ../47_DescribeTable/translate.md
[next]: ../49_ImportCSV/translate.md

[albums]: dump_albums.png
[chinook_structure]: chinook_structure.png
[artists]: atrists_data_dump.png