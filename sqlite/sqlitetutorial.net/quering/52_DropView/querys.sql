-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE VIEW v_billing (
  invoiceId,
  invoiceDate,
  total
)
AS
  SELECT
    invoiceId,
    invoiceDate,
    SUM (unitPrice * quantity)
  FROM
    invoices
  INNER JOIN
    invoice_items USING (
      invoiceId
    );

DROP VIEW IF EXISTS v_xyz;

DROP VIEW v_xyz;