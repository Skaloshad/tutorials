-- database: g:\documents\Own\tutorials\sqlite\sqlitetutorial.net\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT 1 + 1;

SELECT
    10 / 5,
    2 * 4;

SELECT
    trackid,
    name,
    composer,
    unitprice
FROM
    tracks;

SELECT
    trackid,
    name,
    albumid,
    mediatypeid,
    genreid,
    composer,
    milliseconds,
    bytes,
    unitprice
FROM
    tracks;

SELECT * FROM tracks;