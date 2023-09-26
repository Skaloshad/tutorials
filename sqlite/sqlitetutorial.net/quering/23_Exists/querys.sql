-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  customerId,
  firstName,
  lastName,
  company
FROM
  customers c
WHERE
  EXISTS (
    SELECT 1
    FROM invoices i
    WHERE i.customerId = c.customerId
  )
ORDER BY
  firstName,
  lastName;

SELECT
  customerId,
  firstName,
  lastName,
  company
FROM
  customers c
WHERE
  customerId IN (
    SELECT customerId
    FROM invoices
  )
ORDER BY 
  firstName,
  lastName;

SELECT 
  *
FROM
  artists a
WHERE
  NOT EXISTS (
    SELECT 1
    FROM albums
    WHERE a.artistId = artistId
  )
ORDER BY name;