-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT 
  customerId,
  company
FROM
  customers
WHERE
  length(company) > 10
ORDER BY length(company) DESC;

EXPLAIN QUERY PLAN
SELECT 
  customerId,
  company
FROM
  customers
WHERE length(company) > 10
ORDER BY length(company) DESC;

CREATE INDEX customers_length_company
ON customers( LENGTH(company) );

CREATE INDEX invoice_line_amount
ON invoice_items( unitPrice * quantity );