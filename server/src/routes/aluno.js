import Router from 'express';
import mysqlCon from '../database.js';

const router = Router();

let queryCurso = 'SELECT Aluno.nome FROM Aluno, AlunoTurma\
WHERE AlunoTurma.id_Aluno = Aluno.id_Aluno\
AND AlunoTurma.id_Turma = (\
  SELECT Turma.id_Turma FROM Turma\
  WHERE Turma.curso = ?\
);'

let queryCursoDia = ';';
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
    mysqlCon.query(queryCurso, [curso], (error, rows, fields) => {
        if(!error){
            res.json(rows);
        } else{
            console.log(error);
        }
    })
})

router.get('/:alunos/:curso/:dia', (req, res) => {
    const {curso, dia} = req.params;
    mysqlCon.query('SELECT * FROM Aluno WHERE id_Aluno = ?;', [id], (error, rows, fields) => {
        if(!error){
            res.json(rows);
        } else{
            console.log(error);
        }
    })
})

export default router;
