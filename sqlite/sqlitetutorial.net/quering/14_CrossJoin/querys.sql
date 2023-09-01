-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

CREATE TABLE ranks (
  rank TEXT NOT NULL
);

CREATE TABLE suits (
  suit TEXT NOT NULL
);

INSERT INTO ranks(rank)
VALUES ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8'), ('9'), ('10'), ('J'), ('Q'), ('K'), ('A');

INSERT INTO suits(suit)
VALUES ('Clubs'), ('Diamonds'), ('Hearts'), ('Spades');

SELECT 
  rank,
  suit
FROM
  ranks
CROSS JOIN
  suits
ORDER BY
  suit;