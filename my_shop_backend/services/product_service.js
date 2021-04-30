'use strict'

const ProductModel = require('../models/products')

exports.getProducts = async (page, limit) => {
    try {
        return await ProductModel.find()
    } catch (e) {
        throw Error(`Error while paginating Products!!`)
    }
}

exports.createProduct = async (query) => {
    try {
        return await new ProductModel(query).save()
    } catch (e) {
        throw Error(`Error while creating a Product!!`)
    }
}

exports.updateProduct = async (query, data) => {
    try {
        await ProductModel.findByIdAndUpdate(query, data)
    } catch (e) {
        throw Error(`Error while deleting a Product!!`)
    }
}

exports.deleteProduct = async (query) => {
    try {
        await ProductModel.findByIdAndUpdate(query, { isDeleted: true })
    } catch (e) {
        throw Error(`Error while deleting a Product!!`)
    }
}