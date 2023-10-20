-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE locations (
  locationId INTEGER PRIMARY KEY,
  address TEXT NOT NULL,
  city TEXT NOT NULL,
  state TEXT NOT NULL,
  country TEXT NOT NULL
);

INSERT INTO locations (address, city, state, country)
VALUES ('3960 North 1st Street', 'San Jose', 'CA', 'USA');

ALTER TABLE locations
RENAME COLUMN address TO street;

