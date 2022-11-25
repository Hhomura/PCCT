const db = require("../controller/DBconnection");

const Turmas = db.sequelize.define('Turmas', {
    curso: {
        type: db.Sequelize.STRING
    },
    ano: {
        type: db.Sequelize.INTEGER
    }
})

//Turmas.sync({force: true});

module.exports = Turmas;