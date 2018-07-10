'use strict'

const config = require ('./config')
const mysql = require ('./fabin/Middelware/sql').connection //require('mysql').createConnection(config.connection)
const App = require('./fabin/Enlaces')
const server = require('http').createServer(App)

server.listen(config.PORT, () => {
  console.log(`Servidor Corriendo en el Puerto: ${config.PORT}!`)
})