const db = require('../controller/DBconnection');

const alunos = db.sequelize.define('alunos', {
    nome: {
        type: db.Sequelize.STRING,
        require: true
    },
    matricula: {
        type: db.Sequelize.INTEGER,
        require: true
    },
    rfid: {
        type: db.Sequelize.INTEGER,
        require: true
    },
    numcel: {
        type: db.Sequelize.STRING,
        require: true
    }
})

//alunos.sync({force: true})

module.exports = alunos;