import { IMethod } from "../types/IMethod"

const createLangs: IMethod = (db) => {
    db.run('CREATE TABLE langs(name text)')
}

const go: IMethod = (db) => {
    db.run(`INSERT INTO langs(name) VALUES(?)`, ['C'], function(err) {
        if (err) return console.log(err.message)
        console.log(`A row has been inderted with rowid`, this)
    })

    
}

export default {
    createLangs,
    go
}