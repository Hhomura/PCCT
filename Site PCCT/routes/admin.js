const express = require("express");
const router = express.Router();
const adminDAO = require("../controller/AdminDAO");

router.get('/login', (req, res) =>{
    res.render("admin/login")
})

router.post('/login', (req, res, next) =>{
    adminDAO.authentificationAdmin(req, res, next);
})

router.get('/register', (req, res) =>{
    res.render("admin/register")
})

router.post('/register', (req, res) =>{
    adminDAO.addAdmin(req, res);
})

router.get('/logout', (req, res, next) =>{
    adminDAO.logout(req, res, next);
})

module.exports = router;