# Ссылки ##############################

[sqlitetutorial][sqlitetutorial]  

[sqlitetutorial]: https://www.sqlitetutorial.net

# Connecting ##########################

~~~ JavaScript ~~~~~~~~~~~~~~~~~~~~~~~~
const db = new sqlite3.Database(':memory:') // auto
const db = new sqlite3.Database(':memory:', (err) => { //allow callback
  if (err) return console.error(err.message)
  console.log('Connected to the in-memory SQlite database.');
});
db.close() // auto
db.close((err) => { //allow callback
  if (err) return console.error(err.message)
  console.log('Close the database connection.')
});
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~