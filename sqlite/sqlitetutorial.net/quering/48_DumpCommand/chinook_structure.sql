CREATE TABLE IF NOT EXISTS "albums"
(
    [AlbumId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Title] NVARCHAR(160)  NOT NULL,
    [ArtistId] INTEGER  NOT NULL,
    FOREIGN KEY ([ArtistId]) REFERENCES "artists" ([ArtistId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "artists"
(
    [ArtistId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
CREATE TABLE IF NOT EXISTS "customers"
(
    [CustomerId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [FirstName] NVARCHAR(40)  NOT NULL,
    [LastName] NVARCHAR(20)  NOT NULL,
    [Company] NVARCHAR(80),
    [Address] NVARCHAR(70),
    [City] NVARCHAR(40),
    [State] NVARCHAR(40),
    [Country] NVARCHAR(40),
    [PostalCode] NVARCHAR(10),
    [Phone] NVARCHAR(24),
    [Fax] NVARCHAR(24),
    [Email] NVARCHAR(60)  NOT NULL,
    [SupportRepId] INTEGER,
    FOREIGN KEY ([SupportRepId]) REFERENCES "employees" ([EmployeeId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS "employees"
(
    [EmployeeId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [LastName] NVARCHAR(20)  NOT NULL,
    [FirstName] NVARCHAR(20)  NOT NULL,
    [Title] NVARCHAR(30),
    [ReportsTo] INTEGER,
    [BirthDate] DATETIME,
    [HireDate] DATETIME,
    [Address] NVARCHAR(70),
    [City] NVARCHAR(40),
    [State] NVARCHAR(40),
    [Country] NVARCHAR(40),
    [PostalCode] NVARCHAR(10),
    [Phone] NVARCHAR(24),
    [Fax] NVARCHAR(24),
    [Email] NVARCHAR(60),
    FOREIGN KEY ([ReportsTo]) REFERENCES "employees" ([EmployeeId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS "genres"
(
    [GenreId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
CREATE TABLE IF NOT EXISTS "invoices"
(
    [InvoiceId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [CustomerId] INTEGER  NOT NULL,
    [InvoiceDate] DATETIME  NOT NULL,
    [BillingAddress] NVARCHAR(70),
    [BillingCity] NVARCHAR(40),
    [BillingState] NVARCHAR(40),
    [BillingCountry] NVARCHAR(40),
    [BillingPostalCode] NVARCHAR(10),
    [Total] NUMERIC(10,2)  NOT NULL,
    FOREIGN KEY ([CustomerId]) REFERENCES "customers" ([CustomerId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS "invoice_items"
(
    [InvoiceLineId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [InvoiceId] INTEGER  NOT NULL,
    [TrackId] INTEGER  NOT NULL,
    [UnitPrice] NUMERIC(10,2)  NOT NULL,
    [Quantity] INTEGER  NOT NULL,
    FOREIGN KEY ([InvoiceId]) REFERENCES "invoices" ([InvoiceId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([TrackId]) REFERENCES "tracks" ([TrackId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS "media_types"
(
    [MediaTypeId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
CREATE TABLE IF NOT EXISTS "playlists"
(
    [PlaylistId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
CREATE TABLE IF NOT EXISTS "playlist_track"
(
    [PlaylistId] INTEGER  NOT NULL,
    [TrackId] INTEGER  NOT NULL,
    CONSTRAINT [PK_PlaylistTrack] PRIMARY KEY  ([PlaylistId], [TrackId]),
    FOREIGN KEY ([PlaylistId]) REFERENCES "playlists" ([PlaylistId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([TrackId]) REFERENCES "tracks" ([TrackId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS "tracks"
(
    [TrackId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(200)  NOT NULL,
    [AlbumId] INTEGER,
    [MediaTypeId] INTEGER  NOT NULL,
    [GenreId] INTEGER,
    [Composer] NVARCHAR(220),
    [Milliseconds] INTEGER  NOT NULL,
    [Bytes] INTEGER,
    [UnitPrice] NUMERIC(10,2)  NOT NULL,
    FOREIGN KEY ([AlbumId]) REFERENCES "albums" ([AlbumId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([GenreId]) REFERENCES "genres" ([GenreId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([MediaTypeId]) REFERENCES "media_types" ([MediaTypeId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_AlbumArtistId] ON "albums" ([ArtistId]);
CREATE INDEX [IFK_CustomerSupportRepId] ON "customers" ([SupportRepId]);
CREATE INDEX [IFK_EmployeeReportsTo] ON "employees" ([ReportsTo]);
CREATE INDEX [IFK_InvoiceCustomerId] ON "invoices" ([CustomerId]);
CREATE INDEX [IFK_InvoiceLineInvoiceId] ON "invoice_items" ([InvoiceId]);
CREATE INDEX [IFK_InvoiceLineTrackId] ON "invoice_items" ([TrackId]);
CREATE INDEX [IFK_PlaylistTrackTrackId] ON "playlist_track" ([TrackId]);
CREATE INDEX [IFK_TrackAlbumId] ON "tracks" ([AlbumId]);
CREATE INDEX [IFK_TrackGenreId] ON "tracks" ([GenreId]);
CREATE INDEX [IFK_TrackMediaTypeId] ON "tracks" ([MediaTypeId]);
CREATE TABLE sqlite_stat1(tbl,idx,stat);
CREATE TABLE t(
  c TEXT
);
CREATE TABLE calendars(
    y int NOT NULL,
    m int NOT NULL
);
CREATE TABLE ranks (
  rank TEXT NOT NULL
);
CREATE TABLE suits (
  suit TEXT NOT NULL
);
CREATE TABLE cats (
  type  TEXT,
  color TEXT
);
CREATE TABLE IF NOT EXISTS "dogs" (
  type  TEXT,
  color TEXT
);
CREATE TABLE t1 (
  v1 INT
);
CREATE TABLE t2 (
  v2 INT
);
CREATE TABLE artists_backup (
  artistId INTEGER PRIMARY KEY AUTOINCREMENT,
  name NVARCHAR
);
CREATE TABLE positions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  min_salary NUMERIC
);
CREATE UNIQUE INDEX idx_positions_title
ON positions (title);
CREATE TABLE accounts (
  account_no INTEGER NOT NULL,
  balance DECIMAL NOT NULL DEFAULT 0,
  PRIMARY KEY (account_no),
  CHECK (balance >= 0)
);
CREATE TABLE IF NOT EXISTS "account_changes" (
  change_no INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  account_no INTEGER NOT NULL,
  flag TEXT NOT NULL,
  amount DECIMAL NOT NULL,
  changed_at TEXT NOT NULL
);
CREATE VIRTUAL TABLE posts
USING FTS5 (title, body)
/* posts(title,body) */;
CREATE TABLE IF NOT EXISTS 'posts_data'(id INTEGER PRIMARY KEY, block BLOB);
CREATE TABLE IF NOT EXISTS 'posts_idx'(segid, term, pgno, PRIMARY KEY(segid, term)) WITHOUT ROWID;
CREATE TABLE IF NOT EXISTS 'posts_content'(id INTEGER PRIMARY KEY, c0, c1);
CREATE TABLE IF NOT EXISTS 'posts_docsize'(id INTEGER PRIMARY KEY, sz BLOB);
CREATE TABLE IF NOT EXISTS 'posts_config'(k PRIMARY KEY, v) WITHOUT ROWID;
CREATE TABLE datetime_text (
  d1 TEXT,
  d2 TEXT
);
CREATE TABLE datetime_real (
    d1 real
);
CREATE TABLE datetime_int (d1 int);
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
CREATE TABLE groups (
   group_id INTEGER PRIMARY KEY,
   name TEXT NOT NULL
);
CREATE TABLE countries (
  country_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE languages (
  language_id INTEGER,
  name TEXT NOT NULL,
  PRIMARY KEY (language_id)
);
CREATE TABLE country_languages (
  country_id INTEGER NOT NULL,
  language_id INTEGER NOT NULL,
  PRIMARY KEY (country_id, language_id),
  FOREIGN KEY (country_id) REFERENCES countries (country_id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (language_id) REFERENCES languages (language_id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);
CREATE TABLE cities (
  id INTEGER NOT NULL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE supplier_groups (
  group_id INTEGER PRIMARY KEY,
  group_name TEXT NOT NULL
);
CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name TEXT NOT NULL,
  group_id INTEGER,
  FOREIGN KEY (group_id)
    REFERENCES supplier_groups (group_id)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);
CREATE TABLE shapes (
  shape_id INTEGER PRIMARY KEY,
  background_color TEXT,
  foreground_color TEXT,
  UNIQUE (background_color, foreground_color)
);
CREATE TABLE lists (
  list_id INTEGER PRIMARY KEY,
  email TEXT UNIQUE
);
CREATE TABLE contacts (
  contact_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT,
  phone TEXT NOT NULL CHECK (length(phone) >= 10)
);
CREATE TABLE IF NOT EXISTS "equipment" (
  name TEXT NOT NULL,
  model TEXT NOT NULL,
  serial INTEGER NOT NULL UNIQUE
, location TEXT);
CREATE TABLE favorites (
  userId INTEGER,
  playlistId INTEGER,
  FOREIGN KEY (userId)
    REFERENCES users(userId),
  FOREIGN KEY (playlistId)
    REFERENCES playlists(playlistId)
);
CREATE TABLE IF NOT EXISTS "users" (
  userId INTEGER PRIMARY KEY,
  firstName TEXT NOT NULL,
  lastName TEXT NOT NULL,
  email TEXT NOT NULL
);
CREATE TABLE locations (
  locationId INTEGER PRIMARY KEY,
  street TEXT NOT NULL,
  city TEXT NOT NULL,
  state TEXT NOT NULL,
  country TEXT NOT NULL
);
CREATE TABLE people (
  personId INTEGER PRIMARY KEY,
  firstName TEXT,
  lastName TEXT,
  addressId INTEGER,
  FOREIGN KEY (addressId)
    REFERENCES addresses (addressId)
);
CREATE TABLE products (
  name TEXT NOT NULL,
  price REAL NOT NULL,
  discount REAL NOT NULL,
  tax REAL NOT NULL,
  net_price REAL GENERATED ALWAYS
    AS (price * (1 - discount) * (1 + tax))
);
