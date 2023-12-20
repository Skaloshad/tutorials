# SQLite NULLIF #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-functions/sqlite-nullif/

## Обзор ##############################

Функция SQLite `NULLIF` принимает два рагумента и возвращает `NULL` если они равны.

Если первый аргумент не равен второму, то функция `NULLIF` вернет первый аргумент. В случае если оба аргумента равны `NULL`, функция вернет значение `NULL`.

## Синтаксис

Ниже представлен синтаксис функции `NULLIF`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NULLIF( parameter_1, parameter_2 );
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Логически, функция `NULLIF` эквивалентна выражению `CASE`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CASE WHEN parameter_1 = parameter_2 
THEN NULL
ELSE expr1
END;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Аргументы

Принимает ровно два аргумента.

## Тип возвращаемого значения

Возвращает значение с типом первого аргумента либо `NULL`.

## Примеры

Обычно, функция `NULLIF` используется, когда в БД есть "спецефические" значения, такие как `0` или `пустая строка`, которые мы хотим обработать как значения `NULL`. Это очень помогает, когда мы используем функции, такие как: `AVG`, `MAX`, `MIN`, `SUM` и `COUNT`.

Давайте посмотрим следующий пример.

1. Создадим таблицу, которая содержит три столбца: `name`, `price` и `discount`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE IF NOT EXISTS products (
  name TEXT NOT NULL,
  price NUMERIC NOT NULL,
  discount NUMERIC DEFAULT 0,
  CHECK (
    price >= 0 AND
    discount >= 0 AND
    price > discount
  )
);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2. Вставим некоторые данные:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO products( name, price, discount )
VALUES 
  ('Apple iPhone', 700, 0),
  ('Samsung Galaxy', 600, 10),
  ('Google Nexus', 399, 20);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

3. Для того, чтобы посчитать число продуктоы которые имеют скидку, мы будем использовать функцию `NULLIF`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT COUNT(NULLIF(discount, 0)) discount_products
FROM products;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ниже представлен эквивалентный запрос:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT COUNT(*)
FROM products
WHERE discount > 0;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Или вы можете использовать выражение `CASE`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT COUNT(
  CASE
    WHEN discount = 0
    THEN NULL
    ELSE 1 END
)
FROM products;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---------------------------------------

Предидущее руководство < [SQLite IIF][prev]  
Следующее руководство > [SQLite Aggregate Functions][next]

[prev]: ../64_IIf/translate.md
[next]: ../66_AggregateFuntions/translate.md