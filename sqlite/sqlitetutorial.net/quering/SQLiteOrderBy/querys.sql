-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

-- Выбрать столбцы name, milliseconds, albumId из таблицы tracks
SELECT
  name,
  milliseconds,
  albumId
FROM
  tracks;

-- Аналогично, но доплнительно отсортировать по столбцу albumId в порядке возрастания
SELECT
  name,
  milliseconds,
  albumId
FROM
  tracks
ORDER BY
  albumId ASC;

-- Аналоично, но без явного указания направления сортировки
SELECT
  name,
  milliseconds,
  albumId
FROM
  tracks
ORDER BY
  albumId;

-- Сортировка по нескольким полям. Сначала по albumId в порядке возрастания, потом по полю milliseconds в порядке убывания.
SELECT
  name,
  milliseconds,
  albumId
FROM
  tracks
ORDER BY
  albumId ASC,
  milliseconds DESC;

-- Сортировка по 3ему и 2у столбцу в порядке возрастания
SELECT
  name,
  milliseconds,
  albumId
FROM
  tracks
ORDER BY
  3, 2;

-- Сортировка по композитору (null сверху)
SELECT
  trackId,
  name,
  composer
FROM
  tracks
ORDER BY
  composer;

-- Сортировка по композитору (null снизу)
SELECT
  trackId,
  name,
  composer
FROM
  tracks
ORDER BY
  composer NULLS LAST;