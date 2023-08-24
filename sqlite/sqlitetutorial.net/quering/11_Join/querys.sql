-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  title,
  name
FROM
  albums
INNER JOIN artists
  ON artists.artistId = albums.artistId;

SELECT
  l.title,
  r.name
FROM
  albums l
INNER JOIN artists r ON
  r.artistId = l.artistId;

SELECT
  title,
  name
FROM
  albums
INNER JOIN artists USING(artistId);

SELECT
  name,
  title
FROM
  artists
LEFT JOIN albums ON
  artists.artistId = albums.artistId
ORDER BY name;

SELECT
  name,
  title
FROM
  artists
LEFT JOIN albums USING (artistId)
ORDER BY 
  name;

SELECT
  name,
  title
FROM
  artists
LEFT JOIN albums ON
  artists.artistId = albums.artistId
WHERE title IS NULL
ORDER BY name;

CREATE TABLE products(
  product text NOT NULL
);

INSERT INTO products(product)
VALUES ('P1'),('P2'),('P3');

CREATE TABLE calendars(
    y int NOT NULL,
    m int NOT NULL
);

INSERT INTO calendars(y, m)
VALUES
  (2019,1),
  (2019,2),
  (2019,3),
  (2019,4), 
  (2019,5),
  (2019,6),
  (2019,7),
  (2019,8), 
  (2019,9),
  (2019,10),
  (2019,11),
  (2019,12);

SELECT *
FROM products
CROSS JOIN calendars;