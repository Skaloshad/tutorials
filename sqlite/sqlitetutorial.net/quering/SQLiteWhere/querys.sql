-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  name,
  milliseconds,
  bytes,
  albumId
FROM
  tracks
WHERE
  albumId = 1;

SELECT
  name,
  milliseconds,
  bytes,
  albumId
FROM
  tracks
WHERE
  albumId = 1
  AND milliseconds > 250000;

SELECT
  name,
  albumId,
  composer
FROM
  tracks
WHERE
  composer LIKE '%Smith%'
ORDER BY
  albumId;

SELECT
  name,
  albumId,
  mediatypeId
FROM
  tracks
WHERE
  mediatypeId IN (2, 3);