const express = require("express");
const router = express.Router();
const alunoTurmaDAO = require("../controller/AlunoTurmaDAO");
const turmaDiaDAO = require("../controller/TurmaDiaDAO");

router.get('/TurmaAluno', (req, res) =>{
    alunoTurmaDAO.showTurmaAluno(req, res);
})

router.get('/TurmaAluno/:id', (req, res) =>{
    alunoTurmaDAO.showTurmaAlunoR(req, res);
})

router.get('/AlunoTurma', (req, res) =>{
    alunoTurmaDAO.showAlunoTurma(req, res);
})

router.get('/AlunoTurma/:id', (req ,res) =>{
    alunoTurmaDAO.showAlunoTurmaR(req, res);
})

router.get('/TurmaDia', (req, res) =>{
    turmaDiaDAO.showDiasLetivos(req, res);
})
router.get('/TurmaDia/:id', (req, res) =>{
    turmaDiaDAO.showTurmaDiaTurma(req, res);
})

router.get('/TurmaDVinculo/register', (req, res) =>{
    turmaDiaDAO.preAddTurmaDia(req, res);
})

router.post('/TurmaDVinculo/register', (req, res) =>{
    turmaDiaDAO.addTurmaDia(req, res);
})

module.exports = router;