# SQLite ALTER TABLE #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-alter-table/

## Обзор ##############################

В этом руководстве вы узнаете, как использовать выражение SQLite `ALTER TABLE` для изменения структуры существующей таблицы.

В отличии от SQL стандарта и других СУБД, SQLite поддерживает очень ограниченную функциональность выражения `ALTER TABLE`.

Используя SQLite `ALTER TABLE` вы можете выполнять два действия:

1. Переименовать таблицу
2. Добавить новую колонку
3. Переименовать колонку (добавлено в версии 3.20.0)

## Использование SQLite `ALTER TABLE` для переименования таблицы

Для переименования таблицы используется выражение `ALTER TABLE RENAME TO`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ALTER TABLE existing_table
RENAME TO new_table;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Вот важные моменты, которые вы должны знать, перед тем, как переименовывать таблицу:

- `ALTER TABLE` переименовывает только внутренние базы данных. Вы не можете использовать его для перемещения таблиц между подсоединенными базами.

- Объекты БД, такие как индексы и триггеры ссылающиеся на таблицу, должны будут ссылаться и на новую таблицу.

- Если таблицу используется в предствалении или в триггере, вы должны будете вручную изменить объявления представлений и триггеров.

Давайте возмем пример переименования таблицы.

1. Создадим таблицу под названием `devices`, которая имеет три столбца: `name`, `model`, `serial`; и вставим новую строку в эту таблицу:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE divices (
  name TEXT NOT NULL,
  model TEXT NOT NULL,
  serial INTEGER NOT NULL UNIQUE
);

INSERT INTO devices (name, model, serial)
VALUES ('HP ZBook 17 G3 Mobile Workstation', 'ZBook', 'SN-2015');
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2. Используем выражение `ALTER TABLE RENAME TO` для изменения названия таблицы с `devices` на `equipment`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ALTER TABLE devices
RENAME TO equipment;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

3. Выберем данные из таблицы `equipment`, чтобы удостоверится в правильности:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT 
  name,
  model,
  serial
FROM
  equipment;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Использование SQLite `ALTER TABLE` для добавления нового столбца

Вы можете использовать выражение SQLite `ALTER TABLE` для добавления нового столбца в существующую таблицу. В этом случае SQLite добавит новый столбец в конец списка столбцов.

Ниже приведен синтаксис выражения `ALTER TABLE ADD COLUMN`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ALTER TABLE table_name
ADD COLUMN column_definition;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Вот некоторые ограничения нового столбца:

- Новый столбец не может иметь ограничения `UNIQUE` или `PRIMARY KEY`.

- Если новый столбец имеет ограничение `NOT NULL`, то вы должны определить значение по умолчанию для этого столбца отличное от значения `NULL`.

- Новый столбец не может иметь значение по умолчанию `CURRENT_TIMESTAMP`, `CURRENT_DATE` и `CURRENT_TIME` или какое-либо выражение.

- Если новый столбец является внешним ключем, и проверка ограничения внешнего ключа включена, новая колонка должна иметь значение по умолчанию `NULL`.

Например, вы можете добавить новую колонку `location` в таблицу `equipment`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ALTER TABLE equipment
ADD COLUMN location TEXT;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Использование SQLite `ALTER TABLE` для переименования колонки

SQLite добавили поддержку переименования столбца используя выражение `ALTER TABLE RENAME COLUMN` в версии 3.20.0

Ниже приведен синтаксис выражения `ALTER TABLE RENAME COLUMN`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ALTER TABLE table_name
RENAME COLUMN current_name TO new_name;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Для более подробной информации посмотрите руководство по [переименованию столбца][rename_col]

## Использование SQLite `ALTER TABLE` для других действий

Есил вы хотите выполнить другие действия, такие как удаление столбца, вы должны придерживаться следующей схемы:

![actions]

Следующий скрипи иллюстрирует шаги выше:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PRAGMA foreign_keys = off;

BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS new_table (
  column_definition,
  ...
);

INSERT INTO new_table (column_list)
SELECT column_list
FROM table;

DROP TABLE table;

ALTER TABLE new_table RENAME TO table;

COMMIT;

PREGMA foreign_keys = on;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Пример удаления колонки с помощью `ALTER TABLE`

SQLite не поддерживает выражение `ALTER TABLE DROP COLUMN`. Для удаления колонки нужно выполнить шаги, которые были описаны выше.

Следующее выражение создает две таблицы `users` и `favorites` и вставляет в них данные:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE users (
  userId INTEGER PRIMARY KEY,
  firstName TEXT NOT NULL,
  lastName TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL
);

CREATE TABLE favorites (
  userId INTEGER,
  playlistId INTEGER,
  FOREIGN KEY (userId)
    REFERENCES users(userId),
  FOREIGN KEY (playlistId)
    REFERENCES playlists(playlistId)
);

INSERT INTO users (firstName, lastName, email, phone)
VALUES ('John', 'Doe', 'john.doe@example.com', '408-23403456');

INSERT INTO favorites(userId, playlistId)
VALUES (1, 1);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Следующее выражение вернет данные из таблицы `users`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT * FROM users;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Следующее выражение вернет данные из таблицы `favorites`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT * FROM favorites;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Предположим, вы хотите удалить столбец `phone` из таблицы `users`.

1. Отключите проверку ограничения внешнего ключа:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PRAGMA foreign_keys = off;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2. Начните новую транзакцию:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
BEGIN TRANSACTION;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

3. Создайте новую таблицу с аналогичной стрктурой, но за исключением столбца `phone`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE IF NOT EXISTS persons (
  userId INTEGER PRIMARY KEY,
  firstName TEXT NOT NULL,
  lastName TEXT NOT NULL,
  email TEXT NOT NULL
);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

4. Скопируйте данные из таблицы `users` в `persons`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO persons (userId, firstName, lastName, email)
SELECT userId, firstName, lastName, email
FROM users;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

5. Удалите таблицу `users`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DROP TABLE users;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

6. Переименуйте таблицу `persons` в `users`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ALTER TABLE persons RENAME TO users;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

7. Завершите транзакцию

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
COMMIT;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

8. Включите проверку ограничений внешнего ключа

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PRAGMA foreign_keys = on;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Итоги

- Используйте выражение `ATLER TABLE` для изменения структуры существующей таблицы.

- Используйте выражение `ALTER TABLE table_name RENAME TO new_name` для переименования таблицы.

- Используйте выражение `ALTER TABLE table_name ADD COLUMN column_definition` для добавления новой колонки.

- Используйте `ALTER TABLE table_name RENAME COLUMN current_name TO new_name` для переименования стобца.

---------------------------------------

Предидущее руководство < [SQLite CHECK CONSTRAINT][prev]  
Следующее руководство > [SQLite RENAME COLUMN][next]

[prev]: ../40_CheckConstraint/translate.md
[next]: ../42_RenameColumn/translate.md

[rename_col]: https://www.sqlitetutorial.net/sqlite-rename-column/
[actions]: ./SQLite-ALTER-TABLE-Steps.jpg