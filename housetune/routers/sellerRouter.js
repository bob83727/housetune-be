const express = require('express');
const router = express.Router();
const pool = require('../utils/db');

// 賣家中心(商品)
router.post('/usedproduct', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT used_product.*, category_room.name AS category_name FROM used_product JOIN category_room ON used_product.category_room = category_room.id WHERE seller_id = ?',
    [req.body.id]
  );
  res.json(data);
});
// 上下架
router.put('/valid', async (req, res) => {
  let results = await pool.query(
    'UPDATE used_product SET valid = ? WHERE useP_id = ?',
    [req.body.valid, req.body.id]
  );
  let [data] = await pool.execute(
    'SELECT used_product.*, category_room.name AS category_name FROM used_product JOIN category_room ON used_product.category_room = category_room.id WHERE seller_id = ?',
    [req.body.user_id]
  );
  res.json(data);
});
//刪除
router.post('/delete', async (req, res) => {
  let results = await pool.query('DELETE FROM used_product WHERE useP_id = ?', [
    req.body.id,
  ]);
  let [data] = await pool.execute(
    'SELECT used_product.*, category_room.name AS category_name FROM used_product JOIN category_room ON used_product.category_room = category_room.id WHERE seller_id = ?',
    [req.body.user_id]
  );
  res.json(data);
});

// 賣家中心(訂單)
router.post('/order/all', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT order_list.*, order_detail.product_id, user.account ,user.user_id as buyer_id FROM order_list JOIN user ON order_list.user_id = user.user_id JOIN order_detail ON order_list_id = ordL_id WHERE seller_id = ?',[req.body.id]
  );
  res.json(data);
});
// router.post('/salesorder/unpaid', async (req, res, next) => {
//   let [data] = await pool.execute(
//     'SELECT order_list.*, order_list.OrdL_id FROM order_list WHERE state = 1 AND seller_id = ?' ,[req.body.id]
//   );
//   res.json(data);
// });
// router.post('/salesorder/toship', async (req, res, next) => {
//   let [data] = await pool.execute(
//     'SELECT order_list.*, order_list.OrdL_id FROM order_list WHERE state = 2 AND seller_id = ?' ,[req.body.id]
//   );
//   res.json(data);
// });
// router.post('/salesorder/completed', async (req, res, next) => {
//   let [data] = await pool.execute(
//     'SELECT order_list.*, order_list.OrdL_id FROM order_list WHERE state = 3 AND seller_id = ?' ,[req.body.id]
//   );
//   res.json(data);
// });
// router.post('/salesorder/cancelled', async (req, res, next) => {
//   let [data] = await pool.execute(
//     'SELECT order_list.*, order_list.OrdL_id FROM order_list WHERE state = 4 AND seller_id = ?' ,[req.body.id]
//   );
//   res.json(data);
// });

// 個人賣場
router.get('/:userAcct', async (req, res, next) => {
  let [rating] = await pool.execute(
    'SELECT user_rating.*, used_product.seller_id, used_product.img, used_product.name, user.user_id, user.account, user.valid FROM user_rating JOIN used_product ON user_rating.product_id = used_product.useP_id JOIN user ON used_product.seller_id = user.user_id WHERE user.valid = 1 AND user.account = ?;',
    [req.params.userAcct]
  );
  let [data] = await pool.execute(
    'SELECT used_product.* FROM used_product JOIN user ON used_product.seller_id = user_id WHERE user.valid=1 AND used_product.valid = 1 AND user.account = ?',
    [req.params.userAcct]
  );
  res.json({ rating, data });
});

module.exports = router;


