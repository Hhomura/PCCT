const db = require("../controller/DBconnection")

const alunos = require("../models/Alunos");

const refeicao = db.sequelize.define('refeicao', {
    fkAluno: {
        type: db.Sequelize.INTEGER,
        references:{
            model: 'alunos',
            key: 'id'
        }
    },
    turno: {
        type: db.Sequelize.STRING
    },
    status:{
        type: db.Sequelize.TINYINT
    },
    data:{
        type: db.Sequelize.DATE
    }
})

refeicao.belongsTo(alunos, {foreingKey: 'fkAluno', allowNull: false});

//refeicao.sync({force:true})
module.exports = refeicao;