'use strict'

const mysql = require ('mysql')

function getallusers (req, res, next) {
  req.sql.query('SELECT * FROM usuarios', (err, results) => {
    if (err) {
      req.StatusCode = 500
      req.Data = {}
      req.Message = err
      req.Results = 0
    }
    else {
      req.StatusCode = 200
      req.Data = results
      req.Message = 'Resultados Obtenidos'
      req.Results = results.length
    }
    next()
  })
}
module.exports = {
  getallusers
}