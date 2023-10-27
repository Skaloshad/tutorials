-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TEMPORARY TABLE temp_table1 ( name TEXT );

SELECT
  name
FROM
  sqlite_schema
WHERE
  type = 'table' AND
  name NOT LIKE 'sqlite_%';