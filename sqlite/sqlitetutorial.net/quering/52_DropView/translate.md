# SQLite DROP VIEW #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-drop-view/

## Обзор ##############################

В этом руководстве вы узнаете, как использовать выражение `DROP VIEW` для удаления созданного предстваления из схемы базы данных.

## Знакомство с выражением SQLite `DROP VIEW`

Выражение `DROP VIEW` удаляет представление из схемы БД. Вот базовый синтаксис выражение:

``````````````````````````````````` SQL
DROP VIEW [IF EXISTS] [schema_name.]view_name;
```````````````````````````````````````

1. Укажите название представления, которое хотите удалить, после ключевого слова `DROP VIEW`.

2. Укажите схему представления, которое хотите удалить.

3. Используйте опцию `IF EXISTS`, если хотите удалить только сущестующее представление. Если представление не существует, то выражение ничего не сделает. В то время когда попытка удалить несуществующее представление без опции вернет ошибку.

> Обратите внимание, что команда только удаляет представление из схемы БД и не затрагивает данные таблиц, используемых в представлении.

## Пример выражение `DROP VIEW`

Это выражеине создает представление, которое выводит данные из таблиц `invoices` и `invoice_items`.

``````````````````````````````````` SQL
CREATE VIEW v_billing (
  invoiceId,
  invoiceDate,
  total
)
AS
  SELECT
    invoiceId,
    invoiceDate,
    SUM (unitPrice * quantity)
  FROM
    invoices
  INNER JOIN
    invoice_items USING (
      invoiceId
    );
```````````````````````````````````````

Для того, чтобы удалить представление используйте следующее выражение:

``````````````````````````````````` SQL
DROP VIEW v_billing;
```````````````````````````````````````

Этот пример использует опцию `IF EXISTS` для удаления не существующего представления:

``````````````````````````````````` SQL
DROP VIEW IF EXISTS v_xyz;
```````````````````````````````````````

Оно не вернет какой-либо ошибки. Однако, если вы не будете использовать `IF EXISTS`, как в предидущем примере, вы получите ошибку:

``````````````````````````````````` SQL
DROP VIEW v_xyz;
```````````````````````````````````````

Вот сообщение:

```````````````````````````````````````
Error: no such view: v_xyz
Query: DROP VIEW v_xyz
Parameters: []
```````````````````````````````````````

---------------------------------------

Предидущее руководство < [SQLite CREATE VIEW][prev]  
Следующее руководство > [SQLite INDEX][next]

[prev]: ../51_CreateView/translate.md
[next]: ../53_Index/translate.md