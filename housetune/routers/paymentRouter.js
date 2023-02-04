const express = require('express')
const router = express.Router()
const pool = require('../utils/db')

const now = new Date()
router.post('/', async (req, res, next) => {
  try {
    console.log('POST/api/payment', req.body.orderMsg)
    // INSERT order_list & order_detail
    const Coupon_data = JSON.stringify(req.body.orderMsg.couponUse)
    let result = await pool.query(
      'INSERT INTO order_list (seller_id,user_id,price,couponInfo,shippingFee,address,state,note,order_date,valid) VALUES (1,?,?,?,?,?,?,?,?,?);',
      [
        req.body.orderMsg.userId, // user_id
        req.body.orderMsg.price, // price
        Coupon_data, // couponInfo
        req.body.orderMsg.shippingFee, // shippinigFee
        req.body.orderMsg.address, // address
        req.body.orderMsg.state, // state
        req.body.orderMsg.note, // note
        now, // order_date
        1, // valid
      ]
    )
    let productData = { ...req.body.orderMsg.products }
    let result2 = await pool.query(
      'INSERT INTO order_detail (order_list_id,product_id) VALUES (?,?);',
      [result[0].insertId, JSON.stringify(productData)]
    )
    console.log('result', result)
    // console.log('result2', result2)
    res.json(result)
  } catch (err) {
    console.log('failed', err)
    res.json('新增失敗')
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
