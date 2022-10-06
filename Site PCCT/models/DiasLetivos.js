const db = require('../controller/DBconnection');

const DiasLetivos = db.sequelize.define('diasletivos', {
    data: {
        type: db.Sequelize.DATE,
        require: true
    },
    feriado: {
        type: db.Sequelize.TINYINT,
        require: true
    }
});

// DiasLetivos.sync({force: true});

module.exports = DiasLetivos;