-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT 
  m.firstname || ' ' || m.lastname AS 'Manager',
  e.firstname || ' ' || e.lastname AS 'Direct report'
FROM
  employees e
INNER JOIN employees m ON m.employeeId = e.reportsTo
ORDER BY manager;

SELECT 
  m.firstname || ' ' || m.lastname AS 'Manager',
  e.firstname || ' ' || e.lastname AS 'Direct report'
FROM
  employees e
LEFT JOIN employees m ON m.employeeId = e.reportsTo
ORDER BY manager;

SELECT DISTINCT
  e1.city,
  e1.firstname || ' ' || e1.lastname AS fullname
FROM
  employees e1
INNER JOIN employees e2 ON e2.city = e1.city
  AND (e1.firstname <> e2.firstname AND e1.lastname <> e2.lastname)
ORDER BY
  e1.city;