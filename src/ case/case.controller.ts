import { Controller, Post, Body, Get, Param, Delete } from '@nestjs/common';
import { CaseService } from "./case.service";
@Controller('case')
export class CaseController {
    constructor(private readonly caseservice: CaseService) { }
    @Post('insert')
    add(
        @Body('Date') date: string,
        @Body('Description') desc: string,
        @Body('Diagnosis') diag: string,
        @Body('PatientID') patId: string,
        @Body('DoctorID') docId: string

    ) {
        return this.caseservice.insertCase(
            date,
            desc,
            diag,
            patId,
            docId
        )
    }
    @Post('insert/doctor')
    addDoctorToCase(
        @Body('CaseID') caseID: string,
        @Body('DoctorID') docID: string,

    ) {
        return this.caseservice.insertDoctorOwnCase(caseID,docID)
    }
    @Post('insert/nurse')
    addNurseToCase(
        @Body('CaseID') caseID: string,
        @Body('NurseID') nID: string,

    ) {
        return this.caseservice.insertNurseTCOCase(caseID,nID)
    }
    @Post('insert/intern')
    addInternToCase(
        @Body('CaseID') caseID: string,
        @Body('InternID') inID: string,

    ) {
        return this.caseservice.insertInternTROCase(caseID,inID)
    }
    @Get()
    getAll(): any {
        return this.caseservice.getAll();
    }
    @Get('/findByPatId/:id')
    findByPatId(@Param('id') id: string) {
        return this.caseservice.findByPatId(id);
    }
    @Delete('delete/:id')
    removeById(@Param('id') id: string) {
        return this.caseservice.deleteCase(id);
    }
    @Get('findbyid/:id')
    findById(@Param('id') id: string) {
        return this.caseservice.findById(id);
    }
    @Post('update/:id')
    updateById(@Param('id') id: string,
        @Body('Date') date: string,
        @Body('Description') desc: string,
        @Body('Diagnosis') diag: string,
        @Body('PatientID') patId: string


    ) {
        return this.caseservice.updateCase(
            id,
            date,
            desc,
            diag,
            patId
        );
    }
}