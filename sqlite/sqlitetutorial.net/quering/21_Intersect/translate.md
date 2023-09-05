# SQLite INTERSECT ######################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-intersect/

## Обзор ##############################

В этом руководстве вы узнаете как использовать оператор SQLite `INTERSECT`.

## Знакомство с оператором SQLite `INTERSECT`

Оператор SQLite `INTERSECT` сравнивает результаты двух запросов и возвращает уникальные строки вывода обоих запросов.

Ниже приведен синтаксис оператора `INTERSECT`: 

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT select_list1
FROM table1
INTERSECT
SELECT select_list2
FROM table2;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Базовые правила комбинирования результатов двух запросов следующие:

- Первое, количество и порядок столбцов всех запросов должен быть одинаковым.

- Второе, типы данных должны быть сопоставимыми.

Для демонстрации мы создадим две таблицы `t1` и `t2` и заполним их данными:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE t1 (
  v1 INT
);

INSERT INTO t1 (v1)
VALUES (1), (2), (3);

CREATE TABLE t2 (
  v2 INT
);

INSERT INTO t2 (v2)
VALUES (2), (3), (4);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Слудующее выражение показывает как использовать оператор `INTERSECT` для сравнения результатов двух запросов:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT v1
FROM t1
INTERSECT
SELECT v2
FROM t2;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Слудующее изображение показывает работу оператора `INTERSECT`:

![intersect][]

## Примеры SQLite `INTERSECT`

Для демонстрации мы будем использовать таблицы `customers` и `invoices` тестовой базы данных.

![invoices_customers][]

Слудующее выражение ищет потребителей у которых есть счета:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT customerId
FROM customers
INTERSECT
SELECT customerId
FROM invoices
ORDER BY customerId;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом руководстве вы изучили как использовать оператор SQLite `INTERSECT` для сравнения двух запросов и возврата уникальных строк вывода обоих.

Предидущее руководство < [SQLite EXCEPT][prev]  
Следующее руководство > [SQLite SUBQUERY][next]

[prev]: ../20_Except/translate.md
[next]: ../22_Subquery/translate.md

[intersect]: ./SQLite-INTERSECT.png
[invoices_customers]: ./customers_invoices.png