-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE IF NOT EXISTS positions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  min_salary NUMERIC
);

INSERT INTO positions (title, min_salary)
VALUES 
  ('DBA', 120000),
  ('Developer', 100000),
  ('Architect', 150000);

SELECT * FROM positions;

CREATE UNIQUE INDEX idx_positions_title
ON positions (title);

REPLACE INTO positions (title, min_salary)
VALUES ('Full Stack Developer', 140000);

REPLACE INTO positions (title, min_salary)
VALUES ('DBA', 170000);

REPLACE INTO positions (id, min_salary)
VALUES (2, 110000);