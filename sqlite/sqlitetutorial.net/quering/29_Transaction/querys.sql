-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE accounts (
  account_no INTEGER NOT NULL,
  balance DECIMAL NOT NULL DEFAULT 0,
  PRIMARY KEY (account_no),
  CHECK (balance >= 0)
);

CREATE TABLE account_changes (
  change_no INT NOT NULL PRIMARY KEY,
  account_no INTEGER NOT NULL,
  flag TEXT NOT NULL,
  amount DECIMAL NOT NULL,
  changed_at TEXT NOT NULL
);

INSERT INTO accounts (account_no, balance)
VALUES (100, 20100);

INSERT INTO accounts (account_no, balance)
VALUES (200, 10100);

SELECT * FROM accounts;

BEGIN TRANSACTION;

UPDATE accounts
   SET balance = balance - 1000
 WHERE account_no = 100;

UPDATE accounts
SET balance = balance + 1000
WHERE account_no = 200;

INSERT INTO account_changes (account_no, flag, amount, changed_at)
VALUES (100, '-', 1000, DATETIME('NOW'));

INSERT INTO account_changes (account_no, flag, amount, changed_at)
VALUES (200, '+', 1000, DATETIME('NOW'));

COMMIT;

SELECT * FROM account_changes;

BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 20000
WHERE account_no = 100;

INSERT INTO account_changes (account_no, flag, amount, changed_at)
VALUES (100, '-', 20000, DATETIME('NOW'));

COMMIT;

