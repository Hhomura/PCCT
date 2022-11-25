import mysql from 'mysql';

const mysqlCon = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'MYSQLROOT3306',
    database: 'pcct'
});

mysqlCon.connect(function (error){
    if(error) throw error;
    console.log('Conectado!');
});

export default mysqlCon;
