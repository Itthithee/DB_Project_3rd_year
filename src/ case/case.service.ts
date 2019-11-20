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
        console.log(res);

        let id: string = "0000001"
        if (res[0] !== undefined) {
            let e = res[0].CaseID
            id = (parseInt(e, 10) + 1).toString()
            while (id.length < 7) {
                id = "0" + id
            }
        }
        console.log(id);

        let val = [id, date, desc, diag, patId]
        let query1 = createSQL.insertValColTable(val, col, "CASE")

        let result1 = await conn.query(query1);
        let query2 = createSQL.insertValColTable([id, docId], ["CaseID", "DoctorID"], "DOCTOR_OWN_CASE")
        let result2 = await conn.query(query2)
        if (result2.name = "error") {
            this.deleteCase(id)
        }
        return [result1, result2]
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
        let query: string = createSQL.deleteByIdColTable([id], ["CaseID"], "CASE")
        let result = await conn.query(query);
        return result
    }
    async getAll() {
        let query: string = createSQL.findAll("CASE")
        let result = await conn.query(query);
        console.log(result)
        return result;
    }
    async insertNurseTCOCase(id, nurseId) {
        let query = createSQL.insertValColTable([id, nurseId], ["CaseID", "NurseID"], "NURSE_TCO_CASE")
        let result = await conn.query(query)
        return result
    }
    async insertInternTROCase(id, internId) {
        let query = createSQL.insertValColTable([id, internId], ["CaseID", "InternID"], "INTERN_TRO_CASE")
        let result = await conn.query(query)
        return result
    }
    async insertDoctorOwnCase(id, docId) {
        let query = createSQL.insertValColTable([id, docId], ["CaseID", "DoctorID"], "DOCTOR_OWN_CASE")
        let result = await conn.query(query)
        return result
    }
    async deleteNurseTCOCase(id, nurseId) {
        let query = createSQL.deleteByIdColTable([id, nurseId], ["CaseID", "NurseID"], "NURSE_TCO_CASE")
        let result = await conn.query(query)
        return result
    }
    async deleteInternTROCase(id, internId) {
        let query = createSQL.deleteByIdColTable([id, internId], ["CaseID", "InternID"], "INTERN_TRO_CASE")
        let result = await conn.query(query)
        return result
    }
    async deleteDoctorOwnCase(id, docId) {
        let query = createSQL.deleteByIdColTable([id, docId], ["CaseID", "DoctorID"], "DOCTOR_OWN_CASE")
        let result = await conn.query(query)
        return result
    }
}