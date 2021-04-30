'use strict'

const ProductService = require('../services/product_service')

exports.getProducts = async (req, res) => {
    try {
        let products = await ProductService.getProducts({ factory: req.params.id, isDeleted: false })
        return res.status(200).json({
            status: 200,
            message: 'Products Retrieved Succesfully!',
            data: products
        })
    } catch (e) {
        console.log(e.message)
        return res.status(400).json({
            status: 400,
            message: e.message
        })
    }
}

exports.createProducts = async (req, res) => {
    try {
        await ProductService.createProduct(req.body)
        return res.status(200).json({
            status: 200,
            message: 'Product Created Succesfully!'
        })
    } catch (e) {
        console.log(e.message)
        return res.status(400).json({
            status: 400,
            message: e.message
        })
    }
}

exports.updateProduct = async (req, res) => {
    try {
        await ProductService.updateProduct({ _id: req.params.id, isDeleted: false }, req.body)
        return res.status(200).json({
            status: 200,
            message: 'Product Updated Succesfully!'
        })
    } catch (e) {
        console.log(e.message)
        return res.status(400).json({
            status: 400,
            message: e.message
        })
    }
}


exports.deleteProduct = async (req, res) => {
    try {
        const data = { _id: req.params.id, isDeleted: false }
        await ProductService.deleteProduct(data)
        return res.status(200).json({
            status: 200,
            message: 'Product Deleted Succesfully!'
        })
    } catch (e) {
        console.log(e.message)
        return res.status(400).json({
            status: 400,
            message: e.message
        })
    }
}



