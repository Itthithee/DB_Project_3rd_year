import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import {EmployeeModule} from './emp/emp.module'
import {PatientModule} from './patient/patient.module'
import {CaseModule} from "./ case/case.module";

@Module({
  imports: [EmployeeModule,PatientModule,CaseModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
