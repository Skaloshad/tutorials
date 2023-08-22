-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  trackId,
  name
FROM
  tracks
LIMIT 10;

SELECT
  trackId,
  name
FROM
  tracks
LIMIT 10 OFFSET 10;

SELECT
  trackId,
  name,
  bytes
FROM
  tracks
ORDER BY
  bytes DESC
LIMIT 10;

SELECT
  trackId,
  name,
  milliseconds
FROM
  tracks
ORDER BY
  milliseconds ASC
LIMIT 5;

SELECT
  trackId,
  name,
  milliseconds
FROM
  tracks
ORDER BY
  milliseconds DESC
LIMIT 1 OFFSET 1;

SELECT 
  trackId,
  name,
  bytes
FROM
  tracks
ORDER BY
  bytes ASC
LIMIT 1 OFFSET 2;