'use strict'

const ProductController = require('../controllers/product_controller')

const express = require('express')
const router = express.Router()

router.get('/:id', ProductController.getProducts)

router.post('/product', ProductController.createProducts)

router.patch('/product/:id', ProductController.updateProduct)

// DELETE request to /products/product/:id
router.delete('/product/:id', ProductController.deleteProduct)

module.exports = router