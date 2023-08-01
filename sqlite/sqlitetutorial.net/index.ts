import conn from './ConnectingToSqlite/Connecting'
import All from './QueryngDataInSqlite/All'
import Get from './QueryngDataInSqlite/Get'
import Each from './QueryngDataInSqlite/Each'

import Serial from './ControllingExeFlow/Serialize'
import Parallel from './ControllingExeFlow/Parallel'

//conn.go()

const chinook = conn.chinook
const inMemory = conn.inMemory

All(chinook)
Get(chinook)
Each(chinook)

Serial(inMemory)
Parallel(inMemory)

//last captioin https://www.sqlitetutorial.net/sqlite-nodejs/statements-control-flow/

conn.closeChinook()
conn.closeInMemory()