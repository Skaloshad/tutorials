-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

-- create artists backup table
CREATE TABLE artists_backup (
  artistId INTEGER PRIMARY KEY AUTOINCREMENT,
  name NVARCHAR
);
-- populate data from the artists table

INSERT INTO artists_backup
SELECT artistId, name
FROM artists;

SELECT
  artistId,
  name
FROM
  artists_backup;

DELETE FROM artists_backup
WHERE artistId = 1;

DELETE FROM artists_backup
WHERE name LIKE '%Santana%';

DELETE FROM artists_backup;