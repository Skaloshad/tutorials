-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

INSERT INTO artists (name)
VALUES ('Bud Powell');

SELECT 
  artistId,
  name
FROM
  artists
ORDER BY
  artistId DESC
LIMIT 1;

INSERT INTO artists (name)
VALUES
  ("Buddy Rich"),
  ("Candido"),
  ("Charlie Byrd");

SELECT
  artistId,
  name
FROM
  artists
ORDER BY
  artistId DESC
LIMIT 3;

INSERT INTO artists DEFAULT VALUES;

SELECT
  artistId,
  name
FROM
  artists
ORDER BY
  artistId DESC;

CREATE TABLE artists_backup (
  artistId INTEGER PRIMARY KEY AUTOINCREMENT,
  name NVARCHAR
);

INSERT INTO artists_backup
SELECT artistId, name
FROM artists;

SELECT * FROM artists_backup;