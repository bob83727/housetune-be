const express = require('express')
const router = express.Router()
const pool = require('../utils/db')

router.get('/usedproducts', async (req, res) => {
    let results = await pool.query('SELECT u.useP_id, u.seller_id,u.category_product,u.amount,u.description,u.price,u.img,u.bought_in,u.style,u.updated_at,u.valid,u.name AS product_name ,user.user_id, user.cart, user.name, user.liked,user.rating FROM used_product AS u LEFT JOIN user on u.seller_id = user.user_id ')
    let data = results[0]; 
    res.json(data)
    })

module.exports = router