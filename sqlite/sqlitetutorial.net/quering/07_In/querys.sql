-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  TrackId,
  Name,
  MediatypeId
FROM
  Tracks
WHERE
  MediaTypeId IN (1, 2)
ORDER BY
  Name ASC;

SELECT
  TrackId,
  Name,
  MediaTypeId
FROM
  Tracks
WHERE
  MediaTypeId = 1 OR MediaTypeId = 2
ORDER BY
  Name ASC;

SELECT albumid
FROM albums
WHERE artistid = 12;

SELECT
  trackId,
  name,
  albumId
FROM
  tracks
WHERE
  albumId IN (
    SELECT albumId
    FROM albums
    WHERE artistId = 12
  );

SELECT
  trackid,
  name,
  genreid
FROM
  tracks
WHERE
  genreid NOT IN (1, 2, 3);