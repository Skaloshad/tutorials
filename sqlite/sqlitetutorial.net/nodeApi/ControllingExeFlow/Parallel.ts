import { IDbSum } from "../types/IDbSum";
import { IMethod } from "../types/IMethod";

const dbSum: IDbSum = (a, b, db) => {
  db.get('SELECT (? + ?) sum', [a, b], (err, row: any) => {
    if (err) throw err
    console.log(`The sum of ${a} and ${b} is ${row.sum}`)
  })
}

const go: IMethod = (db) => {
  db.parallelize(() => {
    dbSum(1, 1, db)
    dbSum(2, 2, db)
    dbSum(3, 3, db)
    dbSum(4, 4, db)
    dbSum(5, 5, db)
  })
}

export default go