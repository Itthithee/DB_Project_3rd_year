import {Pool} from 'pg';

class Connect{
    private pool : Pool = new Pool({
        user: 'postgres',
        host: 'localhost',
        database: 'Hostpital',
        password: '1234',
        port: 5432,
        }
    );
    public row : any[];
    async query(text : string){ 
        try{
        let res = await this.pool.query(text)
        console.log(res);
        return res.rows
        }
        catch(err){
            console.log(err);
            
        }
        
    }
    end(){
        this.pool.end()
    }
}
let conn = new Connect();
export{conn}