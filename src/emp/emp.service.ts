import { Injectable } from '@nestjs/common';
import { conn } from 'src/DB/connection'
import { createSQL } from "src/DB/createQuery";
@Injectable()
export class EmployeeService {
    private jobList: string[] = ["Doctor", "Nurse", "Intern", "Pharmacist"]
    private doctor: string[] = ["EmpID", "Specialist", "LicenseID", "LicenseExp"]
    private employee: string[] = ["EmpID", "Fname", "Lname", "BirthDate",
        "Nationality", "Gender", "Address", "Ssn",
        "Tel", "JobType"]
    private nurse: string[] = ["EmpID", "Head", "LicenseID", "LicenseExp"]
    private intern: string[] = ["EmpID", "StartDate", "EndDate"]
    private pharma: string[] = ["EmpID", "LicenseID", "LicenseExp"]
    private other: string[] = ["EmpID", "JobName"]
    async insertEmployee(
        empFname: string,
        empLname: string,
        empBirthDate: string,
        empNationality: string,
        empGender: string,
        empAddr: string,
        empSsn: string,
        empTel: string,
        empJobType: string,
        licenseId: string,
        licenseExp: string,
        head: string,
        startDate: string,
        endDate: string,
        special: string
    ) {

        let res = await conn.query("SELECT * FROM \"EMPLOYEE\" ORDER BY \"EmpID\" DESC LIMIT 1")
        let empId: string = "0000001"
        if (res[0] !== undefined) {
            let e = res[0].EmpID
            empId = (parseInt(e, 10) + 1).toString()
            while (empId.length < 7) {
                empId = "0" + empId
            }
        }
        let value = [
            empId,
            empFname,
            empLname,
            empBirthDate,
            empNationality,
            empGender,
            empAddr,
            empSsn,
            empTel,
            empJobType
        ]
        /*let err : any[] = emp.checkConstraint();
        if(err[0]){
            return err.toString()
        }*/
        let query1: string = createSQL.insertValColTable(value, this.employee, "EMPLOYEE")
        let query2

        switch (empJobType) {
            case this.jobList[0]: ///doctor
                query2 = createSQL.insertValColTable([empId, special, licenseId, licenseExp]
                    , this.doctor, "DOCTOR")
                break;

            case this.jobList[1]: ///nurse
                query2 = createSQL.insertValColTable([empId, head, licenseId, licenseExp]
                    , this.nurse, "NURSE")
                break;
            case this.jobList[2]: ///intern
                query2 = createSQL.insertValColTable([empId, startDate, endDate]
                    , this.intern, "INTERN")
                break;
            case this.jobList[3]: ///pharmacist
                query2 = createSQL.insertValColTable([empId, licenseId, licenseExp]
                    , this.pharma, "PHARMACIST")
                break;
            default:
                query2 = createSQL.insertValColTable([empId, empJobType]
                    , this.other, "OTHER_EMPLOYEE")
                break;

        }

        let result1 = await conn.query(query1);
        let result2 = await conn.query(query2);
        if (result2.name == "error") {
            this.deleteEmployee(empId)
        }
        return [result1, result2]


    }
    async getEmployees() {
        let query: string = "select * from \"EMPLOYEE\" NATURAL LEFT OUTER JOIN \"DOCTOR\" NATURAL LEFT OUTER JOIN \"NURSE\" NATURAL LEFT OUTER JOIN \"INTERN\" NATURAL LEFT OUTER JOIN \"PHARMACIST\" NATURAL LEFT OUTER JOIN \"OTHER_EMPLOYEE\" "
        let result = await conn.query(query);
        console.log(result)
        return result;
    }
    async deleteEmployee(empId) {
        let query: string = createSQL.deleteByIdColTable([empId], ["EmpID"], "EMPLOYEE")
        let result = await conn.query(query);
        console.log(result);

        return result
    }
    async findByName(empFname, empLname) {
        let query: string = createSQL.findByValColTable([empFname, empLname], ["Fname", "Lname"], "EMPLOYEE")
        let result = await conn.query(query);
        if (result.length == 0) return "not found"
        return result;
    }
    async findById(empId) {
        let query: string = createSQL.findByValColTable([empId], ["EmpID"], "EMPLOYEE")
        let result = await conn.query(query);
        if (result.length == 0) return "not found"
        return result;
    }
    async updateEmployee(
        empId: string,
        empFname: string,
        empLname: string,
        empBirthDate: string,
        empNationality: string,
        empGender: string,
        empAddr: string,
        empSsn: string,
        empTel: string,
        empJobType: string,
    ) {
        let empCol = ["Fname", "Lname", "BirthDate",
            "Nationality", "Gender", "Address", "Ssn",
            "Tel", "JobType"]
        let val = [
            empFname,
            empLname,
            empBirthDate,
            empNationality,
            empGender,
            empAddr,
            empSsn,
            empTel,
            empJobType,
        ]
        let query: string = createSQL.updateByIdValColTable(empId, "EmpID", val, empCol, "EMPLOYEE")

        let result = await conn.query(query);
        return result

    }
    async deleteNurse(id) {
        let query = createSQL.deleteByIdColTable([id], ["EmpID"], "NURSE")
        let result = await conn.query(query)
        return result
    }
    async deleteIntern(id) {
        let query = createSQL.deleteByIdColTable([id], ["EmpID"], "INTERN")
        let result = await conn.query(query)
        return result
    }
    async deleteDoctor(id) {
        let query = createSQL.deleteByIdColTable([id], ["EmpID"], "DOCTOR")
        let result = await conn.query(query)
        return result
    }
    async deletePharmacist(id) {
        let query = createSQL.deleteByIdColTable([id], ["EmpID"], "PHARMACIST")
        let result = await conn.query(query)
        return result
    }
    async deleteOther(id) {
        let query = createSQL.deleteByIdColTable([id], ["EmpID"], "OTHER_EMPLOYEE")
        let result = await conn.query(query)
        return result
    }
    async getAllDoctor() {
        let query: string = createSQL.findByValColTable(["Doctor"], ["JobType"], "EMPLOYEE")
        let result = await conn.query(query);
        return result;
    }
    async getAllNurse() {
        let query: string = createSQL.findByValColTable(["Nurse"], ["JobType"], "EMPLOYEE")
        console.log(query);
        let result = await conn.query(query);
        console.log(result);

        return result;
    }
    async getAllIntern() {
        let query: string = createSQL.findByValColTable(["Intern"], ["JobType"], "EMPLOYEE")
        console.log(query);
        let result = await conn.query(query);
        console.log(result);
        return result;
    }
    async findCaseOfDoctor(id) {
        let query = createSQL.findByValColTable([id], ["DoctorID"], "DOCTOR_OWN_CASE")
        let result = await conn.query(query)
        const data: string[] = []
        if (result.length == 0) return data
        result.forEach(i => {
            data.push(i.CaseID)
        });
        return data
    }
    async findCaseOfNurse(id) {
        let query = createSQL.findByValColTable([id], ["NurseID"], "NURSE_TCO_CASE")
        let result = await conn.query(query)
        const data: string[] = []
        if (result.length == 0) return data
        result.forEach(i => {
            data.push(i.CaseID)
        });
        return data
    }
    async findCaseOfIntern(id) {
        let query = createSQL.findByValColTable([id], ["InternID"], "INTERN_TRO_CASE")
        let result = await conn.query(query)
        const data: string[] = []
        if (result.length == 0) return data
        result.forEach(i => {
            data.push(i.CaseID)
        });
        return data
    }
}

