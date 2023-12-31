# SQLite CASE #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-case/

## Обзор ##############################

В этом руководстве вы узнаете о выражении SQLite `CASE`, которое добавляет условную логику в запрос.

Выражение SQLite `CASE` вычисляет список условий и возвращает выражение основанное на результате вычисления.

Выражение `CASE` похоже на выражение `IF-THEN-ELSE` в других языках программирования.

Вы можете использовать выражение `CASE` в любом предложении, которое допускает подходящее выражение. Например, вы можете использовать выражение `CASE` в предложениях `WHERE`, `ORDER BY`, `HAVING`, `SELECT` и выражениях `SELECT`, `UPDATE` и `DELETE`.

SQLite поддерживает две формы выражения `CASE`: простой `CASE` и поисковый `CASE`.

## Простое выражение SQLite `CASE` ####

Простое выражение `CASE` сравнивает выражение со списком выражений для вывода результата. Ниже показан синтаксис простого выражения `CASE`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CASE case_expression
  WHEN when_expression_1 THEN result_1
  WHEN when_expression_2 THEN result_2
  ...
  [ ELSE result_else ]
END
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Простое выражение `CASE` сравнивает `case_expression` с выражением фигурирующим в первом предложении `WHEN`, `when_expression_1`, для равенства.

Если `case_expression` равно `when_expression_`, простой `CASE` возвращает выражение, переданное предложению `THEN`, что в данном случае является `result_1`.

В противном случае, простое выражение `CASE` сравнивает `case_expression` со следующим предложением `WHEN`.

В случае отсутствия совпадений `case_expression` и `when_expression`, выражение `CASE` вернет `result_else` из предложения `ELSE`. Если вы пренебрегли предложением `ELSE`, выражение `CASE` вернет `NULL`.

Простое выражение `CASE` использует вычисление по короткой схеме. Другими словами, оно вернет результат и прекратит вычислене остальных условий как только найдет совпадение.

### Примен простого `CASE` ############

Давайте посмотрим на таблицу `customers` тестовой базы данных.

![customers][]

Предположим, вам надо создать отчет о группах клиентов с логикой, если клиент находится в США, он принадлежит к домашней группе, в противном случае, к внешней группе.

Для создания отчета используется простое выражение `CASE` в выражении `SELECT`, как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT 
  customerId,
  firstName,
  lastName,
  CASE country
    WHEN 'USA' THEN 'Domestic'
    ELSE 'Foreign'
  END customerGroup
FROM
  customers
ORDER BY
  lastName,
  firstName;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Поисковое выражение SQLite `CASE` ##

Поисковое выражение `CASE` вычисляет список выражений для получения результата. Обратите внимание, простое выражение `CASE` только сравнивает на еквивалентность, тогда как поисковое выражение `CASE` может использовать любую форму сравнения.

Ниже приведен синтаксис поискового выражения `CASE`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CASE
  WHEN bool_expression_1 THEN result_1
  WHEN bool_expression_2 THEN result_2
  [ ELSE result_else ]
END
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Поисковое выражение `CASE` вычисляет логические выражения в заданной последовательности и возвращает соответствующие результаты, если выражение вычилилось как `true`.

В случае, когда ни одно выражение не вычислилось как `true`, поисковое выражение `CASE` возвращает выражение указанное в предложении `ELSE`. Если предложение `ELSE` отсутствует, поисковое выражение `ELSE` вернет `NULL`.

Так-же как и простое выражение `CASE`, поисковое выражение `CASE` прекращает вычисление, как только найдет верное условие.

### Пример поискового `CASE` ##########

Мы будем использовать таблицу `tracks` для демонстрации.

![tracks][]

Предположим, вы хотите классифицировать треки по времени, если длинна меньше минуты, трек короткий, если между 1 и 5 минту, средний, если более 5 минут, длинный.

Для достижения этого используется поисковое выражение `CASE` как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  trackId,
  name,
  CASE 
    WHEN milliseconds < 60000 THEN 'short'
    WHEN milliseconds > 60000 AND milliseconds < 300000 THEN 'medium'
    ELSE 'long'
  END category
FROM
  tracks;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом руководстве вы узнали о выражении SQLite `CASE` для формирования условий внутри SQL запроса.

Предидущее руководство < [SQLite EXISTS][prev]  
Следующее руководство > [SQLite INSERT][next]

[prev]: ../23_Exists/translate.md
[next]: ../25_Insert/translate.md

[customers]: ./customers.png
[tracks]: ./tracks.png