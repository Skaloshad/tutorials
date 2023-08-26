# SQLite INNER JOIN ######################

[Файл с запросами][querys]   
[Оригинальная статья][origin]

[querys]: ./querys.sql
[origin]: https://www.sqlitetutorial.net/sqlite-inner-join/

## Обзор ##############################

В этом руководстве показано, как, используя предложение SQLite `INNER JOIN`, выбирать данные из нескольких таблиц.

## Знакомство с предложением SQLite `INNER JOIN`

В реляционных базах данных, данные обычно распределены по множеству связвных таблиц. Таблица связана с другой таблицей посредством внешнех ключей.

Чтобы запросить данные из нескольких таблиц, используется предложение `INNER JOIN`. Предложение `INNER JOIN` комбинирует столбцы с коррелирующей таблицей.

Предположим, вы имеете две таблицы: `A` и `B`.

`A` имеет колонки `a1`, `a2` и `f`. `B` имеет колонки `b1`, `b2` и `f`. Таблица `A` ссылается на таблицу `B` используя колонку внешнего ключа `f`.

Ниже, показан синтаксис предложени `INNER JOIN`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT a1, a2, b1, b2
FROM A
INNER JOIN B ON B.f = A.f;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Для каждой строчки в таблице `A`, предложение `INNER JOIN` сравнивает значение столбца `f` со значением столбца `f` таблицы `B`. Если значение столбца `f` таблицы `A` равно значению столбца `f` таблицы `B`, оно объединяет данные из столбцов `a1`, `a2`, `b1` и `b2`, и включает строки в выборку.

Другими словами, предложение `INNER JOIN` возвращает строки из таблицы `A`, которые соответствуют строкам из таблицы `B`.

Это логика также применяется, если вы объединяете больше двух таблиц.

Посмотрите следующий пример:

![InnerJoinExample][]

Только строки (`a1, 1`) и (`a3, 3`) таблицы `A` имеют соответствующие строки (`b1, 1`) и (`b2, 3`) таблицы `B`, которые включены в выборку.

Следующая диаграмма иллюстрирует предложение `INNER JOIN`:

![InnerJoinDiag][]

## Примеры SQLite `INNER JOIN`

Давайте посмотрим на таблицы `tracks` и `albums` тестовой базы данных. Таблица `tracks` ссылается на таблицы `albums` посредством столбца `albumId`.

![tracksAlbums][]

В таблице `tracks` колонка `albumId` является внешним ключем. А в таблице `albums` колонка `albumId` является первичным ключем.

Следующее выражение используется для выборки данных из обоих таблиц `tracks` и `albums`:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  trackId,
  name,
  title
FROM
  tracks
INNER JOIN albums USING (albumId);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![01_resultset][]

Для каждой строки таблицы `tracks` SQLite использует значение столбца `albumId`, чтобы сопоставить его со значением столбца `albumId` таблицы `albums`. Если SQLite находит соответствие, он комбинирует данные строк из обоих таблиц в выборке.

Вы можете добавить столбец `albumId` из обоих таблиц в конечный результат, чтобы увидеть эффект.

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT
  trackId,
  name,
  tracks.albumId AS album_id_tracks,
  albums.albumId AS album_id_albums,
  title
FROM
  tracks
INNER JOIN albums USING (albumId);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![02_resultset][]

## SQLite `INNER JOIN` - 3 таблицы

Посмотрите на следующие таблицы: `tracks`, `albums` и `artists`.

![tracksAlbumsArtists][]

Один трек принадлежит одному альбому, и один альбом имеет множество треков. Таблица `tracks` свяжана с таблицей `albums` посредством столбца `albumId`.

Один альбом принадлежит одному артисту, и один артист имеет один или более альбомов. Таблица `albums` связана с таблицей `artists` посредством столбца `artistId`.

Дли выбора данных из этих таблиц, вы должны использовать предложение `INNER JOIN` в выражении `SELECT`, как показано ниже:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT 
  trackId,
  tracks.name AS track,
  albums.title AS album,
  artists.name AS artist
FROM
  tracks
INNER JOIN albums USING (albumId)
INNER JOIN artists USING (artistsId);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![03_resultset][]

Вы можете использовать предложение `WHERE` для получения треков и альбомов с `id` артиста `10`, как показано далее:

~~~ SQL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SELECT 
  trackId,
  t.name AS track,
  al.title AS album,
  ar.name AS artist
FROM
  tracks t
INNER JOIN albums al USING (albumId)
INNER JOIN artists ar USING (artistId)
WHERE
  ar.artistId = 10;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![04_resultset][]

В этом руководстве вы изучили, как использовать предложение SQLite `INNER JOIN` для запроса данных из нескольких таблиц.

Предидущее руководство < [SQLite JOIN][prev]  
Следующее руководство > [SQLite LEFT JOIN][next]

[prev]: ../11_Join/translate.md
[next]: ../13_LeftJoin/translate.md

[InnerJoinExample]:     ./SQLite-Inner-Join-Example.png
[InnerJoinDiag]:        ./SQLite-inner-join-venn-diagram.png
[tracksAlbums]:         ./tracks_albums.png
[01_resultset]:         ./01_resultset.png
[02_resultset]:         ./02_resultset.png
[tracksAlbumsArtists]:  ./artists_albums_tracks.png
[03_resultset]:         ./03_resultset.png
[04_resultset]:         ./04_resultset.png