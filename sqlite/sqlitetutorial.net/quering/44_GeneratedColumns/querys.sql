-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE products (
  name TEXT NOT NULL,
  price REAL NOT NULL,
  discount REAL NOT NULL,
  tax REAL NOT NULL,
  net_price REAL GENERATED ALWAYS
    AS (price * (1 - discount) * (1 + tax))
);

INSERT INTO products (name, price, discount, tax)
VALUES ('ABC Widget', 100, 0.05, 0.07);