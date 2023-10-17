-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

DROP TABLE contacts;

CREATE TABLE contacts (
  contact_id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT NOT NULL UNIQUE
);

INSERT INTO contacts (first_name, last_name, email)
VALUES ('John', 'Doe', 'john.doe@gmail.com');

CREATE TABLE shapes (
  shape_id INTEGER PRIMARY KEY,
  background_color TEXT,
  foreground_color TEXT,
  UNIQUE (background_color, foreground_color)
);

INSERT INTO shapes (background_color, foreground_color)
VALUES ('red', 'green');

INSERT INTO shapes (background_color, foreground_color)
VALUES ('red', 'blue');

CREATE TABLE lists (
  list_id INTEGER PRIMARY KEY,
  email TEXT UNIQUE
);

INSERT INTO lists (email)
VALUES (NULL), (NULL);