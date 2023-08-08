import { IMethod } from "../types/IMethod"

const go: IMethod = (db) => {

  const sql = ` SELECT FirstName firstName, 
                       LastName lastName, 
                       Email email 
                FROM customers 
                WHERE Country = ? 
                ORDER BY FirstName`

  const country = 'USA'

  //each() выполняется для каждой строки резалтсэта
  db.each(sql, [country], (err, row: any) => {
    if (err) throw err
    console.log(`${row.firstName} ${row.lastName} - ${row.email}`)
  })
}

export default go