const alunos = require('../models/Alunos');
const turmas = require('../models/Turmas');
const alunosTurmas = require('./AlunoTurmaDAO');

var turmasCollections;
var alunosCollections;


function verificacaoErros(req, res){
    var erros = []

    if(!req.body.nome || typeof req.body.nome == undefined || req.body.nome == null){
        erros.push({texto: "Nome Inválido"})
    }
     if(!req.body.matricula || typeof req.body.matricula == undefined || req.body.matricula == null){
        erros.push({texto: "Slug Inválido"})
    }
    if(!req.body.rfid || typeof req.body.rfid == undefined || req.body.rfid == null){
        erros.push({texto: "Nome Inválido"})
    }
     if(!req.body.numcell || typeof req.body.numcell == undefined || req.body.numcell == null){
        erros.push({texto: "Slug Inválido"})
    }
     if(req.body.nome.length < 2){
        erros.push({texto: "Nome muito pequeno"})
    }
    if(erros.length > 0){
        return erros;           
    }
}
      

module.exports = {

    addAlunos: (req, res) =>{

        var erros = verificacaoErros(req, res);

        if(erros > 0){
            res.render("alunos/register", {erros: erros});
        }else{
            alunos.create({
                nome: req.body.nome,
                matricula: req.body.matricula,
                rfid: req.body.rfid,
                numcel: req.body.numcell
            }).then((alunos) =>{
              alunosTurmas.addAlunoTurma(req, res, alunos.id, req.body.turmas)
            }).catch((error) =>{
                req.flash("error_msg", "Falha no cadastro: " + error);
               res.redirect('/alunos/register')
            })
            
        }

    },

    //certo
    preAddAlunoExtra: (req, res, turmas) =>{
        turmas.findAll().then((turmas) =>{
            alunos.findAll({order: ['nome']}).then((alunos) =>{
                res.render('alunos/registerextra', {turmas: turmas, alunos: alunos});
            }) 
        })
    },

    showAlunos: (req, res, turmas) =>{
        alunos.findAll().then((alunos) =>{
            res.render('alunos/home',{alunos: alunos});
        }).catch((error) =>{
            res.redirect("/alunos/home")
            req.flash("error_msg", "Erro na bsuca dos alunos")
        })
        
    }

}