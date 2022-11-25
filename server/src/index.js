import express from 'express';
const app = express();

import route from './routes/aluno.js'

// Settings
app.set('port', process.env.PORT || 8000);

// Middlewares
app.use(express.json());

// Routes
app.use(route);

// Starting the server
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});

export default app;
