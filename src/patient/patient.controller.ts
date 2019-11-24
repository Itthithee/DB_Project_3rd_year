import { Controller, Post, Body, Get, Param, Delete, Put } from '@nestjs/common';
import { PatientService } from './patient.service'
@Controller('patient')
export class PatientController {
    constructor(private readonly patientservice: PatientService) { }
    @Post('insert')
    add(
        @Body('Fname') fname: string,
        @Body('Lname') lname: string,
        @Body('BirthDate') birthDate: string,
        @Body('Gender') gender: string,
        @Body('Address') addr: string,
        @Body('Tel') tel: string,
        @Body('CousinTel') couTel: string,


    ) {
        return this.patientservice.insertPatient(
            fname,
            lname,
            birthDate,
            gender,
            addr,
            tel,
            couTel
        )
    }
    @Get()
    getAll(): any {
        return this.patientservice.getAll() ;
    }
    @Get('findbyname/:fname/:lname')
    findByName(@Param('fname') fname: string, @Param('lname') lname: string) {
        return this.patientservice.findByName(fname, lname);
    }
    @Delete('delete/:id')
    removeById(@Param('id') id: string) {
        return this.patientservice.deletePatient(id);
    }
    @Get('findbyid/:id')
    findById(@Param('id') id: string) {
        return this.patientservice.findById(id);
    }
    @Post('update/:id')
    updateById(@Param('id') id: string,
        @Body('Fname') fname: string,
        @Body('Lname') lname: string,
        @Body('BirthDate') birthDate: string,
        @Body('Gender') gender: string,
        @Body('Address') addr: string,
        @Body('Tel') tel: string,
        @Body('CousinTel') couTel: string,

    ) {
        return this.patientservice.updatePatient(
            id,
            fname,
            lname,
            birthDate,
            gender,
            addr,
            tel,
            couTel ,
        );
    }

    //@Put('update/:id')
    //updateById(@)


}
