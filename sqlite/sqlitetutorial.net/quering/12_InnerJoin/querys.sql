-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  trackId,
  name,
  title
FROM
  tracks
INNER JOIN albums USING (albumId);

SELECT
  trackId,
  name,
  tracks.albumId AS album_id_tracks,
  albums.albumId AS album_id_albums,
  title
FROM
  tracks
INNER JOIN albums USING (albumId);

SELECT 
  trackId,
  tracks.name AS track,
  albums.title AS album,
  artists.name AS artist
FROM
  tracks
INNER JOIN albums USING (albumId)
INNER JOIN artists USING (artistId);

SELECT 
  trackId,
  t.name AS track,
  al.title AS album,
  ar.name AS artist
FROM
  tracks t
INNER JOIN albums al USING (albumId)
INNER JOIN artists ar USING (artistId)
WHERE
  ar.artistId = 10;