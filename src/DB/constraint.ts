export class Employee {
    private err : any[];
    public schema : string[] = ["EmpID","Fname","Lname","BirthDate",
                                "Nationality","Gender","Address","Ssn",
                                "Tel","JobType"]
    
    constructor(
        private id :string,
        private fname :string,
        private lname :string,
        private birthDate :Date,
        private nationality :string,
        private gender :string,
        private addr :string,
        private ssn :string,
        private tel :string,
        //private dpId :string,
        private jobType :string
    ){}
    checkConstraint() :any[]{
        if(this.id.length != 7){
            this.err.push("id")
        }
        if(this.fname.length > 20){
            this.err.push("fname")
        }
        if(this.lname.length > 20){
            this.err.push("lname")
        }
        if(this.nationality.length >20){
            this.err.push("nationality")
        }
        if(this.addr.length > 255){
            this.err.push("addr")
        }
        if(this.ssn.length != 13){
            this.err.push("ssn")
        }
        if(this.gender.length != 1){
            this.err.push("gender")
        }
        if(this.tel.length != 10){
            this.err.push("jobType")
        }
        if(this.jobType.length == 0 ||this.jobType.length > 20){
            this.err.push("jobType")
        }

        return [this.err.length != 0].concat(this.err) // err was found send true
        
        
    }
    
}
export class Doctor {
    private err : any[];
    public schema : string[] = ["EmpID","Specialist","LicenseID","LicenseExp"]
    
    constructor(
        private id :string,
        private specialist :string,
        private licenseId :string,
        private licenseExp :Date,
       
    ){}
    checkConstraint() :any[]{
        if(this.id.length != 7){
            this.err.push("id")
        }
        if(this.specialist.length > 20){
            this.err.push("specialist")
        }
        if(this.licenseId.length > 10){
            this.err.push("licenseId")
        }
    
        return [this.err.length != 0].concat(this.err) // err was found send true
        
        
    }
    
}
export class Nurse {
    private err : any[];
    public schema : string[] = ["EmpID","Head","LicenseID","LicenseExp"]
    
    constructor(
        private id :string,
        private head :boolean,
        private licenseId :string,
        private licenseExp :Date,
       
    ){}
    checkConstraint() :any[]{
        if(this.id.length != 7){
            this.err.push("id")
        }
        if(this.licenseId.length > 10){
            this.err.push("licenseId")
        }
    
        return [this.err.length != 0].concat(this.err) // err was found send true
        
        
    }
    
}
export class Intern {
    private err : any[];
    public schema : string[] = ["EmpID","StartDate","EndDate","Duration"]
    
    constructor(
        private id :string,
        private specialist :string,
        private licenseId :string,
        private licenseExp :Date,
       
    ){}
    checkConstraint() :any[]{
        if(this.id.length != 7){
            this.err.push("id")
        }
        if(this.specialist.length > 20){
            this.err.push("specialist")
        }
        if(this.licenseId.length > 10){
            this.err.push("licenseId")
        }
    
        return [this.err.length != 0].concat(this.err) // err was found send true
        
        
    }
    
}