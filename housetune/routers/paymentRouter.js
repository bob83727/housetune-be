const express = require('express')
const router = express.Router()
const pool = require('../utils/db')

const now = new Date()
// console.log(now)
router.post('/', async (req, res, next) => {
  console.log('POST/api/payment', req.body.orderMsg)
  // INSERT order_list & order_detail
  let result = await pool.query(
    'INSERT INTO order_list (user_id,price,address,state,note,order_date,valid) VALUES (?,?,?,?,?,?,?);',
    [
      req.body.orderMsg.userId,
      req.body.orderMsg.price,
      req.body.orderMsg.address,
      req.body.orderMsg.state,
      req.body.orderMsg.note,
      now,
      1,
    ]
  )
  let productData = { ...req.body.orderMsg.products }
  let result2 = await pool.query(
    'INSERT INTO order_detail (order_list_id,product_id) VALUES (?,?);',
    [result[0].insertId, JSON.stringify(productData)]
  )
  console.log('result', result)
  console.log('result2', result2)
  res.json('新增成功')
})

module.exports = router
