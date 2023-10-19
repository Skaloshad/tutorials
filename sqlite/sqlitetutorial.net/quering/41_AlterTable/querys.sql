-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE devices (
  name TEXT NOT NULL,
  model TEXT NOT NULL,
  serial INTEGER NOT NULL UNIQUE
);

INSERT INTO devices (name, model, serial)
VALUES ('HP ZBook 17 G3 Mobile Workstation', 'ZBook', 'SN-2015');

ALTER TABLE devices
RENAME TO equipment;

SELECT 
  name,
  model,
  serial
FROM
  equipment;

ALTER TABLE equipment
ADD COLUMN location TEXT;

CREATE TABLE users (
  userId INTEGER PRIMARY KEY,
  firstName TEXT NOT NULL,
  lastName TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL
);

CREATE TABLE favorites (
  userId INTEGER,
  playlistId INTEGER,
  FOREIGN KEY (userId)
    REFERENCES users(userId),
  FOREIGN KEY (playlistId)
    REFERENCES playlists(playlistId)
);

INSERT INTO users (firstName, lastName, email, phone)
VALUES ('John', 'Doe', 'john.doe@example.com', '408-23403456');

INSERT INTO favorites(userId, playlistId)
VALUES (1, 1);

SELECT * FROM users;

SELECT * FROM favorites;



PRAGMA foreign_keys = off;

BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS persons (
  userId INTEGER PRIMARY KEY,
  firstName TEXT NOT NULL,
  lastName TEXT NOT NULL,
  email TEXT NOT NULL
);

INSERT INTO persons (userId, firstName, lastName, email)
SELECT userId, firstName, lastName, email
FROM users;

DROP TABLE users;

ALTER TABLE persons RENAME TO users;

COMMIT;

PRAGMA foreign_keys = on;