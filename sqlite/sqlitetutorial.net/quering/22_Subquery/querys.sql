-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT 
  trackId,
  name,
  albumId
FROM tracks
WHERE albumId = (
  SELECT albumId
  FROM albums
  WHERE title = 'Let There Be Rock'
);

SELECT 
  customerId,
  firstname,
  lastname
FROM
  customers
WHERE
  supportrepId IN (
    SELECT employeeId
    FROM employees
    WHERE country = 'Canada'
  );

SELECT AVG(SUM(bytes))
FROM tracks
GROUP BY albumId;

SELECT
  AVG(album.size)
FROM
  (
    SELECT
      SUM(bytes) size
    FROM
      tracks
    GROUP BY 
      albumId
  ) AS album;

SELECT 
  albumId,
  title
FROM
  albums
WHERE 10000000 > (
    SELECT SUM(bytes)
    FROM tracks
    WHERE tracks.albumId = albums.albumId
)
ORDER BY title;

SELECT 
  albumId,
  title,
  (
    SELECT COUNT(trackId)
    FROM tracks
    WHERE tracks.albumId = albums.albumId
  ) tracks_count
FROM albums
ORDER BY tracks_count DESC;