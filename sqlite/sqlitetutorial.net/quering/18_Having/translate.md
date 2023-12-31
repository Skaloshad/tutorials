# SQLite HAVING ######################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-having/

## Обзор ##############################

В этом руководстве вы изучите, как использовать предложение SQLite `HAVING` для определения условия фильтрации группы или аггрегации.

## Знакомство с предложением SQLite `HAVING` 

Предложение SQLite `HAVING` - это необязательное предложение выражения `SELECT`. Предложение `HAVING` определяет условие поиска для группы.

Обычно, предложение `HAVING` испльзуется вместе с предложением `GROUP BY`. Предложение `GROUP BY` группирует набор строк в набор сводных строк или групп. Предложение `HAVING` фильтрует группы основываясь на определенном условии.

Если вы используете предложение `HAVING`, вы должны включить предложение `GROUP BY`; В противном случае, вы получите следующую ошибку:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Error: a GROUP BY clause is required before HAVING
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> Обратите внимание, что предложение `HAVING` применяется после предложения `GROUP BY`, тогда как предложение `WHERE` порименяется до предложения `GROUP BY`.

Ниже приведен пример синтаксиса предложения `HAVING`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  column_1,
  column_2,
  aggregate_function (column_3)
FROM
  table
GROUP BY
  column_1,
  column_2
HAVING
  search_condition;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом синтаксисе предложение `HAVING` расценивает `search_expression` для каждой группы, как булево выражение. Оно включает в конечный результат только те группы, для которых оценка условия вернула `true`.

## Примеры предложения `HAVING`

Мы будем использовать таблицу `tracks` тестовой базы данных для демонстрации.

![tracks][]

Для поиска количества треков у каждого альбома, используется предложение `GROUP BY` как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  albumId,
  COUNT(trackId)
FROM
  tracks
GROUP BY
  albumId;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Для поиска количества треков у альбома с id 1, используется `HAVING`, как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  albumId,
  COUNT(trackId)
FROM
  tracks
GROUP BY
  albumId
HAVING albumId = 1;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Мы ссылались на столбец `albumId` в предложении `HAVING`.

Чтобы найти альбомы, которые имеют от 18 до 20 треков, в предложении `HAVING` используется функция аггрегации, как показано в выражении ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  albumId,
  COUNT(trackId)
FROM
  tracks
GROUP BY
  albumId
HAVING
  COUNT(albumId) BETWEEN 18 AND 20
ORDER BY albumId;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Пример предложения SQLite `HAVING` с `INNER JOIN`

Следующее выражение запрашивает данные из таблиц `tracks` и `albums` используя `INNER JOIN` для поиска альбомов, которые имеют общую длинну более чем 60,000,000 milliseconds.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  tracks.albumId,
  title,
  SUM(milliseconds) AS length
FROM
  tracks
INNER JOIN albums USING (albumId)
GROUP BY
  tracks.albumId
HAVING
  length > 60000000;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом руководстве вы изучили как использовать предложение SQLite `HAVING` для определения условия поиска для групп.

Предидущее руководство < [SQLite GROUP BY][prev]  
Следующее руководство > [SQLite UNION][next]

[prev]: ../17_GroupBy/translate.md
[next]: ../19_Union/translate.md

[tracks]: ./tracks.png