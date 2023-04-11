const express = require('express');
const app = express();

const routeAluno = require('./routes/aluno.js');
const routeTurma = require('./routes/turma.js');

// Settings
app.set('port', process.env.PORT);

// Middlewares
app.use(express.json());

// Routes
app.use(routeAluno);
app.use(routeTurma);

// Starting the server
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});

module.exports = app;
