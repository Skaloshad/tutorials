-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE contacts (
  firstName TEXT NOT NULL,
  lastName TEXT NOT NULL,
  email TEXT NOT NULL
);

CREATE UNIQUE INDEX idx_contacts_email
ON contacts (email);

INSERT INTO contacts (firstName, lastName, email)
VALUES('John','Doe','john.doe@sqlitetutorial.net');

INSERT INTO contacts (firstName, lastName, email)
VALUES('Johny','Doe','john.doe@sqlitetutorial.net');

INSERT INTO contacts (firstName, lastName, email)
VALUES('David','Brown','david.brown@sqlitetutorial.net'),
      ('Lisa','Smith','lisa.smith@sqlitetutorial.net');