'use strict'

const mongoose = require('mongoose')
const Schema = mongoose.Schema
// const _ = require('lodash')

const ProductSchema = new Schema({
    title: { type: String, required: true },
    price: { type: Number, required: true },
    description: { type: String, required: true },
    image: { type: String, required: true },
    isFavorite: { type: Boolean, required: true },
    isDeleted: { type: Boolean, default: false },
    updatedAt: { type: Date, default: Date.now },
    createdAt: { type: Date, default: Date.now }
})

ProductSchema.pre('findOneAndUpdate', async function () {
    this.set({ updatedAt: new Date() })
})

module.exports = mongoose.model('products', ProductSchema, 'Products')