'use strict'

const Express = require ('express')
const BodyParser = require ('body-parser')
const cors = require ('cors')
const MethodOverride = require ('method-override')

const App = Express()

App.use(BodyParser.urlencoded({extended:false}))//Activa JSON
App.use(BodyParser.json())//Configura el Json
App.use(MethodOverride())
App.use(cors()) //Para hacer envio de cabeceras IMPORTANTE
App.use(function(req, res, next) { //Todas las respuestas tendran una cabecera
    res.setHeader('Access-Control-Allow-Origin', '*')
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE')
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type, Accept')
    next()
})

const UsersGET = require ('./Usuario/get')
const UsersPOST = require ('./Usuario/post')
App.get('/api/users/all', UsersGET.getallusers)
App.get('/api/users/id/:DATO', UsersGET.getuser)
App.post('/api/users/register/onlyuser', UsersPOST.registeruser)
App.post('/api/users/register/client', UsersPOST.registerclientuser)

App.all('/*', (req, res) => {
    console.log(`Rechaze Peticion invalida de ${req.url} a traves del metodo ${req.originalMethod}`)
    res.status(404).send({StatusCode: 404, Data: '', Message: 'Esta página no existe', Results: 0})
})

module.exports = App