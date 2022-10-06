const db = require('../controller/DBconnection');

const admin = db.sequelize.define('Administradores', {
    nome: {
        type: db.Sequelize.STRING
    },
    email: {
        type: db.Sequelize.STRING
    },
    senha:{
        type: db.Sequelize.STRING
    }
});

// admin.sync({force: true})

module.exports = admin;