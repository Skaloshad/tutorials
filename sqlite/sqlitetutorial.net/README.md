# Ссылки ##############################

[sqlitetutorial][sqlitetutorial]  
[sqlite api][api]

[sqlitetutorial]: https://www.sqlitetutorial.net
[api]: https://github.com/TryGhost/node-sqlite3/wiki/API

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

| mode | description |
|------|-------------|
|`OPEN_READONLY` | open the database for read-only            |  
|`OPEN_READWRITE`| open the database for reading and writting |  
|`OPEN_CREATE`   | open the database, if the database does not exist, create a new database |
|`OPEN_READWRITE` \| `OPEN_CREATE`| defautl mode|

# Quering ##############################

`run(sql [, param, ...] [, callback])` Выполняет инсерт или апдейт

> Нужно использовать старый стиль функции обратного вызова `function () { ... }` вместо лямбда выражений function, иначе `this.lastID` и `this.changes` будут иметь значение `undefined`  

`get(sql [, param, ...] [, callback])` Получает одну строку  
`all(sql [, param, ...] [, callback])` Получает все строки  
`each(sql [, param, ...] [, callback] [, complete])` Получает все строки по одной  
`exec(sql [, callback])` Выполняет запрос без параметров
