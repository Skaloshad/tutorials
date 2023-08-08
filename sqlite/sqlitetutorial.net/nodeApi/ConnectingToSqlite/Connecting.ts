import sqlite3 from "sqlite3";
sqlite3.verbose()

console.log("Connecting to sqlite db using node.js")

let inMemory = new sqlite3.Database(':memory:', (err) => {
  if (err) return console.error(err?.message)
  console.log('Connected to in-memory')
})

const closeInMemory = () => {
  inMemory.close((err) => {
    if (err) return console.error(err?.message)
    console.log('Close the in-memory connection')
  })
}

let chinook = new sqlite3.Database('../chinook.db', sqlite3.OPEN_READWRITE, (err) => {
  if (err) {
    return console.error(err)
  }
  console.log('Connected to the chinook database')
})

const getTestData = () => {
  chinook.serialize(() => {
    chinook.each(`SELECT PlaylistId as id, Name as name FROM playlists`, (err, row: any) => {
      if (err) console.error(err.message)
      console.log(row.id + "\t" + row.name)
    })
  })
}

const closeChinook = () => {
  chinook.close((err) => {
    if (err) console.error(err.message)
    console.log('Close the chinook database')
  })
}

const go = () => {
  closeInMemory()
  getTestData()
  closeChinook()
}

export default {
  go,
  inMemory,
  closeInMemory,
  chinook,
  getTestData,
  closeChinook
}