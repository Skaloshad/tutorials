import { Database } from "sqlite3";

interface IMethod {
  (db: Database): void
}