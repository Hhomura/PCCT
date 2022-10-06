const express = require("express");
const router = express.Router();
const aluno = require('../models/Alunos');
const alunoDAO = require("../controller/AlunoDAO");
const alunoTurmaDAO = require('../controller/AlunoTurmaDAO')

const turmas = require("../models/Turmas");


router.get('/home', (req, res) =>{
    //alunoTurmaDAO.showAlunoTurma(req, res, aluno, turma,'alunos/home');
    alunoDAO.showAlunos(req, res, turmas);
    
})

router.get('/register', (req, res) =>{
    turmas.findAll().then((turmas) =>{
        res.render('alunos/register', {turmas: turmas})
    }).catch((error) =>{
        res.render("alunos/register", {erros: error});
    })
})

router.post('/register', (req, res) =>{
    alunoDAO.addAlunos(req, res);
})

router.get('/register/extra', (req, res) =>{
    alunoDAO.preAddAlunoExtra(req, res, turmas);
})
router.post('/register/extra', (req, res) =>{
    alunoTurmaDAO.addAlunoTurma(req, res, req.body.alunos, req.body.turmas)
})

module.exports = router;