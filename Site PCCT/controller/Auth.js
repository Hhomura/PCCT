const localStrategy = require("passport-local").Strategy;
const bcrypt = require("bcryptjs");
const passport = require("passport");

const admin = require("../models/Administrador");

module.exports = (passport) =>{
    passport.use(new localStrategy({usernameField: 'email', passwordField: 'senha'}, (email, senha, done) =>{
        admin.findOne({where: {email: email}}).then((adm) =>{
            if(!adm){
                return done(null, false, {message: "Essa conta não existe"})
            }

            bcrypt.compare(senha, adm.senha, (erro, check) =>{
                if(check){
                    console.log("Verificando senha");
                    return done(null, adm, {message: "Logado com sucesso!"})
                }else{
                    return done(null, false, {message: "senha incorreta"});
                }
            })
        })
    }))

    passport.serializeUser((adm, done) =>{
        done(null, adm.id);
    })

    passport.deserializeUser((id, done) =>{
        admin.findByPk(id).then((adm) =>{
            done(null, adm)
        }).catch((err) =>{
            done(err, null);
        })
    })
}