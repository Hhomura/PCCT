const express = require('express');
const router = express.Router();
const diasDAO = require("../controller/DiasLetivosDAO");

router.get('/home', (req, res) =>{
    diasDAO.showData(req, res, "diasletivos/home");
})

router.get('/register', (req, res) =>{
    res.render('diasletivos/register')
})

router.post('/register', (req, res) =>{
    diasDAO.addDias(req, res);
})

router.get('/update/:id', (req, res) =>{
        diasDAO.preUpdate(req, res);
})

router.post("/update/:id", (req, res) =>{
    diasDAO.updateDias(req, res);

})
router.get('/delete/:id', (req, res) =>{
    diasDAO.deleteDias(req, res);
})

module.exports = router;