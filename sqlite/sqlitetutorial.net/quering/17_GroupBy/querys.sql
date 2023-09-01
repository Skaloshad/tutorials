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
ORDER BY
  COUNT(trackId) DESC;

SELECT
  tracks.albumId,
  title,
  COUNT(trackId)
FROM
  tracks
INNER JOIN albums USING (albumId)
GROUP BY
  tracks.albumId;

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

SELECT
  albumId,
  SUM(milliseconds) length,
  SUM(bytes) size
FROM
  tracks
GROUP BY
  albumId;

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

SELECT 
  mediaTypeId,
  genreId,
  COUNT(trackId)
FROM
  tracks
GROUP BY
  mediaTypeId,
  genreId;

SELECT
  STRFTIME('%Y', invoiceDate) invoiceYear,
  COUNT(invoiceId) invoiceCount
FROM
  invoices
GROUP BY
  invoiceYear
ORDER BY
  invoiceYear;