const express = require('express')
const router = express.Router()
const pool = require('../utils/db')

const now = new Date()
// console.log(now)
router.post('/', async (req, res, next) => {
  console.log('POST/api/payment', req.body.orderMsg)
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
  console.log(result)
  res.json('新增成功')
})

module.exports = router
