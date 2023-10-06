-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE people (
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO people (first_name, last_name)
VALUES ('John', 'Doe');

SELECT 
  rowid,
  first_name,
  last_name
FROM
  people;

DROP TABLE people;

CREATE TABLE people (
  person_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO people (person_id, first_name, last_name)
VALUES ( 9223372036854775807, 'Johnathan', 'Smith' );

INSERT INTO people (first_name, last_name)
VALUES ('William', 'Gate');

CREATE TABLE t1 (c TEXT);

INSERT INTO t1 (v1) VALUES ('A');
INSERT INTO t1 (v1) VALUES ('B');
INSERT INTO t1 (v1) VALUES ('C');
INSERT INTO t1 (v1) VALUES ('D');

SELECT rowid, v1 FROM t1;

DELETE FROM t1;

INSERT INTO t1 (v1) VALUES ('E');
INSERT INTO t1 (v1) VALUES ('F');
INSERT INTO t1 (v1) VALUES ('G');

DROP TABLE people;

CREATE TABLE people (
  person_id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO people (person_id, first_name, last_name)
VALUES (9223372036854775807, 'Johnathan', 'Smith');

INSERT INTO people (first_name, last_name)
VALUES ('John', 'Smith');