const express = require('express')
const router = express.Router()
const pool = require('../utils/db')

const now = new Date()
// console.log(now)
router.post('/', async (req, res, next) => {
  try {
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
    // console.log('result', result)
    // console.log('result2', result2)
    res.json('新增成功')
  } catch (err) {
    res.json('新增失敗', err)
  }
})
// 訂單新增後取得該訂單編號
router.get('/checkorder', async (req, res, next) => {
  // 拿到該使用者的訂單
  console.log('POST/api/payment/checkorder', req.session.member.id)
  let [result] = await pool.query(
    'SELECT * FROM order_list WHERE user_id =? ORDER BY ordL_id DESC LIMIT 0 , 1;',
    [req.session.member.id]
  )
  res.json(result[0].ordL_id)
})

module.exports = router
