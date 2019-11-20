import { Controller, Post, Body, Get, Param, Delete, Put } from '@nestjs/common';
import { EmployeeService } from './emp.service'
@Controller('employee')
export class EmployeeController {
    constructor(private readonly employeeservice: EmployeeService) { }
    @Post()
    addEmployee(
        @Body('Fname') empFname: string,
        @Body('Lname') empLname: string,
        @Body('BirthDate') empBirtDate: string,
        @Body('Nationality') empNationality: string,
        @Body('Gender') empGender: string,
        @Body('Address') empAddr: string,
        @Body('Ssn') empSsn: string,
        @Body('Tel') empTel: string,
        @Body('JobType') empJobType: string,
        @Body('LicenseID') licenseId: string,
        @Body('LicenseExp') licenseExp: string,
        @Body('Head') head: string,
        @Body('StartDate') startDate: string,
        @Body('EndDate') endDate: string,
        @Body('Speciallist') special: string

    ) {
        return this.employeeservice.insertEmployee(
            empFname,
            empLname,
            empBirtDate,
            empNationality,
            empGender,
            empAddr,
            empSsn,
            empTel,
            empJobType,
            licenseId,
            licenseExp,
            head,
            startDate,
            endDate,
            special);
    }
    @Get()
    getEmps(): any {
        return this.employeeservice.getEmployees();
    }
    @Get('/findbyname/:fname/:lname')
    findByName(@Param('fname') fname: string, @Param('lname') lname: string) {
        return this.employeeservice.findByName(fname, lname);
    }
    @Delete('delete/:id')
    removeById(@Param('id') empId: string) {
        return this.employeeservice.deleteEmployee(empId);
    }
    @Get(':id')
    findById(@Param('id') empId: string) {
        return this.employeeservice.findById(empId);
    }
    @Post('update/:id')
    updateById(@Param('id') empId: string,
        @Body('Fname') empFname: string,
        @Body('Lname') empLname: string,
        @Body('BirthDate') empBirtDate: string,
        @Body('Nationality') empNationality: string,
        @Body('Gender') empGender: string,
        @Body('Address') empAddr: string,
        @Body('Ssn') empSsn: string,
        @Body('Tel') empTel: string,
        @Body('JobType') empJobType: string,
        @Body('LicenseId') licenseId: string,
        @Body('LicenseExp') licenseExp: string,
        @Body('Head') head: string,
        @Body('StartDate') startDate: string,
        @Body('EndDate') endDate: string,
        @Body('SpecialList') special: string
    ) {
        return this.employeeservice.updateEmployee(
            empId,
            empFname,
            empLname,
            empBirtDate,
            empNationality,
            empGender,
            empAddr,
            empSsn,
            empTel,
            empJobType ,
        );
    }

    //@Put('update/:id')
    //updateById(@)


}
