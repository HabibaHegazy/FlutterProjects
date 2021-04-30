'use strict'

require('dotenv').config()

module.exports = {
  jwtSecret: process.env.JWT_SECRET,
  env: process.env.ENV,
  mongoDB: (process.env.ENV === 'production') ? process.env.LOCAL_DB_PRO : process.env.MONGO_URI_DEV,
  port: process.env.PORT || 3000,
  saltRounds: process.env.SALT_ROUNDS || 8,
  encryptKey: process.env.ENCRPT_KEY,
  sessionSecret: process.env.SESSION_SECRET,
  sessionMaxAge: process.env.SESSION_MAX_AGE
}