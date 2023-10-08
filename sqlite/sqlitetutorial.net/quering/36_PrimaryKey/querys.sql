-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE countries (
  country_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE languages (
  language_id INTEGER,
  name TEXT NOT NULL,
  PRIMARY KEY (language_id)
);

CREATE TABLE country_languages (
  country_id INTEGER NOT NULL,
  language_id INTEGER NOT NULL,
  PRIMARY KEY (country_id, language_id),
  FOREIGN KEY (country_id) REFERENCES countries (country_id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (language_id) REFERENCES languages (language_id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);

CREATE TABLE cities (
  id INTEGER NOT NULL,
  name TEXT NOT NULL
);

INSERT INTO cities (id, name)
VALUES (1, 'San Jose');

PRAGMA foreign_keys = off;

BEGIN TRANSACTION;

ALTER TABLE cities RENAME TO old_cities;

CREATE TABLE cities (
  id INTEGER NOT NULL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO cities 
SELECT * FROM old_cities;

DROP TABLE old_cities;

COMMIT;

PRAGMA foreign_keys = on;

PRAGMA table_info([cities]);

PRAGMA table_list;

SELECT * FROM pragma_table_list;