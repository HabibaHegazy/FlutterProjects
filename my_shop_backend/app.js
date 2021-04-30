'use strict'

const { port, sessionSecret, sessionMaxAge, env } = require('./config/config')

// ========================================
// ======== initialize the app ============
// ========================================
const express = require('express')
const app = express()

// ========================================
// ======== initialize database ===========
// ========================================
const database = require('./config/db')
database.connect()

// ========================================
// ========== PROJECT ROUTES ==============
// ========================================
const productRoute = require('./routes/product_route')
app.use('/products', productRoute)


// ========== page not found ==========
app.use(function (req, res, next) {
    res.status(404).json({
        message: 'Page Not Found'
    })
})

// ========================================
// ================ SERVER ================
// ========================================
const http = require('http')
const server = http.createServer(app)
server.listen(port, () => {
    console.log(`Express server listening on port ${port}`)
})

module.exports = app