const Router = require('express');
const mysqlCon = require('../database.js');

const router = Router();

let queryAlunoCurso = 'SELECT Aluno.* FROM Aluno \
INNER JOIN AlunoTurma AS AT \
ON Aluno.id_Aluno = AT.id_Aluno \
AND AT.id_Turma = \
( \
  SELECT Turma.id_Turma \
  FROM Turma \
  WHERE Turma.curso = ? \
  AND Turma.ano = ? \
);'

let queryAlunoCursoDia = 'SELECT Aluno.*, Refeicao.turno FROM ((Aluno \
INNER JOIN AlunoTurma AS AT \
ON Aluno.id_Aluno = AT.id_Aluno \
AND AT.id_Turma = \
( \
  SELECT Turma.id_Turma \
  FROM Turma \
  WHERE Turma.curso = ? \
  AND Turma.ano = ? \
)) \
INNER JOIN Refeicao \
ON Refeicao.fk_Aluno = Aluno.id_Aluno \
AND Refeicao.data = ? \
);'

router.get('/', (req, res) => {
  res.status(200).json("HTTP OK");
});

router.get('/alunos', (req, res) => {
    mysqlCon.query('SELECT * FROM Aluno;', (error, rows, fields) => {
    (error) ? console.log(error) : res.json(rows);
    })
});

router.get('/alunos/:curso/:ano', (req, res) => {
    const {curso, ano} = req.params;
    mysqlCon.query(queryAlunoCurso, [curso, ano], (error, rows, fields) => {
    (error) ? console.log(error) : res.json(rows);
    })
})

router.get('/alunos/:curso/:ano/:dia', (req, res) => {
    const {curso, ano, dia} = req.params;
    mysqlCon.query(queryAlunoCursoDia, [curso, ano, dia], (error, rows, fields) => {
    (error) ? console.log(error) : res.json(rows);
    })
})


module.exports = router;
