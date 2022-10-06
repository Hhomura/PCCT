const db = require('../controller/DBconnection');

const diasletivos = require("../models/DiasLetivos");
const turmas = require("../models/Turmas");

const turmaDia = db.sequelize.define('turmadia', {
    fkTurma: {
        type: db.Sequelize.INTEGER,
        references: {
            model: 'turmas',
            key: 'id'
        }
    },
    fkDiaLetivo: {
        type: db.Sequelize.INTEGER,
        references: {
            model: 'diasletivos',
            key: 'id'
        }
    }
})


diasletivos.hasMany(turmaDia, {foreignKey: 'fkDiaLetivo'})
turmaDia.belongsTo(diasletivos, {foreignKey: 'fkDiaLetivo'})
turmas.hasMany(turmaDia, {foreignKey: 'fkTurma'})
turmaDia.belongsTo(turmas, {foreignKey: 'fkTurma'})

//turmaDia.sync({force: true});

module.exports = turmaDia;

