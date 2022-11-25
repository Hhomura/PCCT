const express = require('express');
const handlebars = require('express-handlebars');
const bodyParser = require("body-parser");
const app = express();
const session = require("express-session");
const flash = require("connect-flash");

//CONFIGURAÇÕES PASSPORT
const passport = require("passport");
require("./controller/Auth")(passport);
//PATH
const path = require('path')

// Sessão
app.use(session({
    secret: "chavesessao",
    resave: true,
    saveUninitialized: true
}));
app.use(passport.initialize())
app.use(passport.session())
app.use(flash());


//Middleware
app.use((req, res, next) =>{
    //VARIAÁVEIS GLOBAIS
    res.locals.success_msg = req.flash("success_msg");
    res.locals.error_msg = req.flash("error_msg");
    res.locals.error = req.flash("error");
    res.locals.admin = req.user || null;
    next()
})

//MYSQL
const mysql = require('./controller/DBconnection');
mysql.testeConexao();

//Configurações bodyParser
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

//Configurações Handlebars
app.engine('handlebars', handlebars.engine({defaultLayout: 'main', runtimeOptions:{
    allowProtoPropertiesByDefault: true,
    allowedProtoMethods: true
}}))
app.set('view engine', 'handlebars');

//Configurações PATH
app.use(express.static(path.join(__dirname, "public")));

//Rotas
const admin = require("./routes/admin");
const turmas = require("./routes/turmas");
const alunos = require("./routes/alunos");
const diasletivos = require("./routes/diasletivos");
const relacoes = require("./routes/relations");

app.use("/admin", admin);
app.use("/turmas", turmas);
app.use("/alunos", alunos);
app.use("/diasletivos", diasletivos);
app.use("/relacoes", relacoes);

app.get('/', (req, res) =>{
    res.render("HomePage")
});

//Servidor
const PORT = 8081;
app.listen(PORT, () =>{
    console.log("Servidor rodando na porta: "+PORT);
})
