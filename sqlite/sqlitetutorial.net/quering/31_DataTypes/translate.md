# SQLite DATA TYPES #########################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-data-types/

## Обзор ##############################

В этом руководстве вы узнаете о системе типов данных SQLite и о связанных с ней концепциях, таких как: хранимые классы, типизация манифеста, сходство типов.

## Знакомство с типами данных SQLite

Если вы перешли с другой СУБД, такой как MySQL и PostgreSQL, вы обратите внимание, что они используют *статическую типизацию*. Это означает, что когда вы объявляете столбец с определенным типом данных, этот столбец может хнарить данные только объявленного типа.

В отличае от остальных СУБД SQLite использует динамическую типизацию. Другими словами, значнние, которое хранится в стоблце определяет его тип, а не тип колонки.

Кроме того, вам не нужно определять специальный тип данных для столбца во время создания таблицы. В случае, если вы объявите колонку с типом integer, вы можете хранить в ней данные любого типа, такие как `BLOB` и `text`, SQLite не будет на это жаловаться.

SQLite поддерживает пять примитивных типов данных, которые называются хранимыми классами.

Хранимые классы описывают формат, который SQLite использует для хранения данных на диске. Хранимые классы являются более общими чеми типы данных, например, класс `INTEGER` включает в себя шесть разных типов integer. В большенстве случаем вы можете использовать хранимые классы и типы данных взаимозаменяемо.

Слудующая таблица показывает 5 хранимых классов в SQLite:

| Storage class   | Meaning              |
|-----------------|----------------------|
| NULL    | Значения NULL означает отсутствие информации или неизвестный тип |
| INTEGER | Значения INTEGER означают все числа (и позитивные и негативные). Integer может иметь изменяемую величину, 1, 2, 3, 4 или 8 байт |
| REAL    | Значения real представляют числа с плавающей точкой с десятичными занчениями которые используют 8 байт |
| TEXT    | TEXT используется для хранения стоковых данных. Максимальная длинна текста не ограничена. SQLite поддерживает различные кодировки символов. |
| BLOB    | BLOB предназначе для хранения больших двоичных объектов, которые могут хранить любые виды данных. Максимальный размер, в теории, не ограничен |

SQLite определяет типы данных значения основываясь на соответствии следующим правилам: 

- Если литерал не имеет окружающих ковычек и десятичной точки или експоненты, SQLite присваивает хранимый класс INTEGER.
- Если литерал окружон одинарными или двойными ковычками, SQLite присваивает хранимый класс TEXT.
- Если литерал не имеет ковычек, но имеет десятичную точку или експоненту, SQLite присваивает хранимый класс REAL.
- Если литерал является NULL без ковычек, ему присваивается хранимый класс NULL.
- Если литерал имеет X'ABCD' или 'abcd', SQLite присвает хранимый класс BLOB.

> SQLite не поддерживает нативных хранимых классов дат и времени. Однаков вы можете использовать типы TEXT, INT или REAL для хранения значения даты и времени. Для более детальной информации об обработке значений даты и времени, посмотрите [следующее руководство][dateTimeTutorial].

SQLite предоставляет функцию `typeof()`, которая позволяет проверить хранимый класс значения основанного на этом формате. Посмотрите следующий пример:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  typeof(100),
  typeof(10.0),
  typeof('100'),
  typeof(x'1000'),
  typeof(NULL);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Один столбец может хранить смешанные типы данных. Посмотрите следующй пример.

Для начала создадим таблицу под названием `test_datatypes` для тестирования:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE test_datatypes (
  id INTEGER PRIMARY KEY,
  val
);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем, вставим данные в таблицу `test_datatypes`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO test_datatypes (val)
VALUES 
  (1),
  (2),
  (10.1),
  (20.5),
  ('A'),
  ('B'),
  (NULL),
  (x'0010'),
  (x'0011');
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Затем, используем функцию `typeof()` для получения типа данных каждого значения в колонке `val`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  id,
  val,
  typeof(val)
FROM
  test_datatypes;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

У вас может возникнуть вопрос, как SQLite сортирует столбцы с различными типами данных, как колонка `val`.

Для разрешения этого SQLite придерживается следующего списка правил, когда дело доходит до сортировки:

- Хранимый класс NULL имеет наименьшее значение. Он меньше чем какое-либо другое значение. Между значениями NULL нет упорядочивания.
- Следующие по возрастанию классы INTEGER и REAL. SQLite сравнивает их как числа.
- Следющим идет класс TEXT. SQLite использует сортировку текста.
- Самое высокое значение имеет класс BLOB. SQLite использует функцию C `memcmp()` для сравнения значений BLOB.

Когда вы применяете предложение `ORDER BY` для сортировки данных на колонке с разными типами, SQLite придерживается следующих правил:

- Первое, группирует данные на основе класса: NULL, INTEGER, REAL, TEXT, BLOB. 
- Второе, сортирует значения в каждой группе.

Следующее выражение сортирует смешанные данные столбца `val` таблицы `test_datatypes`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  id,
  val,
  typeof(val)
FROM
  test_datatypes
ORDER BY val;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Типизация манифеста и сходство типов

Другими важными концептоми относящимися к типам данных SQLite являетются типизация манифеста и сходство типов:

- Типизация манифеста означает, что тип данных является свойством значения а не свойством столбца. SQLite использует типизацию по договору для хранения любого типа данных в столбце.
- Сходство типос колонки - это рекомендованный тип данных для хранения в этой колонке. Помните, что тип рекомендован, а не обязателен, следовательно колонка может хранить любой тип данных.

В этом руководстве вы узнали о типах данных SQLite и несколько важных концептов, включая хранимые классы, типизация по договору и сходство типов.

---------------------------------------

Предидущее руководство < [SQLite FULL_TEXT SEARCH][prev]  
Следующее руководство > [SQLite DATE AND TIME][next]

[prev]: ../30_FullTextSearch/translate.md
[next]: ../32_DateAndTime/translate.md

[dateTimeTutorial]: https://www.sqlitetutorial.net/sqlite-date/