-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  trackId,
  tracks.name,
  albums.title AS album,
  media_types.name AS media,
  genres.name AS genres
FROM
  tracks
INNER JOIN albums USING (albumId)
INNER JOIN media_types USING (mediaTypeId)
INNER JOIN genres USING (genreId);

CREATE VIEW v_tracks
AS
SELECT
  trackId,
  tracks.name,
  albums.title AS album,
  media_types.name AS media,
  genres.name AS genres
FROM
  tracks
INNER JOIN albums USING (albumId)
INNER JOIN media_types USING (mediaTypeId)
INNER JOIN genres USING (genreId);

SELECT * FROM v_tracks;

CREATE VIEW v_albums (
  albumTitle,
  minutes
)
AS
  SELECT
    albums.title,
    SUM (milliseconds) / 60000
  FROM
    tracks
  INNER JOIN albums USING (albumId)
  GROUP BY albums.title;

DROP VIEW v_albums;

SELECT * FROM v_albums;