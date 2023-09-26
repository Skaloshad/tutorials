-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE VIRTUAL TABLE posts
USING FTS5 (title, body);

INSERT INTO posts (title, body)
VALUES ('Learn SQLite FTS5', 'This tutorial teaches you how to perform full-text search in SQLite using FTS5'),
('Advanced SQLite Full-text Search', 'Show you some advanced techniques in SQLite full-text searching'),
('SQLite Tutorial', 'Help you learn SQLite quickly and effectively');

SELECT *
FROM posts
WHERE posts MATCH 'fts5';

SELECT *
FROM posts
WHERE posts = 'fts5';

SELECT *
FROM posts('fts5');

SELECT *
FROM posts
WHERE posts MATCH 'text'
ORDER BY rank;

SELECT *
FROM posts
WHERE posts MATCH 'learn SQLite';

SELECT *
FROM posts
WHERE posts = 'search*';

SELECT *
FROM posts
WHERE posts MATCH 'learn NOT text';

SELECT *
FROM posts
WHERE posts MATCH 'learn OR text';

SELECT *
FROM posts
WHERE posts MATCH 'sqlite AND searching';

SELECT *
FROM posts
WHERE posts MATCH 'search AND sqlite OR help';

SELECT *
FROM posts
WHERE posts MATCH 'search AND (sqlite OR help)';

SELECT 
  highlight(posts, 0, '<b>', '</b>') title,
  highlight(posts, 1, '<b>', '</b>') body
FROM posts
WHERE posts MATCH 'SQLite'
ORDER BY rank;