'use strict'

const mongoose = require('mongoose')
const { mongoDB, env } = require('./config')

exports.connect = async () => {
  await mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true, useFindAndModify: false, useCreateIndex: true }).then(() => {
    console.log(`Success Connection to: ${env.toUpperCase()} database`)
    mongoose.connection.once('open', function () {
      console.log('MongoDB database connection established successfully')
    })
  }).catch(err => {
    Logger.writeLogger('e', `Exception was made while connecting to the mongoDB, Error: ${err}`)
    console.error(err)
    process.exit(1)
  })
}