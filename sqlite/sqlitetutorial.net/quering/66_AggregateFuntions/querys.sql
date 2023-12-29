-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  albumId,
  ROUND(AVG(milliseconds) / 60000, 0) "Average In Minutes"
FROM
  tracks
GROUP BY
  albumId;

SELECT
  COUNT(*)
FROM
  tracks;

SELECT
  albumId,
  COUNT(trackId) track_count
FROM
  tracks
GROUP BY
  albumId
ORDER BY
  track_count DESC;

SELECT
  albumId,
  SUM(milliseconds) / 60000 "Minutes"
FROM
  tracks
GROUP BY
  albumId;

SELECT
  MAX(milliseconds) / 60000 "Minutes"
FROM
  tracks;

SELECT
  trackId,
  name,
  milliseconds
FROM
  tracks
WHERE
  milliseconds = (
    SELECT
      MAX(milliseconds)
    FROM
      tracks
  );

SELECT
  trackId,
  name,
  milliseconds
FROM
  tracks
WHERE
  milliseconds = (
    SELECT
      MIN(milliseconds)
    FROM
      tracks
  );

SELECT
  GROUP_CONCAT(name)
FROM
  tracks
WHERE
  albumId = 10;