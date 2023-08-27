-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  artists.artistId,
  albumId
FROM
  artists
LEFT JOIN albums ON
  albums.artistId = artists.artistId
ORDER BY
  albumId;

SELECT
  ar.artistId,
  albumId
FROM
  artists ar
LEFT JOIN albums USING (artistId)
WHERE albumId IS NULL;