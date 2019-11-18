import { Controller, Post, Body, Get } from '@nestjs/common';
import {EmployeeService} from './emp.service'
@Controller('employee')
export class EmployeeController {
    constructor( private readonly employeeservice : EmployeeService){}
    @Post()
    addEmployee(
        @Body('Fname') empFname : string,
        @Body('Lname') empLname : string,
        @Body('BirthDate') empBirtDate : string,
        @Body('Nationality') empNationality : string,
        @Body('Gender') empGender : string,
        @Body('Address') empAddr : string,
        @Body('Ssn') empSsn : string,
        @Body('Tel') empTel : string,
        @Body('JobType') empJobType : string,
        @Body('LicenseId') licenseId : string,
        @Body('LicenseExp') licenseExp : string,
        @Body('Head') head : string,
        @Body('StartDate') startDate : string,
        @Body('EndDate') endDate : string,
        @Body('SpecialList') special : string

    ){
        return this.employeeservice.insertEmployee(
            empFname ,
            empLname ,
            empBirtDate,
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
            special );
    }
    @Get()
    getEmps() :any {
        return this.employeeservice.getEmployees();
    }
}
