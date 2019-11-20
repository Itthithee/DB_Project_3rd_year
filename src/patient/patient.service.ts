import { Injectable, Query } from '@nestjs/common';
import { conn } from 'src/DB/connection'
import { createSQL } from "src/DB/createQuery";
@Injectable()
export class PatientService {

    async insertPatient(
        fname: string,
        lname: string,
        birthDate: string,
        gender: string,
        addr: string,
        tel: string,
        couTel: string,
    ) {
        let col = ["PatientID", "Fname", "Lname", "BirthDate",
            "Gender", "Address", "Tel", "CousinTel"]
        let res = await conn.query("SELECT * FROM \"PATIENT\" ORDER BY \"PatientID\" DESC LIMIT 1")
        let id: string = "0000001"
        if (res[0] !== undefined) {
            let e = res[0].PatientID
            id = (parseInt(e, 10) + 1).toString()
            while (id.length < 7) {
                id = "0" + id
            }
        }
        let value = [
            id,
            fname,
            lname,
            birthDate,
            gender,
            addr,
            tel,
            couTel,

        ]
        /*let err : any[] = emp.checkConstraint();
        if(err[0]){
            return err.toString()
        }*/
        let query: string = createSQL.insertValColTable(value, col, "PATIENT")



        try {
            let result = await conn.query(query);
            return [result]
        } catch (err) {
            return err.toString
        }

    }
    async getAll() {
        let query: string = createSQL.findAll("PATIENT")
        let result = await conn.query(query);
        console.log(result)
        return result;
    }
    async deletePatient(id) {
        let query: string = createSQL.deleteByIdColTable([id], ["PatientID"], "PATIENT")
        let result = await conn.query(query);
        return result
    }
    async findByName(fname, lname) {
        let query: string = createSQL.findByValColTable([fname, lname], ["Fname", "Lname"], "PATIENT")
        let result = await conn.query(query);
        if (result.length == 0) return "not found"
        return result;
    }
    async findById(id) {
        let query: string = createSQL.findByValColTable([id], ["PatientID"], "PATIENT")
        let result = await conn.query(query);
        if (result.length == 0) return "not found"
        return result;
    }
    async updatePatient(
        id: string,
        fname: string,
        lname: string,
        birthDate: string,
        gender: string,
        addr: string,
        tel: string,
        couTel: string,
    ) {
        let col = ["Fname", "Lname", "BirthDate",
            "Gender", "Address", "Tel", "CousinTel"]
        let val = [
            id,
            fname,
            lname,
            birthDate,
            gender,
            addr,
            tel,
            couTel,
        ]
        let query: string = createSQL.updateByIdValColTable(id, "PatientID", val, col, "PATIENT")
        let result = await conn.query(query);
        return result
    }
}

