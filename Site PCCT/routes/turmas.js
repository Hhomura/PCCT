const express = require("express");
const router = express.Router();
const turmasDAO = require("../controller/TurmasDAO");

router.get("/home", (req, res) =>{
    turmasDAO.showTurmas(req, res, 'turmas/HomeTurmas');
})

router.get('/register', (req, res) =>{
    res.render('turmas/addTurmas');
})

router.post('/register', (req, res) =>{
    turmasDAO.addTurmas(req, res);
})

router.get('/update/:id', (req, res) => {
    turmasDAO.preUpdate(req, res);
})

router.post('/update/:id', (req, res) =>{
    turmasDAO.updateTurmas(req, res);
})

router.get('/delete/:id', (req, res) =>{
    turmasDAO.deleteTurmas(req, res);
})
module.exports = router;