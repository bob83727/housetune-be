const express = require('express');
const router = express.Router();
const pool = require('../utils/db');

// 賣家中心(商品)
router.post('/usedproduct', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT used_product.*, category_room.name AS category_name FROM used_product JOIN category_room ON used_product.category_room = category_room.id WHERE seller_id = ?' ,[req.body.id]
  );
  res.json(data);
});
// 上下架
router.put('/usedproduct', async (req, res) => {
  let results = await pool.query(
    'Update used_product SET valid = ? WHERE useP_id = ?',
    [req.body.valid, req.body.id]
  );
  res.json({ result: 'ok' });
});

// 賣家中心(訂單)
// let res= SELECT * FROM order_list where user_id = 使用者id ,[ordL_id] => order_detail [product_id]
// 要join product => img
router.get('/salesorder/detail', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT order_detail.*, used_product.name, used_product.img, used_product.price FROM order_detail JOIN used_product ON used_product_id = useP_id'
  );
  res.json(data);
});

router.post('/salesorder/all', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT order_list.*, user.account AS buyer_account FROM order_list JOIN user ON buyer_id = user_id WHERE seller_id = ?' ,[req.body.id]
  );
  res.json(data);
});
router.post('/salesorder/unpaid', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT order_list.*, order_list.OrdL_id FROM order_list WHERE state = 1 AND seller_id = ?' ,[req.body.id]
  );
  res.json(data);
});
router.post('/salesorder/toship', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT order_list.*, order_list.OrdL_id FROM order_list WHERE state = 2 AND seller_id = ?' ,[req.body.id]
  );
  res.json(data);
});
router.post('/salesorder/completed', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT order_list.*, order_list.OrdL_id FROM order_list WHERE state = 3 AND seller_id = ?' ,[req.body.id]
  );
  res.json(data);
});
router.post('/salesorder/cancelled', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT order_list.*, order_list.OrdL_id FROM order_list WHERE state = 4 AND seller_id = ?' ,[req.body.id]
  );
  res.json(data);
});

// 個人賣場
router.get('/userproduct', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT used_product.*, user.account, user.rating FROM used_product JOIN user ON used_product.seller_id = user_id WHERE  used_product.valid = 1'
  );
  res.json(data);
});

router.get('/:userAcct', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT user.* FROM user WHERE user.account = ?',
    [req.params.userAcct]
  );
  res.json(data);
});

module.exports = router;
