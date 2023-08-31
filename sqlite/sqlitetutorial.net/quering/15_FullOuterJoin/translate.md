# SQLite FULL OUTER JOIN ######################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-full-outer-join/

## Обзор ##############################

В этом руководстве вы изучите, как эмулировать SQLite full outer join используя предложения `UNION` и `LEFT JOIN`.

## Знакомство с предложением SQL `FULL OUTER JOIN`

В теории, результать `FULL OUTER JOIN`, это комбинация `LEFT JOIN` и `RIGHT JOIN`. Результирующий набор полного внешнего объединения имеет значения `NULL` для каждого столбца таблицы, который не имеет соответствующий строки в другой таблице. Для совподающих строк, `FULL OUTER JOIN` производит единичную строку со значениями столбцов из обоих таблиц.

Следующаа картинка иллюстрирует результат предложения `FULL OUTER JOIN`:

![fullOuterJoin][]

Посмотрите следующие таблицы `cats` и `dogs`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE dogs (
  type  TEXT,
  coror TEXT
);

INSERT INTO dogs(type, color)
VALUES ('Hunting', 'Black'), ('Guard', 'Brown');

CREATE TABLE cats (
  type  TEXT,
  color TEXT
);

INSERT INTO cats (type, color)
VALUES ('Indoor', 'White'), ('Outdoor', 'Black');
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Слудующее выражение использует предложение `FULL OUTER JOIN` для выбора данных из таблиц `dogs` и `cats`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT *
FROM dogs
FULL OUTER JOIN cats USING (color);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ниже показан результат работы предидущего выражения:

| type    | color | type    | color |
|---------|-------|---------|-------|
| Hunting | Black | Outdoor	| Black |
| Guard	  | Brown | NULL    | NULL  |
| NULL    | NULL  | Indoor  | White |

К сожалению SQLite не поддерживает предложения `RIGHT JOIN` и `FULL OUTER JOIN`. Однака, мы можем легко эмулировать `FULL OUTER JOIN` используя предложение `LEFT JOIN`.

## Эмуляция SQLite full outer join

Слудующее выражение эмулирует выражение SQLite `FULL OUTER JOIN`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT 
  d.type,
  d.color,
  c.type,
  c.color
FROM dogs d
LEFT JOIN cats c USING (color)
UNION ALL
SELECT 
  d.type,
  d.color,
  c.type,
  c.color
FROM cats c
LEFT JOIN dogs d USING (color)
WHERE d.color IS NULL;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Как работает запрос:

- Из-за того, что SQLite не поддерживает `RIGHT JOIN`, мы используем вместо него предложение `LEFT JOIN` во втором `SELECT`, и меняем позиции таблиц `cats` и `dogs`.

- Предложение `UNION ALL` оставляет повторяющиеся строки из результатов обоих таблиц.

- Предложение `WHERE` во втором выражении `SELECT` удаляет строки, которые уже содержатся в результате первого выражения `SELECT`.

В этом руководстве вы изучили, как использовать `UNION ALL` и `LEFT JOIN` для эмуляции предложения SQLite `FULL OUTER JOIN`.

Предидущее руководство < [SQLite CROSS JOIN][prev]  
Следующее руководство > [SQLite SELF JOIN][next]

[prev]: ../14_CrossJoin/translate.md
[next]: ../16_SelfJoin/translate.md

[fullOuterJoin]: ./full-outer-join.png