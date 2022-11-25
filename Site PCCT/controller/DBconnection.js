const Sequelize = require('sequelize');
const sequelize = new Sequelize('refeicao', 'root', '080199', {
    host: "localhost",
    dialect: 'mysql'
});

module.exports = { 
    Sequelize: Sequelize,
    sequelize: sequelize,

    testeConexao : function connection(){
        sequelize.authenticate().then(() => {
            console.log("Banco conectado");
        }).catch(function(erro){
            console.log("Erro: "+ erro);
        })
    }
}