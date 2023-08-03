import { IMethod } from "../types/IMethod"

const createLangs: IMethod = (db) => {
    db.run('CREATE TABLE langs(name text)')
}

const  insOneRow: IMethod = (db) => {
    db.run(`INSERT INTO langs(name) VALUES(?)`, ['C'], function(err) {
        if (err) return console.log(err.message)
        console.log(`A row has been inderted with rowid`, this)
    })
}

const insMultipleRows: IMethod = (db) => {
    const languages = ['C++', 'Python', 'Java', 'C#', 'Go']
    const placeholders = languages.map(l => '(?)').join(',')
    const sql = `INSERT INTO langs(name) VALUES ${placeholders}`

    console.log(sql)
    db.run(sql, languages, function(err) {
        if (err) return console.error(err.message)
        console.log(`Rows inserted ${this.changes}`)
    })
}

export default {
    createLangs,
    insOneRow,
    insMultipleRows
}