import { IMethod } from "../types/IMethod"

const go: IMethod = (db) => {

  const sql = ` SELECT DISTINCT Name name 
                FROM playlists 
                ORDER BY name`

  //all() берет все строки сразу
  db.all(sql, [], (err, rows: any) => {
    if (err) throw err
    rows.forEach((row: any) => {
      console.log(row.name)
    })
  })
} 

export default go