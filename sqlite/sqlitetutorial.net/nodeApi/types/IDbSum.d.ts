import { Database } from "sqlite3";

interface IDbSum {
  (a: number, b:number, db: Database): void
}