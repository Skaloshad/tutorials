import conn from './ConnectingToSqlite/Connecting'
import All from './QueryngDataInSqlite/All'
import Get from './QueryngDataInSqlite/Get'
import Each from './QueryngDataInSqlite/Each'

//conn.go()

const chinook = conn.chinook

All(chinook)
Get(chinook)
Each(chinook)

//last captioin https://www.sqlitetutorial.net/sqlite-nodejs/statements-control-flow/

conn.closeChinook()