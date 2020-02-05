import { Pool } from 'pg';
import { config } from './dbconfig'
class Connect {
    private pool: Pool = new Pool(config);
    public row: any[];
    async query(text: string) {
        try {
            let res = await this.pool.query(text)
            console.log(res);

            return res.rows
        }
        catch (err) {
            console.log(err);

            return err
        }

    }
    end() {
        this.pool.end()
    }
}
let conn = new Connect();
export { conn }