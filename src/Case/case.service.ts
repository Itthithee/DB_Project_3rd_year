import { Injectable } from '@nestjs/common';
import { conn } from 'src/DB/connection'
import { createSQL } from "src/DB/createQuery";
@Injectable()
export class CaseService {
    async insertCase(
        date: string,
        desc: string,
        diag: string,
        patId: string,
        docId: string
    ) {
        let col = ["CaseID", "Date", "Description", "Diagnosis", "PatientID"]
        let res = await conn.query("SELECT * FROM \"CASE\" ORDER BY \"CaseID\" DESC LIMIT 1")
        let id: string = "0000001"
        if (res[0] !== undefined) {
            let e = res[0].PatientID
            id = (parseInt(e, 10) + 1).toString()
            while (id.length < 7) {
                id = "0" + id
            }
        }
        let val = [id, date, desc, diag, patId]
        let query1 = createSQL.insertValColTable(val, col, "CASE")
        let query2 = createSQL.insertValColTable([id,docId], ["CaseID","DoctorID"], "DOCTOR_OWN_CASE")
        try {
            let result1 = await conn.query(query1);
            let result2= await conn.query(query2);
            return [result1,result2]
        } catch (err) {
            return err.toString
        }
    }
    async findById(id) {
        let query: string = createSQL.findByValColTable([id], ["CaseID"], "CASE")
        let result = await conn.query(query);
        if (result.length == 0) return "not found"
        return result;
    }
    async findByPatId(patId) {
        let query: string = createSQL.findByValColTable([patId], ["PatientID"], "CASE")
        console.log(query);
        
        let result = await conn.query(query);
        if (result.length == 0) return "not found"
        return result;
    }
    async updateCase(
        id: string,
        date: string,
        desc: string,
        diag: string,
        patId: string,
    ) {
        let col = ["Fname", "Lname", "BirthDate",
            "Gender", "Address",
            "Tel", "CousinTel"]

        let val = [date, desc, diag, patId]
        let query: string = createSQL.updateByIdValColTable(id, "CaseID", val, col, "CASE")
        let result = await conn.query(query);
        return result
    }
    async deleteCase(id) {
        let query: string = createSQL.deleteByIdColTable(id, "CaseID", "CASE")
        let result = await conn.query(query);
        return result
    }
    async getAll() {
        let query: string = createSQL.findAll("CASE")
        let result = await conn.query(query);
        console.log(result)
        return result;
    }
}