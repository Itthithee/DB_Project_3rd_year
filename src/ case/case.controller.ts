import { Controller, Post, Body, Get, Param, Delete } from '@nestjs/common';
import { CaseService } from "./case.service";
@Controller('case')
export class CaseController {
    constructor(private readonly caseservice: CaseService) { }
    @Post()
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
    @Get('find/:id')
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