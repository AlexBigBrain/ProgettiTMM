const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'userDBTMM',
    database: 'DBTMM',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
    password: 'userDBTMM.Progetto01'
});


module.exports = pool;