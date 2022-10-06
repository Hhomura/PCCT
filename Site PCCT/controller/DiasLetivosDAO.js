const dias = require('../models/DiasLetivos');
const moment = require("moment");

module.exports = {
    addDias: (req, res) =>{

        var feriado = req.body.feriado;
        var data = req.body.data;

        let dataExact = moment(data)
    
        dias.create({
            data: dataExact,
            feriado: feriado
        }).then(()=>{
            req.flash("success_msg", "Data Cadastrada!")
            res.redirect("/diasletivos/home")
        }).catch((error) =>{
            req.flash("error_msg", "Erro ao cadastrar data: "+error);
            res.redirect("/diasletivos/register")
        })
    },

    showData: (req, res, view) =>{
        dias.findAll().then((dias) => {
            let data = moment(dias.data).format("DD/MM/YYYY");
            dias.data = data;
            console.log(data);
            console.log(dias.data);
            res.render(view, {diasletivos: dias});
        })
    },
    
    preUpdate:(req, res) =>{
        dias.findByPk(req.params.id).then((dias) =>{
            res.render('diasletivos/updatedias', {dias: dias});  
        }).catch((err) =>{
            req.flash("error_msg", "Erro ao acessar dado");
            res.redirect('/diasletivos/home');
        })
    },

    updateDias: (req, res) => {

        var data = req.body.data;

        let dataExact = moment(data)

        dias.update({
            data: dataExact,
            feriado: req.body.feriado
        },
        {
            where:{id: req.params.id}}).then(() =>{
                req.flash("success_msg", "Data Atualizada!")
                res.redirect("/diasletivos/home")
        }).catch((error) =>{
            req.flash("error_msg", "Erro ao atualizar")
            res.redirect("/diasletivos/home")
        })
    },

    deleteDias: (req, res) => {
        dias.destroy({where: {id: req.params.id}}).then(() =>{
            req.flash("success_msg", "Dado deletado com sucesso");
            res.redirect("/diasletivos/home");
        }).catch((error) =>{
            req.flash("success_msg", "Erro ao deletar");
            res.redirect("/diasletivos/home");
        })
    }
}