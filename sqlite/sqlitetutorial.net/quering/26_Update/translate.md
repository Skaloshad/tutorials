# SQLite UPDATE #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-update/

## Обзор ##############################

В этом руководстве вы узнаете, как использовать SQLite `UPDATE` для обновления существующих строк в таблице.

## Знакомство с выражением SQLite `UPDATE`

Для обновления существующих данных в таблице используется выражение SQLite `UPDATE`. Ниже приведен синтаксис выражения `UPDATE`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
UPDATE table
SET 
  column_1 = new_value_1,
  column_2 = new_value_2
WHERE
  search_condition
ORDER BY
  column_or_expression
LIMIT row_count OFFSET offset;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом синтаксисе:

- Первое, укажите таблицу в которой вы желаете обновить данные после предложения `UPDATE`.

- Второе, задайте новое значение для каждого столбца таблицы в предложении `SET`.

- Третье, укажите строки для обновления, используя условие в предложении `WHERE`. Предложение `WHERE` является опциональным. Если вы пропустите его, выражение `UPDATE` обновит все строки в таблице.

- Последнее, используйте предложения `ORDER BY` и `LIMIT` в вырвжении `UPDATE` для указания количества строк для обновления.

> Обратите внимане, что если вы используете отрицательное значение в предложении `LIMIT`, SQLite предпологает, что ограничения нет и обновляет все строки, что означает, что используется только условие в предложении `WHERE`.

Предложение `ORDER BY` всегда должно использоваться с предложением `LIMIT` для точного указания, какие строки должны быть обновлены. В противном случае, вы никогда не узнаете какие на самом деле строки будут обновлены; потому, что без предложения `ORDER BY` порядок строк в таблице не определен.

## Примеры выражения SQLite `UPDATE` 

Мы будем использовать таблицу `employees` тестовой базы данных для демонстрации выражения `UPDATE`.

![employees][]

Следующее выражение `SELECT` получает часть данных из таблицы `employees`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  employeeId,
  firstName,
  lastName,
  title,
  email
FROM
  employees;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### 1) Пример обновление одного столбца

Предположим, Джейн вышла за муж и хочет изменить свою фамилию на фамилию её мужа - `Smith`. В этом случае вы можете обновить её фамилию используя следующее выражение:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
UPDATE
  employees
SET
  lastName = 'Smith'
WHERE
  employeeId = 3;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Выражение в предложении `WHERE` гарантирует, что мы обновим только запись Джейн. Вы задали столбцу `lastName` значение литерала `'Smith'`.

Для проверки `UPDATE` используйте следующее выражение:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  employeeId,
  firstName,
  lastName,
  title,
  email
FROM
  employees
WHERE
  employeeId = 3;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### 2) Пример обновления нескольких столбцов

Предположим `Park Matgaret` расположен в `Toronto` и вы хотите изменить его адрес, город и область. Вы можете использовать выражение `UPDATE` для обновления нескольких столбцов, как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
UPDATE
  employees
SET
  city = 'Toronto',
  state = 'ON',
  postalcode = 'M5P 2N7'
WHERE
  employeeId = 4;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Для проверки работы `UPDATE` используйте следующее выражение:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  employeeId,
  firstName,
  lastName,
  state,
  city
  postalCode
FROM
  employees
WHERE
  employeeId = 4;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### 3) Пример обновления с предложениями `ORDER BY` и `LIMIT`

> Обратите внимание, что вы должны собрать SQLite с опцией `SQLITE_ENABLE_UPDATE_DELETE_LIMIT` чтобы выполнить инструкцию `UPDATE` с необязательными предложениями `ORDER BY` и `LIMIT`.

Давайте проверим адрес электронной почты сотрудников в таблице `employees`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  employeeId,
  firstName,
  lastName,
  email
FROM
  employees;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Для обновления одной строки в таблице `employees` используйте предложение `LIMIT 1`. Чтобы убедиться, что вы обновляете первую строку сотрудников, отсортировнных по имени, добавте предложение `ORDER BY firstName`.

Так следующее выражение обновляет почту у `Andrew Adams`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
UPDATE
  employees
SET
  email = LOWER (
    firstName || "." || lastName || "@chinookcorp.com"
  )
ORDER BY
  firstName
LIMIT 1;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Новая почта является комбинацией имени, точки, фамилии и суффикса `@chinookcorp.com`

Функция `LOWER()` приводит почту к нижнему регистру.

### 4) Пример обновления всех строк

Для обновления всех строк в таблице `employees` нужно попустить предложение `WHERE`. Например, следующее выражение `UPDATE` меняет все электронные адреса всех сотрудников на нижний регистр:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
UPDATE
  employees
SET
  email = LOWER (
    firstName || "." || lastName || "@chinookcorp.com"
  );
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

В этом руководстве вы изучили, как использовать выражение SQLite `UPDATE` для обновления данных в таблице.

[SQLite UPDATE statement][UPDATE_LINK]

Предидущее руководство < [SQLite INSERT][prev]  
Следующее руководство > [SQLite DELETE][next]

[prev]: ../25_Insert/translate.md
[next]: ../27_Delete/translate.md

[employees]: ./employees.png
[UPDATE_LINK]: https://www.sqlite.org/lang_update.html