'use strict'

const mysql = require('mysql')
const config = require ('../../config')
const connection = mysql.createConnection(config.connection)

function startsql (req, res, next) {
  connection.connect(function(err) {
    if (err) console.error('error connecting: ' + err.stack)
    req.sql = connection
    req.StatusCode = 200
    req.Data = {}
    req.Message = ''
    req.Results = 0
    next()
  })
}

function stopsql (req, res) {
  connection.end((err, exit) => {
    if (err) return res.status(500).send({StatusCode: req.StatusCode, Data: req.Data || {}, Message: req.Message, Results: req.Results})
    else return res.status(200).send({StatusCode: req.StatusCode, Data: req.Data || {}, Message: req.Message, Results: req.Results})
  })
}

module.exports = {
  startsql,
  stopsql
}