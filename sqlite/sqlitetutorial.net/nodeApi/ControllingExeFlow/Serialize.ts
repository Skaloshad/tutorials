import { IMethod } from "../types/IMethod";

const go: IMethod = (db) => {
  db.serialize(() => {
    db.run('CREATE TABLE greetings(message text)')
      .run(`INSERT INTO greetings(message)
            VALUES('Hi'),
                  ('Hello'),
                  ('Welcome')`)
      .each(`SELECT message FROM greetings`, (err, row: any) => {
        if (err) throw err
        console.log(row.message)
      })
  })
}

export default go