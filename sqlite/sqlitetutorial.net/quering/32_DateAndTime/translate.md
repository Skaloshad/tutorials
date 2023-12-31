# SQLite DATE & TIME #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-date/

## Обзор ##############################

В этом руководстве мы покажим вам, как работать со значениями даты и времени SQLite и использовать встроенные функции обработки даты и время.

SQLite не поддерживает встроенные хранимые классы даты и времени. Вместо этого он использует некоторые встроенные функции даты и время для применения других хранимых классов, таких как `TEXT`, `REAL` и `INTEGER` для хранения значений даты и время.

## Использованеие хранимого класса `TEXT` для хранения даты и время SQLite

Если вы используете хранимый класс `TEXT` для хранения даты и время, вы должны использовать текстовый формат ISO8601 как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
YYYY-MM-DD HH:MM:SS.SSS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Например, `2016-01-01 10:20:05.123`

Для начала, создадим новую таблицу под названием `datetime_text`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE datetime_text (
  d1 TEXT,
  d2 TEXT
);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Таблица содержит два столбца `d1` и `d2` с типом данных `TEXT`.

Для вставки значений даты и время в таблицу `datetime_text` используйте функцию `DATETIME`.

Например, для получения текущего значения даты и времени UTC, нужно передать строковый литерал в функцию:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT datetime('now');
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Для получения локального времени, вы должны передать дополнительный аргумент `localtime`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT datetime('now', 'localtime');
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Далее, вставим значения даты и время в таблицу `datetime_text`, как показано далее: 

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO datetime_text (d1, d2)
VALUES
  ( datetime('now'), datetime('now', 'localtime') );
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем выберем данные из таблицы `datetime_text`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  d1,
  typeof(d1),
  d2,
  typeof(d2)
FROM
  datetime_text;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Использование хранимого класса `REAL` для хранения значений даты и время.

Вы можете использовать класс `REAL` для хранения значений даты и время как нумерацию дней по [Юлианскому календарю][Julian], которая ведет отсчет от полудня по Гринвичу 24 ноября 4714 года до нашей эры по пролептическому григорианскому календарю.

Давайте посмотрим на пример использования класса `REAL` для хранения даты и время.

Для начала создадим таблицу под названием `datetime_real`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE tatetime_real (
    d1 real
);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Далее, вставим текущую дату и время в таблицу `datetime_real`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO datetime_real (d1)
VALUES ( julianday('now') );
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Мы спользуем функцию `juliandat()` для преобразования текущей даты и время в день по Юлианскому календарю.

Далее, выберем данные из таблицы `datetime_real`

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT d1 FROM datetime_real;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Вывод не человекочитаем.

К счастью вы можете использовать встроенные функции `date()` и `time()` для формата значений даты и времен как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  date(d1),
  time(d1)
FROM
  datetime_real;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Использование класса `INTEGER` для хранения значений даты и время.

Кроме классов `TEXT` и `REAL` вы можете использовать класс `INTEGER` для хранения значений даты и время.

Чаще всего класс `INTEGER` используется для хранения времени UNIX, которое представляет из себя число секунд с `1970-01-01 00:00:00 UTC`. Посмотрите следующий пример:

Для начала создадим таблицу, которая имеет один столбец с типом `INTEGER` для хранения значений даты и время.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE datetime_int (d1 int);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Далее, вставим текущую дату и время в таблицу `datetime_int`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO datetime_int (d1)
VALUES ( strftime('%s', 'now') );
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Далее выберем данные из таблицы `datetiem_int`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT d1 FROM datetime_int;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Для формата результата, вы можете использовать встроенную функцию `datetime()` как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT datetime(d1, 'unixepoch')
FROM datetime_int;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Используя SQLite вы свободно можете выбирать тип данных для хранения значений даты и времени и использовать встроенные функции даты и времени для преобразования между форматами.

Для более детальной информации о функциях даты и времени SQLite, посмотрите [статью][dateTime].

В этом руководстве вы изучили, как использовать классы `TEXT`, `REAL` и `INTEGER` для хранения значений даты и времени. Дополнительно, вы изучили, как использовать встроенные функции даты и времени для преобразования даты и времени в читаемые форматы.

---------------------------------------

Предидущее руководство < [SQLite DATA TYPES][prev]  
Следующее руководство > [SQLite ATTACH DATABASE][next]

[prev]: ../31_DataTypes/translate.md
[next]: ../33_AttachDatabase/translate.md

[Julian]: https://en.wikipedia.org/wiki/Julian_day
[dateTime]: https://www.sqlitetutorial.net/sqlite-date-functions/