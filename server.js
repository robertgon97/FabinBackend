'use strict'

const App = require('./fabin/Enlaces')
const server = require('http').createServer(App)
const config = require ('./config')

server.listen(config.PORT, () => {
  console.log(`Servidor Corriendo en el Puerto: ${config.PORT}!`)
})