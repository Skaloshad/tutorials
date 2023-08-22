-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT
  InvoiceId,
  BillingAddress,
  Total
FROM
  invoices
WHERE
  Total BETWEEN 14.91 AND 18.86
ORDER BY
  Total;

SELECT
  InvoiceId,
  BillingAddress,
  Total
FROM
  invoices
WHERE
  Total NOT BETWEEN 1 AND 20
ORDER BY
  Total;

SELECT
  InvoiceId,
  BillingAddress,
  InvoiceDate,
  Total
FROM
  invoices
WHERE
  InvoiceDate BETWEEN '2010-01-01' AND '2010-01-31'
ORDER BY
  InvoiceDate;

SELECT
  InvoiceId,
  BillingAddress,
  date(InvoiceDate) InvoiceDate,
  Total
FROM
  invoices
WHERE
  InvoiceDate NOT BETWEEN '2009-01-03' AND '2013-12-01'
ORDER BY
  InvoiceDate;