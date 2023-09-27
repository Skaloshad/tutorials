-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE datetime_text (
  d1 TEXT,
  d2 TEXT
);

SELECT datetime('now');

SELECT datetime('now', 'localtime');

INSERT INTO datetime_text (d1, d2)
VALUES
  ( datetime('now'), datetime('now', 'localtime') );

SELECT
  d1,
  typeof(d1),
  d2,
  typeof(d2)
FROM
  datetime_text;

CREATE TABLE datetime_real (
    d1 real
);

INSERT INTO datetime_real (d1)
VALUES ( julianday('now') );

SELECT d1 FROM datetime_real;

SELECT
  date(d1),
  time(d1)
FROM
  datetime_real;

CREATE TABLE datetime_int (d1 int);

INSERT INTO datetime_int (d1)
VALUES ( strftime('%s', 'now') );

SELECT d1 FROM datetime_int;

SELECT datetime(d1, 'unixepoch')
FROM datetime_int;