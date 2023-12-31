# SQLite EXISTS ######################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-exists/

## Обзор ##############################

В этом руководстве вы изучите, как использовать оператор SQLite `EXISTS` для проверки существования строк, возвращенных подзапросом.

## Знакомство с оператором SQLite `EXISTS`

Оператор `EXISTS` - это логический оператор, который проверяет возвращает ли подзапрос какую-либо строку.

Здесь представлен базовый синтаксис оператора `EXISTS`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
EXISTS (subquery)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом синтаксисе подзапрос это выражение `SELECT`, которое возвращает ноли или более строк.

Если подзапрос вернет одну или более строк, оператор `EXISTS` вернет `true`. В противном случае, оператор `EXISTS` вернет `false` или `NULL`.

> Обратите внимание, что если подзапрос вернет одну строку со значением `NULL`, рузультат оператора `EXISTS` всеравно будет `true`, потому что рузультирующий набор содержит одну строку с `NULL`.

Для отрицания оператора `EXISTS` используется оператор `NOT EXISTS`, как показано далее:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NOT EXISTS (subquery)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Оператор `NOT EXISTS` возвращает `true`, если подзапрос не возвращает строк.

## Примеры оператора SQLite `EXISTS`

Посмотрите следующие таблицы `customers` и `invoices` тестовой базы данных:

![customers_invoices][]

Следующий запрос ищет клиентов, которые имеют счета:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  customerId,
  firstName,
  lastName,
  company
FROM
  customers c
WHERE
  EXISTS (
    SELECT 1
    FROM invoices i
    WHERE i.customerId = c.customerId
  )
ORDER BY
  firstName,
  lastName;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом примере, для каждого клиента, оператор `EXISTS` проверяет существует ли `customerId` в таблице `invoices`.

- Если да, подзапрос возвращает одну строку со значением `1`, что дает основание оператору `EXISTS` вернуть `true`. Слудовательно, запрос добавит клиента в результирующий набор.

- В случае если id клиента не существует в таблице `invoices`, подзапрос не вернет ни одной строки, что дает основание оператору `EXISTS` вернуть `false`, отсюда выходит, что запрос не включит клиента в результирующий набор.

Заметте, вы можете использовать оператор `IN` вместо оператора `EXISTS` для получения аналогичного результата:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  customerId,
  firstName,
  lastName,
  company
FROM
  customers c
WHERE
  customerId IN (
    SELECT customerId
    FROM invoices
  )
ORDER BY 
  firstName,
  lastName;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Как только подзапрос возвращает первую строку, оператор `EXISTS` прекращает поиск, поскольку может определить результат. С другой стороны, оператор `IN` должен просканировать все строки возвращенные подзапросом для определения результата.

Вообще говоря, оператор `EXISTS` быстрее чем оператор `IN` если результат подзапроса большой. Напротив, оператор `IN` быстрее чем оператор `EXISTS` если результат подзапроса маленький.

## Пример оператора SQLite `NOT EXISTS`

Посмотрите следующие таблицы `artists` и `albums` тестовой базы данных:

![albums_artists][]

Этот запрос находит всех артистов, которые не имеют какого-либо альбома в таблице `albums`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT 
  *
FROM
  artists a
WHERE
  NOT EXISTS (
    SELECT 1
    FROM albums
    WHERE a.artistId = artistId
  )
ORDER BY name;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом руководстве вы изучили, как использовать оператор SQLite `EXISTS` для проверки существования строк в подзапросе.

Предидущее руководство < [SQLite SUBQUERY][prev]  
Следующее руководство > [SQLite CASE][next]

[prev]: ../22_Subquery/translate.md
[next]: ../24_Case/translate.md

[customers_invoices]: ./customers_invoices.png
[albums_artists]: Albums-Artists-Tables.png