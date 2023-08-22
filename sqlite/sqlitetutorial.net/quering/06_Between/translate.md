# SQLite BETWEEN ######################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-between/

## Обзор ##############################

В этом руководстве вы изучите, как использовать оператор SQLite `BETWTTN` для проверки, вхождения значения в диапазон значений.

## Знакомство с предложением SQLite `BETWEEN`

Предложение SQLite `BETWEEN` - это логический оператор, который проверяет, входит ли значение в диапазон значений. Если значение находится в определенном диапазоне, оператор `BETWEEN` вернет `true`. Оператор `BETWEEN` может быть использован в предложении `WHERE` выражений `SELECT`, `DELETE`, `UPDATE`, и `REPLACE`. 

Ниже показан синтаксис оператора SQLite `BETWEEN`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
test_expression BETWEEN low_expression AND high_expression
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом синтаксисе:

- `test_expression` - выражение, которое проверяет вхождение в объявленый диапазон между `low_expression` и `high_expression`.

- `low_expression` и `high_expression` - это любые допустимые выражения, которые указывают нижнее и верхнее значения диапазона. `low_expression` должно быть меньше или равно `high_expression`, в противном случае `BETWEEN` вернет `false`.

- Ключевое слово `AND` - это заполнитель, который указывает на то, что `test_expression` должно быть в пределах диапазона, объявленного посредством `low_expression` и `high_expression`.

Обратите внимание, что оператор `BETWEEN` является включающим. Он возвращает `true`, когда `test_expression` меньше или равно `high_expression` и больше или равно значению `low_expression`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
test_expression >= low_expression AND test_expression <= high_expression
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Чтобы указать исключающий диапазон, используются операторы больше чем `>` и меньше чем `<`.

Обратите внимание, что если на входи оператора `BETWEEN` передать `NULL`, то он вернет `NULL`, или, если быть более точным - `unknown`.

Чтобы инвертировать результат оператора `BETWEEN` используется оператор `NOW BETWEEN`, как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
test_expression NOT BETWEEN low_expression AND high_expression
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`NOT BETWEEN` вернет `true` если значение `test_expression` будет меньше чем значение `low_expression`, или больше чем значение `high_expression`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
test_expression < low_expression OR test_expression > high_expression
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Примеры оператора SQLite `BETWEEN`

Для демонстрации, мы будем использовать таблицу `invoices` из тестовой базы данных:

|   invoices       |
|------------------|
| * InvoiceId      |
|   CustomerId     |
|   InvoiceDate    |
|   BillingAddress |
|   BillingCity    |
|   BillingState   |
|   BillingCountry |
|   BillingPostalCode |
|   Total          |

## Пример числовых значений SQLite `BETWEEN`

Следующее выражение находит счета, чей баланс между `14.96` и `18.86`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  InvoiceId,
  BillingAddress,
  Total
FROM
  invoices
WHERE
  Total BETWEEN 14.91 AND 18.86
ORDER BY
  Total;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Как можно видеть, счета, чей баланс между `14.91` и `18.86` включены в выборку.

## Пример числовых значений SQLite `NOW BETWEEN`

Чтобы найти счета, чей баланс не находится в диапазоне между `1` и `20`, используется оператор `NOT BETWEEN`, как показано ниже, в запросе:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  InvoiceId,
  BillingAddress,
  Total
FROM
  invoices
WHERE
  Total NOT BETWEEN 1 AND 20
ORDER BY
  Total;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Как ясно показано в выводе, результат включает счета, чей баланс меньше `1` и больше `20`.

## Пример оператора SQLite `BETWEEN` с датами

Следующий пример находит счета, которые выставлены с `1ого Января 2010` по `31е Января 2010`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  InvoiceId,
  BillingAddress,
  InvoiceDate,
  Total
FROM
  invoices
WHERE
  InvoiceDate BETWEEN '2010-01-01' AND '2010-01-31'
ORDER BY
  InvoiceDate;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Пример оператора SQLite `NOT BETWEEN` с датами

Следующее выражение ищет счета, которые выставлены до `3его Января 2009` и после `1ого Декабря 2013`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  InvoiceId,
  BillingAddress,
  date(InvoiceDate) InvoiceDate,
  Total
FROM
  invoices
WHERE
  InvoiceDate NOT BETWEEN '2009-01-03' AND '2013-12-01'
ORDER BY
  InvoiceDate;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом руководстве вы изучили, как использовать оператор SQLite `BETWEEN` для проверки, входит ли значение в диапазон значений.

Предидущее руководство < [SQLite LIMIT][prev]  
Следующее руководство > [SQLite IN][next]

[prev]: ../05_Limit/translate.md
[next]: ../07_In/translate.md