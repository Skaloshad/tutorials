-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  albumId,
  COUNT(trackId)
FROM
  tracks
GROUP BY
  albumId;

SELECT
  albumId,
  COUNT(trackId)
FROM
  tracks
GROUP BY
  albumId
HAVING albumId = 1;

SELECT
  albumId,
  COUNT(trackId)
FROM
  tracks
GROUP BY
  albumId
HAVING
  COUNT(albumid) BETWEEN 18 AND 20
ORDER BY albumId;

SELECT
  tracks.albumId,
  title,
  SUM(milliseconds) AS length
FROM
  tracks
INNER JOIN albums USING (albumId)
GROUP BY
  tracks.albumId
HAVING
  length > 60000000;