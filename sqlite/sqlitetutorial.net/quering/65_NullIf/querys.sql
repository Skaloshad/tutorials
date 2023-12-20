-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE IF NOT EXISTS products (
  name TEXT NOT NULL,
  price NUMERIC NOT NULL,
  discount NUMERIC DEFAULT 0,
  CHECK (
    price >= 0 AND
    discount >= 0 AND
    price > discount
  )
);

INSERT INTO products ( name, price, discount )
VALUES 
  ('Apple iPhone', 700, 0),
  ('Samsung Galaxy', 600, 10),
  ('Google Nexus', 399, 20);

SELECT COUNT(NULLIF(discount, 0)) discount_products
FROM products;

SELECT COUNT(*)
FROM products
WHERE discount > 0;

SELECT COUNT(
  CASE
    WHEN discount = 0
    THEN NULL
    ELSE 1 END
)
FROM products;