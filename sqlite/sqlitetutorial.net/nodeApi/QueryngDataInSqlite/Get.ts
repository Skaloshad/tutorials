import { IMethod } from "../types/IMethod";

const go: IMethod = (db) => {

  const sql = ` SELECT PlaylistId id, 
                       Name name 
                FROM playlists 
                WHERE PlaylistId = ?`

  const playlistId = 1

  //get() возвращает первую строку
  db.get(sql, [playlistId], (err, row: any) => {
    if (err) throw err
    if (row) console.log(row.id, row.name)
    else console.log(`No playlist found with the if ${playlistId}`)
  })
}

export default go