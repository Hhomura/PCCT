import express from 'express';
const app = express();

import routeAluno from './routes/aluno.js';
import routeTurma from './routes/turma.js';

// Settings
app.set('port', process.env.PORT || 8000);

// Middlewares
app.use(express.json());

// Routes
app.use(routeAluno);
app.use(routeTurma);

// Starting the server
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});

export default app;
