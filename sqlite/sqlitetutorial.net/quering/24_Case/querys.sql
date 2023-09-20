-- database: ..\..\chinook.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT 
  customerId,
  firstName,
  lastName,
  CASE country
    WHEN 'USA' THEN 'Domestic'
    ELSE 'Foreign'
  END customerGroup
FROM
  customers
ORDER BY
  lastName,
  firstName;

SELECT
  trackId,
  name,
  CASE 
    WHEN milliseconds < 60000 THEN 'short'
    WHEN milliseconds > 60000 AND milliseconds < 300000 THEN 'medium'
    ELSE 'long'
  END category
FROM
  tracks;