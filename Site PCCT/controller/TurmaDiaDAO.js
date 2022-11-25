const turmadia = require("../models/TurmaDia");
const turma = require("../models/Turmas");
const dl = require("../models/DiasLetivos");
const at = require("../models/AlunoTurma");
const alunos = require("../models/Alunos");
const refeicao = require("../models/Refeicao");

module.exports = {

    preAddTurmaDia: (req, res) =>{
        dl.findAll().then((dias) =>{
            turma.findAll().then((turma) =>{
                
                at.findAll({where:{fkTurma:1}, include: [{model: alunos}]}).then((alunoturmas) =>{
                    console.log(alunoturmas[0].aluno.nome)
                    console.log("Valor: " + alunoturmas.length)
                    /* return res.json({
                        erro: false,
                        alunoturmas
                    }) */
                })
                
                res.render('relacoes/turmadiaregister', {dias: dias, turma: turma})
            }).catch((error) =>{
                req.flash("error_msg", "Erro nas Turmas: "+error)
            res.redirect("/relacoes/TurmaDia") 
            })
            
        }).catch((error) =>{
            req.flash("error_msg", "Erro nos Dias: "+error)
            res.redirect("/relacoes/TurmaDia")  
    })
    },

    addTurmaDia: (req, res) =>{
           turmadia.create({
            fkTurma: req.body.turma,
            fkDiaLetivo: req.body.diasletivos
           }).then(() =>{
            //Busca dos Alunos
            at.findAll({where:{fkTurma: req.body.turma}, include: [{model: alunos}]}).then((alunoturmas) =>{
                //Busca do Dia
                dl.findByPk(req.body.diasletivos).then((dias) =>{
                    //A magicca Acontece aqui
                    for(var i = 0; i < alunoturmas.length; i++){
                        refeicao.create({
                            fkAluno: alunoturmas[i].aluno.id,
                            turno: req.body.turno,
                            status: 0,
                            data: dias.data,
                            alunoId: alunoturmas[i].aluno.id
                        })
                    }
                })
            })

            req.flash("success_msg", "Vinculação feita com sucesso");
            res.redirect('/relacoes/TurmaDia');

           }).catch((error) =>{
            req.flash("error_msg", "Erro na Vinculação");
            res.redirect('/relacoes/TurmaDia');
           })
    },

    showDiasLetivos: (req, res) =>{
        dl.findAll({order:['data']}).then((diasletivos) =>{
            res.render('relacoes/turmadia', {dias: diasletivos});
        }).catch((error) =>{
            req.flash("error_msg", "Erro nos dias: "+error);
            res.redirect('/')
        })
    },

    showTurmaDiaTurma: (req, res) =>{
        turmadia.findAll({where: {fkDiaLetivo: req.params.id}, include: [{model: turma}]}).then((turmadia) =>{
            console.log(turmadia);
            res.render('relacoes/turmadiaturma', {turmadia: turmadia});
        }).catch((error) =>{
            req.flash("error_msg", "Erro na Busca")
            res.redirect('relacoes/TurmaDia');
        })
    }
}