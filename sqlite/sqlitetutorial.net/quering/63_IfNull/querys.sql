-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  firstName,
  lastName,
  fax,
  phone
FROM
  customers;

SELECT 
  firstName,
  lastName,
  IFNULL( fax, 'Call:' || phone ) fax
FROM
  customers
ORDER BY firstName;