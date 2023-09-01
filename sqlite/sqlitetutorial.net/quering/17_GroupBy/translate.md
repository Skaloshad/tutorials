# SQLite GROUP BY ######################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-group-by/

## Обзор ##############################

В этом руководстве вы изучите, как, используя предложение SQLite `GROUP BY`, создать набор сводных строк из обычного набора строк.

## Знакомство с предложением SQLite `GROUP BY` 

Предложения `GROUP BY` является необязательным предложением выражения `SELECT`. Предложение `GROUP BY` преобразует группу строк в сводные строки по значениям одного или более столбцов.

Предложение `GROUP BY` возвращает одну строку для каждой группы. Для каждой группы вы можете применить функцию аггрегации, такие как: `MIN`, `MAX`, `SUM`, `COUNT` или `AVG`, чтобы обеспечить вывод большей информации о каждой группе.

Слудующее выражение показывает синтаксис предложения SQLite `GROUP BY`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  column_1,
  aggregate_function(column_2)
FROM
  table
GROUP BY
  column_1,
  column_2;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Предложение `GROUP BY` слудет за предложением `FROM` в выражении `SELECT`. В случае, если выражение содержит предложение `WHERE`, предложение `GROUP BY` должно идти после него.

Следующие строки за предложением `GROUP BY` - это колонка, или список колонок, разделенный запятыми, использующиеся для определения групп.

## Примеры SQLite `GROUP BY`

Вы используем таблицу `tracks` тестовой базы данных для демонстации.

![tracks][]

### Предложение `GROUP BY` с функцией `COUNT`

Слудующее выражение возвращает идентификатор альбома и номер трека для каждого альбома. Оно использует предложение `GROUP BY` для группировки треков по альбомам и применения функции `COUNT()` к каждой группе.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  albumId,
  COUNT(trackId)
FROM
  tracks
GROUP BY
  albumId;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![01_resultset][]

Вы можете использовать предложение `ORDER BY` для сортировки групп, как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  albumId,
  COUNT(trackId)
FROM
  tracks
GROUP BY
  albumId
ORDER BY
  COUNT(trackId) DESC;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![02_resultset][]

### SQLite `GROUP BY` и `INNER JOIN`

Вы можете выбирать данные из нескольких таблиц, используя предложение `INNER JOIN`, затем используйте предложение `GROUP BY` для группировки строк в набор сводных строк.

Например, следующее выражение объединяет таблицу `tracks` с таблицей `albums` для получения названий альбомов и использует предложение `GROUP BY` с функцией `COUNT` для получения количества треков в каждом альбоме.

![tracks_albums][]

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  tracks.albumId,
  title,
  COUNT(trackId)
FROM
  tracks
INNER JOIN albums USING (albumId)
GROUP BY
  tracks.albumId;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![03_resultset][]

### SQLite `GROUP BY` с предложением `HAVING`

Чтобы отфильтровать группы используется `GROUP BY` с предложением `HAVING`. Например, чтобы получить альбомы, у которых больше 15 треков, используется следующее выражение:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  tracks.albumId,
  title,
  COUNT(trackId)
FROM
  tracks
INNER JOIN albums USING (albumId)
GROUP BY
  tracks.albumId
HAVING COUNT(trackId) > 15;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![04_resultset][]

### Пример предложения SQLite `GROUP BY` с функцией `SUM`

Вы можете использовать функцию `SUM` для вычисления итогов по группе. Например, чтобы получить сумму длинны и быйтов для каждого альбома, используется функция `SUM` для вычисления общего числа миллисекунд и байтов.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  albumId,
  SUM(milliseconds) length,
  SUM(bytes) size
FROM
  tracks
GROUP BY
  albumId;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![05_resultset][]

### SQLite `GROUP BY` с функциями `MAX`, `MIN` и `AVG`

Следующее выражение возвращает идентификатор альбома, название альбома, максимальная длинна, минимальная длинна и средняя длинна треков в таблице `tracks`.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  tracks.albumId albumId,
  title,
  MIN(milliseconds),
  MAX(milliseconds),
  ROUND(AVG(milliseconds), 2)
FROM
  tracks
INNER JOIN albums USING (albumId)
GROUP BY
  albumId;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![06_resultset][]

### Пример SQLite `GROUP BY` с несколькими столбцами

В прелилушем примере мы использовали одну колонку в предложении `GROUP BY`. SQLite позволяет группировать строки по нескольким столбцам.

Например, чтобы сгруппировать треки по типу медиа и жанру, используйте следующее выражение:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT 
  mediaTypeId,
  genreId,
  COUNT(trackId)
FROM
  tracks
GROUP BY
  mediaTypeId,
  genreId;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![07_resultset][]

SQLite испльзует комбинацию значений колонок `mediaTypeId` и `genreId` как группу, например, (1, 1) и (1, 2). Он применяет функция `COUNT` для возврата количества треков для каждой такой группы.

### Пример SQLite `GROUP BY` с датами

Посмотрите таблицу `invoices` приведенную ниже:

![invoices][]

Следующее выражение возвращает количество счетов по годам.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  STRFTIME('%Y', invoiceDate) invoiceYear,
  COUNT(invoiceId) invoiceCount
FROM
  invoices
GROUP BY
  invoiceYear
ORDER BY
  invoiceYear;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Вот вывод:

![08_resultset][]

В этом примере:

- Функция `STRFTIME('%Y', invoiceDate)` возвращает год из строки с датой.

- Предложение `GROUP BY` группирует счета по годам.

- Функция `COUNT()` возвращает количество счетов за каждый год (или группу).

В этом руководстве вы изучили, как использовать предложение SQLite `GROUP BY` для группировки строк в сводные строки.

Предидущее руководство < [SQLite SELF JOIN][prev]  
Следующее руководство > [SQLite HAVING][next]

[prev]: ../16_SelfJoin/translate.md
[next]: ../18_Having/translate.md

[tracks]: ./tracks.png
[tracks_albums]: ./tracks_albums.png
[invoices]: ./invoices.png
[01_resultset]: ./01_resultset.png
[02_resultset]: ./02_resultset.png
[03_resultset]: ./03_resultset.png
[04_resultset]: ./04_resultset.png
[05_resultset]: ./05_resultset.png
[06_resultset]: ./06_resultset.png
[07_resultset]: ./07_resultset.png
[08_resultset]: ./08_resultset.png