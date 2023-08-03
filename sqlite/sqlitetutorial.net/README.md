# Ссылки ##############################

[sqlitetutorial][sqlitetutorial]  
[api][sqlite api]

[sqlitetutorial]: https://www.sqlitetutorial.net
[sqlite api]: [https://github.com/TryGhost/node-sqlite3/wiki/API]

# Connecting ##########################

~~~ JavaScript ~~~~~~~~~~~~~~~~~~~~~~~~
const db = new sqlite3.Database(':memory:') // auto
const db = new sqlite3.Database('./db/chinook.db') // file db
const db = new sqlite3.Database('./db/chinook.db', sqlite3.OPEN_READWRITE)

const db = new sqlite3.Database(':memory:', (err) => { //allow callback
  if (err) return console.error(err.message)
  console.log('Connected to the in-memory SQlite database.')
});

db.close() // auto
db.close((err) => { //allow callback
  if (err) return console.error(err.message)
  console.log('Close the database connection.')
});
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

|||
|-|-|
|`OPEN_READONLY`| open the database for read-only|  
|`OPEN_READWRITE`| open the database for reading and writting|  
|`OPEN_CREATE`| open the database, if the database does not exist, create a new database|
|`OPEN_READWRITE` \| `OPEN_CREATE`| defautl mode

# Quering ##############################

`run(sql [, param, ...] [, callback])`  

> you must use an old-school `function () { ... }` style callback rather than a lambda function, otherwise `this.lastID` and `this.changes` will be undefined  

`get(sql [, param, ...] [, callback])`  
`all(sql [, param, ...] [, callback])`  
`each(sql [, param, ...] [, callback] [, complete])`  
`exec(sql [, callback])`
