import Router from 'express';
import mysqlCon from '../database.js';

const router = Router();

let queryAlunoCurso = 'SELECT Aluno.* FROM Aluno \
INNER JOIN AlunoTurma AS AT \
ON Aluno.id_Aluno = AT.id_Aluno \
AND AT.id_Turma = \
( \
  SELECT Turma.id_Turma \
  FROM Turma \
  WHERE Turma.curso = ? \
);'

let queryAlunoCursoDia = 'SELECT Aluno.*, Refeicao.turno FROM ((Aluno \
INNER JOIN AlunoTurma AS AT \
ON Aluno.id_Aluno = AT.id_Aluno \
AND AT.id_Turma = \
( \
  SELECT Turma.id_Turma \
  FROM Turma \
  WHERE Turma.curso = ? \
)) \
INNER JOIN Refeicao \
ON Refeicao.fk_Aluno = Aluno.id_Aluno \
AND Refeicao.data = ? \
);'

router.get('/', (req, res) => {
  res.status(200).json("HTTP OK");
});

router.get('/:alunos', (req, res) => {
    mysqlCon.query('SELECT * FROM Aluno;', (error, rows, fields) => {
        if(!error){
            console.log(res.json(rows));
        } else{
                console.log(error);
        }
    })
});


router.get('/:alunos/:curso', (req, res) => {
    const {curso} = req.params;
    mysqlCon.query(queryAlunoCurso, [curso], (error, rows, fields) => {
        if(!error){
            res.json(rows);
        } else{
            console.log(error);
        }
    })
})

router.get('/:alunos/:curso/:dia', (req, res) => {
    const {curso, dia} = req.params;
    mysqlCon.query(queryAlunoCursoDia, [curso, dia], (error, rows, fields) => {
        if(!error){
            res.json(rows);
        } else{
            console.log(error);
        }
    })
})

export default router;
