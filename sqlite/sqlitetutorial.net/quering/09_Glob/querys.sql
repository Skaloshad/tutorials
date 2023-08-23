-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  trackId,
  name
FROM
  tracks
WHERE
  name GLOB 'Man*';

SELECT
  trackId,
  name
FROM
  tracks
WHERE
  name GLOB '*Man';

SELECT
  trackId,
  name
FROM
  tracks
WHERE
  name GLOB '?ere*';

SELECT
  trackId,
  name
FROM
  tracks
WHERE
  name GLOB '*[1-9]*';

SELECT
  trackId,
  name
FROM
  tracks
WHERE
  name GLOB '*[^1-9]*';

SELECT
  trackId,
  name
FROM
  tracks
WHERE
  name GLOB '*[1-9]';