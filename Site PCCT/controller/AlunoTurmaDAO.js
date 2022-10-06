const at = require('../models/AlunoTurma');
const { Op, where } = require("sequelize");
const turmas = require("../models/Turmas");
const alunos = require('../models/Alunos');

module.exports = {

    addAlunoTurma: (req, res, pkAluno, pkTurma) =>{
        console.log("Turma id: "+ pkTurma)
        console.log("Aluno ID: "+ pkAluno)
        at.create({
            fkAluno: pkAluno,
            fkTurma: pkTurma,
            TurmaId: pkTurma,
            alunoId: pkAluno
        }).then(() =>{
            req.flash("success_msg", "Sucesso no cadastro");
            res.redirect('/alunos/home')
        }).catch((error) =>{
            req.flash("error_msg", "erro no Cadastrado: " + error);
            res.redirect("/alunos/register")
        })
    },

    showTurmaAluno: (req, res) =>{
        turmas.findAll()
        .then(
            (turmas) =>{
            res.render('relacoes/turmaalunos', {turmas:turmas});
        }
        ).catch(
            
            (error) =>{
            req.flash("error_msg", "Erro na busca das trumas")
            res.redirect('/')
        }
        )
    },
    
    showTurmaAlunoR: (req, res) =>{
        at.findAll({ where: {
            fkTurma: req.params.id
        }, 
        include:[{
            model: alunos
        }]
    }).then((alunoturma) =>{

            /* return res.json({
                erro: false,
                alunoturma
            }) */
            res.render('relacoes/turmaalunosR', {alunoturma: alunoturma})
            console.log(alunoturma)
        }).catch((error) =>{
            req.flash("error_msg", "Erro na Lógica")
            res.redirect('/relacoes/TurmaAluno')
        })
    },

    showAlunoTurma: (req, res) =>{
        alunos.findAll({order: ['nome']}).then((alunos) =>{
            res.render('relacoes/alunosturmas', {alunos: alunos})
        })
    },

    showAlunoTurmaR: (req, res) =>{
        at.findAll({where:{ fkAluno: req.params.id}, include:[{model: turmas}]}).then((alunoturma) =>{
            res.render('relacoes/alunosturmasR', {alunoturma: alunoturma})
        }).catch((error) =>{
            req.flash("error_msg", "Erro na Lógica")
            res.redirect('/relacoes/AlunoTurma')
        })
    }
}