'use strict'

module.exports={
    PORT: process.env.PORT || 3000,
    connection: {
      host:  'localhost',
      port: 3306,
      user: 'root',
      password: null,
      database: 'fabin'
    }
}