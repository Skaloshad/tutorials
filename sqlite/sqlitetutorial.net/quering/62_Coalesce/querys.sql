-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT 
  firstName,
  lastName,
  company
FROM customers
ORDER BY firstName;

SELECT 
  firstName,
  lastName,
  COALESCE(company, 'Individual') entity
FROM customers
ORDER BY firstName;

CREATE TABLE IF NOT EXISTS memberships (
  membershipId INT PRIMARY KEY,
  programName TEXT NOT NULL,
  netPrice NUMERIC NOT NULL,
  discount NUMERIC
);

INSERT INTO memberships (programName, netPrice, discount)
VALUES 
  ('1 Month', 100, null),
  ('3 Months', 300, 10),
  ('6 Months', 600, 30);

SELECT 
  programName,
  (netPrice - discount) AS amount
FROM memberships;

SELECT 
  programName,
  (netPrice - COALESCE(discount, 0)) AS amount
FROM memberships;