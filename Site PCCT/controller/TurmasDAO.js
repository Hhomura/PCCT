const turmas = require('../models/Turmas');

function verificacaoErros(req, res){
    var erros = [];

    if(!req.body.curso || typeof req.body.curso == undefined || req.body.curso == null){
        erros.push({texto: "Curso Inválido"});
    }

    if(!req.body.ano || typeof req.body.ano == undefined || req.body.ano == null){
        erros.push({texto: "Ano Inválido."})
    }

    return erros;
}

module.exports = {
    addTurmas: (req, res) => {
        var erros = verificacaoErros(req, res);

        if(erros.length > 0){
            res.render("turmas/register", {erros: erros});
        }else{
            turmas.create({
                curso: req.body.curso,
                ano: req.body.ano
            }).then(() =>{
                req.flash("success_msg", "Turma Salva com sucesso!");
                res.redirect('/turmas/home');
            }).catch((error) => {
                req.flash("error_msg", "Falha no cadastro da Turma");
                res.redirect("/turmas/register");
            })
        }
    },

    showTurmas: (req, res, view) => {

        turmas.findAll().then((turmas)=>{

            res.render(view, {turmas: turmas});
            
        })
    },

    preUpdate: (req, res) =>{
        turmas.findByPk(req.params.id).then((turmas) =>{
          res.render('turmas/updateTurmas', {turmas: turmas});  
        }).catch((error) =>{
            req.flash("error_msg", "Erro ao selecionar a turma");
            res.redirect('/turmas/home');
        })
    },

    updateTurmas: (req, res) => {
        turmas.update({
            curso: req.body.curso,
            ano: req.body.ano
        },
        {where:{id: req.params.id}
     }).then(() =>{
        req.flash("success_msg", "Dados da Turma Atualizada com sucesso");
        res.redirect('/turmas/home');
     }).catch((error) =>{
        req.flash("error_msg", "Erro na atualização");
        res.redirect("/turmas/home");
     })
    },

    deleteTurmas: (req, res) => {
        turmas.destroy({where: {id: req.params.id}}).then(() =>{
            req.flash("success_msg", "Dado deletado com sucesso");
            res.redirect("/turmas/home");
        }).catch((error) =>{
            req.flash("error_nsg", "Erro ao deletar o dado " + error);
            res.redirect('/turmas/home')
        })
    }
}