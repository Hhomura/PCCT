import Router from 'express';
import mysqlCon from '../database.js';

const router = Router();

router.get('/', (req, res) => {
  res.status(200).json("HTTP OK");
});

router.get('/turmas', (req, res) => {
  mysqlCon.query("SELECT * FROM Turma;", (error, rows, fields) => {
    (error) ? console.log(error) : res.json(rows);
  });
})

export default router;
