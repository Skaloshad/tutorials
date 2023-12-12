-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT IIF(1 < 2, 'Yes', 'No') result;

SELECT
  name,
  milliseconds,
  IIF(milliseconds <= 300000, 'Short',
    IIF(milliseconds > 300000 AND milliseconds <= 600000, 'Medium',
      IIf(milliseconds > 600000, 'Long', 'N/A')
    )
  )
FROM
  tracks;