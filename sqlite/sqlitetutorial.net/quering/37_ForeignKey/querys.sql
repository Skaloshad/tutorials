-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

PRAGMA foreign_keys;

PRAGMA foreign_keys = ON;

CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name TEXT NOT NULL,
  group_id INTEGER NOT NULL
);

CREATE TABLE supplier_groups (
  group_id INTEGER PRIMARY KEY,
  group_name TEXT NOT NULL
);

DROP TABLE suppliers;

CREATE TABLE suppliers (
  suppliers_id INTEGER PRIMARY KEY,
  suppliers_name TEXT NOT NULL,
  group_id INTEGER NOT NULL,
  FOREIGN KEY (group_id)
    REFERENCES supplier_groups (group_id)
);

INSERT INTO supplier_groups (group_name)
VALUES
  ('Domestic'),
  ('Global'),
  ('One-Time');

INSERT INTO suppliers (suppliers_name, group_id)
VALUES
  ('HP', 2);

INSERT INTO suppliers (suppliers_name, group_id)
VALUES
  ('ABC Inc.', 4);

DROP TABLE suppliers;

CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name TEXT NOT NULL,
  group_id INTEGER,
  FOREIGN KEY (group_id)
    REFERENCES supplier_groups (group_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);

INSERT INTO suppliers (supplier_name, group_id)
VALUES
  ('XYZ Corp.', 3);

INSERT INTO suppliers (supplier_name, group_id)
VALUES
  ('ABC Corp.', 3);

DELETE FROM supplier_groups
WHERE group_id = 3;

SELECT * FROM suppliers;

DROP TABLE suppliers;

CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name TEXT NOT NULL,
  group_id INTEGER,
  FOREIGN KEY (group_id)
    REFERENCES supplier_groups (group_id)
      ON UPDATE RESTRICT
      ON DELETE RESTRICT
);

INSERT INTO suppliers (supplier_name, group_id)
VALUES
  ('XYZ Corp.', 1);

DELETE FROM supplier_groups
WHERE group_id = 1;

DELETE FROM suppliers
WHERE group_id = 1;

DELETE FROM supplier_groups
WHERE group_id = 1;

INSERT INTO supplier_groups (group_name)
VALUES 
  ('Domesic'),
  ('Global'),
  ('One-Time');

DROP TABLE suppliers;

CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name TEXT NOT NULL,
  group_id INTEGER,
  FOREIGN KEY (group_id)
    REFERENCES supplier_groups (group_id)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

INSERT INTO suppliers (supplier_name, group_id)
VALUES ('XYZ Corp.', 3);

INSERT INTO suppliers (supplier_name, group_id)
VALUES ('ABC Corp.', 2);

UPDATE supplier_groups
SET group_id = 100
WHERE group_name = 'Domesic';

DELETE FROM supplier_groups
WHERE group_id = 2;