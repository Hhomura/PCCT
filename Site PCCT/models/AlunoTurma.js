const db = require('../controller/DBconnection');
const alunos = require('../models/Alunos');
const turmas = require('../models/Turmas');

const alunoturma = db.sequelize.define('alunoturma', {
    fkAluno:{
        type: db.Sequelize.INTEGER,
        references: {
            model: 'alunos',
            key: 'id'
        }
    },
    fkTurma:{
        type: db.Sequelize.INTEGER,
        references: {
            model: 'turmas',
            key: 'id'
        }
    }
});

alunos.hasMany(alunoturma, {foreignKey: 'fkAluno'})
alunoturma.belongsTo(alunos, {foreignKey: 'fkAluno'})
turmas.hasMany(alunoturma, {foreignKey: 'fkTurma'})
alunoturma.belongsTo(turmas, {foreignKey: 'fkTurma'})

//alunoturma.sync({force: true});

module.exports = alunoturma;