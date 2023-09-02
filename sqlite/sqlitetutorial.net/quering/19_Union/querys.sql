-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE t1 (
  v1 INT
);

INSERT INTO t1 (v1)
VALUES (1), (2), (3);

CREATE TABLE t2 (
  v2 INT
);

INSERT INTO t2 (v2)
VALUES (2), (3), (4);

SELECT v1
FROM t1
UNION
SELECT v2
FROM t2;

SELECT v1
FROM t1
UNION ALL
SELECT v2
FROM t2;

SELECT firstName, lastName, 'Employee' AS type
FROM employees
UNION
SELECT firstName, lastName, 'Customer'
FROM customers;

SELECT firstName, lastName, 'Employee' AS type
FROM employees
UNION
SELECT firstName, lastName, 'Customer'
FROM customers
ORDER BY firstName, lastName;