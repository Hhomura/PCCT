const Router = require('express');
const mysqlCon = require('../database.js');

const router = Router();

router.get('/', (req, res) => {
  res.status(200).json("HTTP OK");
});

router.get('/turmas', (req, res) => {
  mysqlCon.query("SELECT * FROM Turma;", (error, rows, fields) => {
    (error) ? console.log(error) : res.json(rows);
  });
})

router.get('/turmas/cursos', (req, res) => {
  mysqlCon.query("SELECT Turma.curso FROM Turma GROUP BY Turma.curso;", (error, rows, fields) => {
    (error) ? console.log(error) : res.json(rows);
  });
})


module.exports = router;
