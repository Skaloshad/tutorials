-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  name,
  composer
FROM
  tracks
WHERE
  composer = NULL;

SELECT
  name,
  composer
FROM
  tracks
WHERE
  composer IS NULL
ORDER BY
  name;

SELECT
  name,
  composer
FROM
  tracks
WHERE
  composer IS NOT NULL
ORDER BY
  name;