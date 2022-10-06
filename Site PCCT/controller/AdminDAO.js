const admin = require('../models/Administrador');
const bcrypt = require("bcryptjs")
const passport = require("passport");

function verificacaoErros(req, res){
        var erros = [];

        if(!req.body.nome || typeof req.body.nome == undefined || req.body.nome == null){
            erros.push({texto: "Nome Inválido"});
        }

        if(!req.body.email || typeof req.body.email == undefined || req.body.email == null){
            erros.push({texto: "email Inválida."})
        }
    
        if(!req.body.senha || typeof req.body.senha == undefined || req.body.senha == null){
            erros.push({texto: "senha Inválida."})
        }
    
        if(req.body.senha.lenght < 4){
            erros.push({texto: "senha pequena."})
        }
    
        if(!req.body.rsenha || typeof req.body.rsenha == undefined || req.body.rsenha == null){
            erros.push({texto: "senhas Inválida."})
        }
        if(req.body.senha != req.body.rsenha){
            erros.push({texto: "senhas não são iguais."})
        }

        return erros;
}

module.exports = {

    addAdmin: (req, res) =>{
        var erros = verificacaoErros(req, res);

        if(erros.length > 0){
            res.render("admin/register", {erros: erros}) 
         }else{
            admin.findOne({
                where:{
                    email: req.body.email
                },
                attributes: ['email']
            }).then((adm) =>{
                if(adm){
                    console.log("Administrador ja cadastrado");
                    req.flash("error_msg", "Administrador ja cadastrado");
                    res.render("/")
                }else{
                    senhaHash = req.body.senha;

                    bcrypt.genSalt(10, (erro, salt) =>{
                        bcrypt.hash(senhaHash, salt, (erro, hash) =>{
                            if(erro){
                                req.flash("error_msg", "erro em salvar");
                                res.redirect("/")
                            }
                            senha = hash;

                            admin.create({
                                nome: req.body.nome,
                                email: req.body.email,
                                senha: senha
                            }).then(() =>{
                                req.flash("success_msg", "Administrador criado com sucesso!")
                                res.redirect("/");
                            }).catch((error) =>{
                                req.flash("error_msg", "Houve um erro ao cadastrar: "+error);
                                res.redirect("/admin/register");
                            })
                        })
                    })

                }
            }).catch((error) =>{
                console.log("Erro Brutal");
            })
         }
    },

    authentificationAdmin: (req, res, next) =>{
        passport.authenticate("local", {
            successRedirect: '/',
            failureRedirect: '/admin/login',
            failureFlash: true
        })(req, res, next)
    },

    logout: (req, res, next) =>{
        req.logout(function(err) {
            if (err) { return next(err) }
            req.flash("success_msg", "Deslogado com sucesso")
            res.redirect('/')
          })
    }

}