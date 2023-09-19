-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  employeeId,
  firstName,
  lastName,
  title,
  email
FROM
  employees;

UPDATE
  employees
SET
  lastName = 'Smith'
WHERE
  employeeId = 3;

SELECT
  employeeId,
  firstName,
  lastName,
  title,
  email
FROM
  employees
WHERE
  employeeId = 3;

UPDATE
  employees
SET
  city = 'Toronto',
  state = 'ON',
  postalcode = 'M5P 2N7'
WHERE
  employeeId = 4;

SELECT
  employeeId,
  firstName,
  lastName,
  state,
  city
  postalCode
FROM
  employees
WHERE
  employeeId = 4;

SELECT
  employeeId,
  firstName,
  lastName,
  email
FROM
  employees;

UPDATE
  employees
SET
  email = LOWER (
    firstName || "." || lastName || "@chinookcorp.com"
  )
ORDER BY
  firstName
LIMIT 1;

UPDATE
  employees
SET
  email = LOWER (
    firstName || "." || lastName || "@chinookcorp.com"
  );