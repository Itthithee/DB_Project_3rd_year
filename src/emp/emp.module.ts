import { Module } from '@nestjs/common';
import { EmployeeController } from './emp.controller';
import { EmployeeService } from './emp.service';
@Module({
    controllers: [EmployeeController],
    providers: [EmployeeService],
})
export class EmployeeModule { }