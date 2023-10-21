-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE IF NOT EXISTS people (
  personId INTEGER PRIMARY KEY,
  firstName TEXT,
  lastName TEXT,
  addressId INTEGER,
  FOREIGN KEY (addressId)
    REFERENCES addresses (addressId)
);

CREATE TABLE IF NOT EXISTS addresses (
  addressId INTEGER PRIMARY KEY,
  houseNo TEXT,
  street TEXT,
  city TEXT,
  postalCode TEXT,
  country TEXT
);

INSERT INTO addresses (houseNo, street, city, postalCode, country)
VALUES ('3960', 'North 1st Street', 'San Jose', '95134', 'USA');

INSERT INTO people (firstName, lastName, addressId)
VALUES ('John', 'Doe', 1);

DROP TABLE addresses;

PRAGMA foreign_keys = OFF;

DROP TABLE addresses;

UPDATE people
SET addressId = NULL;

PRAGMA foreign_keys = ON;