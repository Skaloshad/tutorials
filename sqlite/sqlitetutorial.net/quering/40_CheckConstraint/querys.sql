-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE contacts (
  contact_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT,
  phone TEXT NOT NULL CHECK (length(phone) >= 10)
);

INSERT INTO contacts (first_name, last_name, phone)
VALUES ('John', 'Doe', '408123456');

INSERT INTO contacts (first_name, last_name, phone)
VALUES ('John', 'Doe', '(408)-123-456');

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  product_name TEXT NOT NULL,
  list_price DECIMAL (10, 2) NOT NULL,
  discount DECIMAL (10, 2) NOT NULL DEFAULT 0,
  CHECK (list_price >= discount AND discount >= 0 AND list_price >= 0)
);

INSERT INTO products (product_name, list_price, discount)
VALUES ('New Product', 900, 1000);