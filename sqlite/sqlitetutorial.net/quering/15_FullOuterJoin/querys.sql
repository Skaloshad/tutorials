-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE dogs (
  type  TEXT,
  color TEXT
);

INSERT INTO dogs(type, color)
VALUES ('Hunting', 'Black'), ('Guard', 'Brown');

CREATE TABLE cats (
  type  TEXT,
  color TEXT
);

INSERT INTO cats (type, color)
VALUES ('Indoor', 'White'), ('Outdoor', 'Black');

SELECT *
FROM dogs
FULL OUTER JOIN cats USING (color);

SELECT 
  d.type,
  d.color,
  c.type,
  c.color
FROM dogs d
LEFT JOIN cats c USING (color)
UNION ALL
SELECT 
  d.type,
  d.color,
  c.type,
  c.color
FROM cats c
LEFT JOIN dogs d USING (color)
WHERE d.color IS NULL;