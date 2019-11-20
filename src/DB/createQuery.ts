class CreateSQL {
    findAll(table: string): string {
        return "select * From \"" + table + "\""
    }
    insertValColTable(val: string[], col: string[], table: string) {
        if (col.length != val.length) throw "Number of Input is Invalid"
        let collumn = "(\"" + col.join("\",\"") + "\")"
        let value = "(\'" + val.join("\',\'") + "\')"
        return "insert into \"" + table + "\"" + collumn + " values " + value
    }
    updateByIdValColTable(id: string, idCol: string, val: string[], col: string[], table: string) {
        if (col.length != val.length) throw "Number of Input is Invalid"

        let collumn = "(\"" + col.join("\",\"") + "\")"
        let value = "(\'" + val.join("\',\'") + "\')"
        return "update \"" + table + "\" set " + collumn + " = " + value + " where \"" + idCol + "\" = \'" + id + "\'"
    }
    deleteByIdColTable(id: string[], col: string[], table: string) {
        if (col.length != id.length) throw "Number of Input is Invalid"
        let collumn = "(\"" + col.join("\",\"") + "\")"
        let value = "(\'" + id.join("\',\'") + "\')"
        return "delete From \"" + table + "\" where \"" + collumn + "\" = \'" + value + "\'"
    }
    findByValColTable(val: string[], col: string[], table: string) {
        if (col.length != val.length) throw "Number of Input is Invalid"
        let collumn = "(\"" + col.join("\",\"") + "\")"
        let value = "(\'" + val.join("\',\'") + "\')"
        return "select * from \"" + table + "\"where " + collumn + " = " + value
    }
}
let createSQL = new CreateSQL();
export { createSQL } 