-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE VIEW albumArtists (
  albumTitle,
  artistName
) AS 
SELECT
  title,
  name
FROM
  albums
INNER JOIN artists USING (artistId);

INSERT INTO albumArtists (albumTitle, artistName)
VALUES ('Who Do You Trust?', 'Papa Roach');

CREATE TRIGGER insert_artist_album_trg
  INSTEAD OF INSERT ON albumArtists
BEGIN
  INSERT INTO artists(name)
  VALUES (NEW.artistName);

  INSERT INTO albums (title, artistId)
  VALUES (NEW.albumTitle, last_insert_rowid());
END;