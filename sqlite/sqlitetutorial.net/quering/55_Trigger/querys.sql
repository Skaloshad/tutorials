-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE leads (
  id INTEGER PRIMARY KEY,
  firstName TEXT NOT NULL,
  lastName TEXT NOT NULL,
  phone TEXT NOT NULL,
  email TEXT NOT NULL,
  source TEXT NOT NULL
);

CREATE TRIGGER validate_email_before_insert_leads
  BEFORE INSERT ON leads
BEGIN
  SELECT
    CASE
      WHEN NEW.email NOT LIKE '%_@__%.__%' THEN
        RAISE ( ABORT, 'Invalid email address' )
      END;
END;

INSERT INTO leads ( firstName, lastName, email, phone )
VALUES ('John', 'Doe', 'jjj', '4089009334');

INSERT INTO leads ( firstName, lastName, email, phone, source )
VALUES ('John', 'Doe', 'john.doe@sqlitetutorial.net', '4089009334', 'insert');

CREATE TABLE leads_logs (
  id INTEGER PRIMARY KEY,
  oldId INT,
  newId INT,
  oldPhone TEXT,
  newPhone TEXT,
  oldEmail TEXT,
  newEmail TEXT,
  userAction TEXT,
  createdAt TEXT
);

CREATE TRIGGER log_contact_after_update
  AFTER UPDATE ON leads
  WHEN OLD.phone <> NEW.phone
    OR OLD.email <> NEW.email
BEGIN
  INSERT INTO leads_logs (
    oldId,
    newId,
    oldPhone,
    newPhone,
    oldEmail,
    newEmail,
    userAction,
    createdAt
  )
  VALUES (
    OLD.id,
    NEW.id,
    OLD.phone,
    NEW.phone,
    OLD.email,
    NEW.email,
    'UPDATE',
    DATETIME('NOW')
  );
END;

UPDATE leads
SET
  lastName = 'Smith'
WHERE
  id = 1;

UPDATE leads
SET
  phone = '4089998888',
  email = 'john.smith@sqlitetutorial.net'
WHERE
  id = 1;

CREATE TRIGGER log_contact_after_delete
  AFTER DELETE ON leads
BEGIN
  INSERT INTO leads_logs (
    oldId,
    oldPhone,
    oldEmail,
    userAction,
    createdAt
  )
  VALUES (
    OLD.id,
    OLD.phone,
    OLD.email,
    'DELETE',
    DATETIME('NOW')
  );
END;

CREATE TRIGGER log_contact_after_insert
  AFTER INSERT ON leads
BEGIN
  INSERT INTO leads_logs (
    newId,
    newPhone,
    newEmail,
    userAction,
    createdAt
  )
  VALUES (
    NEW.id,
    NEW.phone,
    NEW.email,
    'INSERT',
    DATETIME('NOW')
  );
END;

DROP TRIGGER validate_email_before_insert_leads;