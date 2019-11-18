import { Injectable, Query } from '@nestjs/common';
import {conn} from 'src/DB/connection'
import { createSQL } from "src/DB/createQuery";
@Injectable()
export class EmployeeService {
    private jobList : string[] = ["Doctor","Nurse","Intern","Pharmacist"]
    private doctor : string[] = ["EmpID","Specialist","LicenseID","LicenseExp"]
    private employee : string[] = ["EmpID","Fname","Lname","BirthDate",
                                "Nationality","Gender","Address","Ssn",
                                "Tel","JobType"]
    private nurse : string[] = ["EmpID","Head","LicenseID","LicenseExp"]
    private intern : string[] = ["EmpID","StartDate","EndDate"]
    private pharma : string[] = ["EmpID","LicenseID","LicenseExp"]
    private other : string[] = ["EmpID","JobName"]
    async insertEmployee( 
                    empFname : string,
                    empLname : string,
                    empBirtDate : string,
                    empNationality : string,
                    empGender : string,
                    empAddr : string,
                    empSsn : string,
                    empTel : string,
                    empJobType : string,
                    licenseId :string,
                    licenseExp :string,
                    head :string,
                    startDate :string,
                    endDate :string,
                    special :string
                    ) {
        
        let res = await conn.query("SELECT * FROM \"EMPLOYEE\" ORDER BY \"EmpID\" DESC LIMIT 1")
        let empId : string = "0000001"       
        if(res[0] !== undefined){
            let e = res[0].EmpID
            empId = (parseInt(e,10)+1).toString()
            while(empId.length < 7){
                empId = "0"+empId                
            }
        }
        let value = [
            empId,
            empFname ,
            empLname ,
            empBirtDate ,
            empNationality ,
            empGender ,
            empAddr ,
            empSsn ,
            empTel ,
            empJobType
        ]
        /*let err : any[] = emp.checkConstraint();
        if(err[0]){
            return err.toString()
        }*/
        let query1 : string = createSQL.insertValColTable(value,this.employee,"EMPLOYEE")
        let query2
        let result1 = await conn.query(query1);
        let result2
        switch (empJobType) {
            case this.jobList[0]: ///doctor
                query2 = createSQL.insertValColTable([empId,special,licenseId,licenseExp]
                    ,this.doctor,"DOCTOR")
                break;
                
            case this.jobList[1]: ///nurse
                query2 = createSQL.insertValColTable([empId,,head,licenseId,licenseExp]
                    ,this.nurse,"NURSE")
                break;
            case this.jobList[2]: ///intern
                query2 = createSQL.insertValColTable([empId,startDate,endDate]
                    ,this.intern,"INTERN")
                break;
            case this.jobList[3]: ///pharmacist
                query2 = createSQL.insertValColTable([empId,licenseId,licenseExp]
                    ,this.pharma,"PHARMACIST")
                break;
            default:
                query2 = createSQL.insertValColTable([empId,empJobType]
                    ,this.other,"OTHER_EMPLOYEE")
                break;
            
        }
        console.log(query2);
        
        result2 = await conn.query(query2);
        return "success"
    }
    async getEmployees() {
        let query : string = createSQL.findAll("EMPLOYEE")
        let result = await conn.query(query);
        console.log(result)
        return result;
    }
    async deleteEmployee(){

    }
    async findByName(empFname , empLname ){
        let query : string = createSQL.findByValColTable([empFname,empLname],["Fname","Lname"],"EMPLOYEE")
        let result = await conn.query(query);
        return result
    }
    async updateEmployee(
        empId : string,
        empFname : string,
        empLname : string,
        empBirtDate : string,
        empNationality : string,
        empGender : string,
        empAddr : string,
        empSsn : string,
        empTel : string,
        empJobType : string,
        licenseId :string,
        licenseExp :string,
        head :string,
        startDate :string,
        endDate :string,
        special :string
        ){
            let val = [
            empId ,
            empFname ,
            empLname ,
            empBirtDate ,
            empNationality ,
            empGender ,
            empAddr ,
            empSsn ,
            empTel ,
            empJobType ,
            licenseId ,
            licenseExp ,
            head ,
            startDate ,
            endDate ,
            special ]
        let query : string = createSQL.updateByIdValColTable(empId,"EmpID",val,this.employee,"EMPLOYEE")
        let result = await conn.query(query);
        return result
    }
}

