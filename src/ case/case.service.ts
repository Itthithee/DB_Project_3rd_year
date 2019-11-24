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
        let id: string = "0000000001"
        if (res[0] !== undefined) {
            let e = res[0].CaseID
            id = (parseInt(e, 10) + 1).toString()
            while (id.length < 10) {
                id = "0" + id
            }
        }
        let val = [id, date, desc, diag, patId]
        let query1 = createSQL.insertValColTable(val, col, "CASE")

        let result1 = await conn.query(query1);
        let query2 = createSQL.insertValColTable([id, docId], ["CaseID", "DoctorID"], "DOCTOR_OWN_CASE")
        let result2 = await conn.query(query2)

        if (result2.name == "error") {
            this.deleteCase(id)
            return result2
        }
        
        return result2
    }
    async findById(id) {
        let query: string = "select * from \"CASE\" NATURAL LEFT OUTER JOIN \"PATIENT\" where \"CaseID\" = \'" + id + "\'"
        let query2: string = "select * from \"DOCTOR_OWN_CASE\""
        let result = await conn.query(query);
        let result2 = await conn.query(query2);
        if (result.name == "error" || result2.name == "error") {
            return [result, result2]
        }


        result.forEach(obj => {
            obj.DoctorID = []
            result2.forEach(i => {
                if (obj.CaseID == i.CaseID) {
                    obj.DoctorID.push(i.DoctorID); //how to fix o(n^2)
                }
            });
        });
        return result;
    }
    async findByPatId(patId) {
        let query: string = "select * from \"CASE\" NATURAL LEFT OUTER JOIN \"PATIENT\" where \"PatientID\" = \'" + patId + "\'"
        let query2: string = "select * from \"DOCTOR_OWN_CASE\""
        let result = await conn.query(query);
        let result2 = await conn.query(query2);
        if (result.name == "error" || result2.name == "error") {
            return [result, result2]
        }


        result.forEach(obj => {
            obj.DoctorID = []
            result2.forEach(i => {
                if (obj.CaseID == i.CaseID) {
                    obj.DoctorID.push(i.DoctorID); //how to fix o(n^2)
                }
            });
        });
        return result;
    }
    async updateCase(
        id: string,
        date: string,
        desc: string,
        diag: string,
        patId: string,
    ) {
        let col = ["Date", "Description", "Diagnosis", "PatientID"]

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
        let query: string = "select * from \"CASE\" NATURAL LEFT OUTER JOIN \"PATIENT\" "
        let query2: string = "select * from \"DOCTOR_OWN_CASE\""
        let result = await conn.query(query);
        let result2 = await conn.query(query2);
        if (result.name == "error" || result2.name == "error") {
            return [result, result2]
        }


        result.forEach(obj => {
            obj.DoctorID = []
            result2.forEach(i => {
                if (obj.CaseID == i.CaseID) {
                    obj.DoctorID.push(i.DoctorID); //how to fix o(n^2)
                }
            });
        });
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
    async findDoctorOwnCase(id) {
        let query = createSQL.findByValColTable([id], ["CaseID"], "DOCTOR_OWN_CASE")
        let result = await conn.query(query)
        return result
    }
    async findNurseOwnCase(id) {
        let query = createSQL.findByValColTable([id], ["CaseID"], "NURSE_TCO_CASE")
        let result = await conn.query(query)
        return result
    }
    async findInternOwnCase(id) {
        let query = createSQL.findByValColTable([id], ["CaseID"], "INTERN_TRO_CASE")
        let result = await conn.query(query)
        return result
    }
}