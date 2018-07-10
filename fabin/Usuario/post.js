'use strict'

const mysql = require ('../Middelware/sql').connection

function validatoruser (body) {
  if (!body.email) return false
  else if (!body.contrasenha) return false
  else return true
}

function validatorclient (body) {
  if (!body.razon_social) return false
  else if (!body.Nombre) return false
  else if (!body.telefon) return false
  else if (!body.direccion_fiscal) return false
  else return true
}

function registeruser (req, res) {
  if (!validatoruser(req.body)) return res.status(400).send({StatusCode: 400, Data: {}, Message: 'Faltan Datos o los mismo son incorrectos', Results: 0})
  mysql.query(`INSERT INTO usuarios VALUES (NULL, '${req.body.id_usuario_tipo_usuario || 1}', '${req.body.email}', '${req.body.contrasenha}', '${req.body.activo || 1}', '${Date.now()}', '${Date.now()}')`, (err, results) => {
    if (err) return res.status(500).send({StatusCode: 500, Data: {}, Message: err, Results: 0})
    else return res.status(200).send({StatusCode: 200, Data: results, Message: 'Operacion Completada', Results: results.length})
  })
}

function registerclientuser (req, res) {
  if (!validatoruser(req.body) || !validatorclient(req.body)) return res.status(400).send({StatusCode: 400, Data: {}, Message: 'Faltan Datos o los mismo son incorrectos', Results: 0})
  mysql.query(`INSERT INTO usuarios VALUES (NULL,  '1', '${req.body.email}', '${req.body.contrasenha}', '${req.body.activo || true}', '${Date.now()}', '${Date.now()}')`, (err, user) => {
    mysql.query(`INSERT INTO cliente VALUES (NULL, '${user.insertId}', '${req.body.razon_social}', '${req.body.Nombre}', '${req.body.telefon}', '${req.body.direccion_fiscal}')`, (err, results) => {
      // if (err) if (err) return res.status(201).send({StatusCode: 500, Data: {}, Message: 'Created user but not created cliente', Results: 0})
      return res.status(200).send({StatusCode: 200, Data: results, Message: err || 'Operacion Completada', Results: results})
    })
  })
}

module.exports = {
  registeruser,
  registerclientuser
}