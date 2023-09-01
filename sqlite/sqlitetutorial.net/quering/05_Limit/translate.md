# SQLite LIMIT ########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-limit/

## Обзор ##############################

В этом руководстве вы изучите, как использовать предложение SQLite `LIMIT` для ограничения числа строк, возвращенных запросом.

## Знакомство с предложением SQLite `LIMIT`

Предложение `LIMIT` является необязательной частью оператора `SELECT`. Преложение `LIMIT` используется для ограничения количества строк, возвращаемвх запросом.

Например, оператор `SELECT` может вернуть один миллион строк. Однако, если вам нужно только 10 первых строк результирующего набора, вы можете добавить предложение `LIMIT` к оператору `SELECT` для получения 10 строк.

Ниже приведен пример синтаксиса предложения `LIMIT`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  columv_list
FROM
  table
LIMIT row_count;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`row_count` это позитивное целое число, которое указывает на число возвращаемых строк.

Например, для получения первых 10 строк из таблицы `tracks`, используется следующее выражение:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  trackId,
  name
FROM
  tracks
LIMIT 10;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Если вы хотите получить первые 10 строк, начиная с 10ой строки результирующего набора, используйте ключевое слово `OFFSET` как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  column_list
FROM
  table
LIMIT row_count OFFSET offset;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Или вы можете использовать следующий короткий синтаксис предложения `LIMIT OFFSET`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  column_list
FROM
  table
LIMIT offset, row_count;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Например, чтобы получить из таблицы `tracks` 10 строк, начиная с 11ой строки, используйте слудующее выражение:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  trackId,
  name
FROM
  tracks
LIMIT 10 OFFSET 10;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Обычно `OFFSET` находит приминение в веб-приложениях для постраничного вывода данных.

## Предложения SQLite `LIMIT` и `ORDER BY`

Вы всегда должны использовать предложение `LIMIT` с предложением `ORDER BY`. Потому что вы хотите получать число строк в определенном порядке, а не в неопределенном порядке.

Предложение `ORDER BY` располагается перед предложением `LIMIT` в операторе `SELECT`. SQLite отсортирует результирующий набор до получения количества строк указанного в предложении `LIMIT`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  column_list
FROM
  table
ORDER BY column_1
LIMIT row_count;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Например, чтобы получить 10 самых больших по размеру треков, используется следующий запрос:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  trackId,
  name,
  bytes
FROM
  tracks
ORDER BY
  bytes DESC
LIMIT 10;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Чтобы получить 5 самых коротких трека, вы должны отсортировать треки по длинне, указанной в столбце `milliseconds`, используя предложение `ORDER BY` и взять первые 5 строк, используя предложение `LIMIT`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  trackId,
  name,
  milliseconds
FROM
  tracks
ORDER BY
  milliseconds ASC
LIMIT 5;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Получение n-ого наибольшего и наименьшего значения

Вы можете использовать предложения `ORDER BY` и `LIMIT` для получения n-ого наибольшего и наименьшего значения строк. Например, вы можете хотеть узнать второй по продолжительности трек, третий кратчайший терк и т.д.

Чтобы это сделать используйте следующие шаги:

1. Во-первых, в солучае получения наименьшего n-ого значения, используйте `ORDER BY` для сортировки результата в порядке возрастания, или в порядке убывания, для получения n-ого наибольшего значения.
2. Во-вторых, используйте `LIMIT OFFSET` для получения n-ой наибольшей или n-ой наименьшей строки.

Следующее выражение возвращает второй по продолжительности трек из таблицы `tracks`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  trackId,
  name,
  milliseconds
FROM
  tracks
ORDER BY
  milliseconds DESC
LIMIT 1 OFFSET 1;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Следующее выражение получает третий минимальный по размеру трек из таблицы `tracks`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT 
  trackId,
  name,
  bytes
FROM
  tracks
ORDER BY
  bytes ASC
LIMIT 1 OFFSET 2;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом руководстве вы изучили, как использовать предложение SQLite `LIMIT` для ограничения числа строк, возвращаемых запросом.

Предидущее руководство < [SQLite WHERE][prev]  
Следующее руководство > [SQLite BETWEEN][next]

[prev]: ../04_Where/translate.md
[next]: ../06_Between/translate.md