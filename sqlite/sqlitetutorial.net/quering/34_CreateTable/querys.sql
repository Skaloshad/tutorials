-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE contacts (
  contact_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  phone TEXT NOT NULL UNIQUE
);

CREATE TABLE groups (
   group_id INTEGER PRIMARY KEY,
   name TEXT NOT NULL
);

CREATE TABLE contact_groups (
  contact_id INTEGER,
  group_id INTEGER,
  PRIMARY KEY (contact_id, group_id),
  FOREIGN KEY (contact_id)
    REFERENCES contacts (contact_id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION,
  FOREIGN KEY (group_id)
    REFERENCES groups (group_id)
      ON DELETE CASCADE
      ON UPDATE NO ACTION    
);