-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT city
FROM customers
ORDER BY city;

SELECT DISTINCT city
FROM customers
ORDER BY city;

SELECT
  city,
  country
FROM
  customers
ORDER BY
  country;

SELECT DISTINCT
  city,
  country
FROM
  customers
ORDER BY
  country;

SELECT company
FROM customers;

SELECT DISTINCT company
FROM customers;