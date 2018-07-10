'use strict'

const mysql = require ('../Middelware/sql').connection

function getallusers (req, res) {
  mysql.query('SELECT * FROM usuarios', (err, results) => {
    if (err) return res.status(500).send({StatusCode: 500, Data: {}, Message: err, Results: 0})
    else return res.status(200).send({StatusCode: 200, Data: results, Message: 'Operacion Completada', Results: results.length})
  })
}

function getuser (req, res, next) {
  mysql.query(`SELECT * FROM usuarios WHERE id_usuario = ${req.params.DATO}`, (err, results) => {
    if (err) return res.status(500).send({StatusCode: 500, Data: {}, Message: err, Results: 0})
    else return res.status(200).send({StatusCode: 200, Data: results.pop(), Message: 'Operacion Completada', Results: results.length})
  })
}

module.exports = {
  getallusers,
  getuser
}