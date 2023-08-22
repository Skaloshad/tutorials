-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  trackId,
  name
FROM
  tracks
WHERE
  name LIKE 'Wild%';

SELECT
  trackId,
  name
FROM
  tracks
WHERE
  name LIKE '%Wild';

SELECT
  trackId,
  name
FROM
  tracks
WHERE
  name LIKE '%Wild%';

SELECT
  trackId,
  name
FROM
  tracks
WHERE
  name LIKE '%Br_wn%';

CREATE TABLE t(
  c TEXT
);

INSERT INTO t(c)
VALUES
  ('10% increase'),
  ('10 times dacrease'),
  ('100% vs. last year'),
  ('20% increase next year');

SELECT * FROM t;

SELECT c
FROM t
WHERE c LIKE '%10%%';

SELECT c
FROM t
WHERE c LIKE '%10\%%' ESCAPE '\';