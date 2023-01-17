const express = require('express');
const router = express.Router();
const pool = require('../utils/db');

// 商品列表
router.get('/', async (req, res, next) => {
  // 條件設定資料抓取
  // 取得庫存
  let [resultInStock] = await pool.execute(
    'SELECT COUNT(*) AS total FROM product WHERE valid = 1 AND amount > 0'
  );
  let [resultOutStock] = await pool.execute(
    'SELECT COUNT(*) AS total FROM product WHERE valid = 1 AND amount = 0'
  );
  const inStock = resultInStock[0].total;
  const outStock = resultOutStock[0].total;
  // 取得分類數量
  const categoryAmount = [];
  for (let i = 1; i <= 10; i++) {
    let [result] = await pool.execute(
      `SELECT COUNT(*) AS total,category_product.id AS category_id FROM product JOIN category_product ON product.category_product = category_product.id WHERE valid = 1 AND category_product = ${i} ORDER BY id`
    );
    categoryAmount.push(result[0]);
  }
  let [category] = await pool.execute('SELECT * FROM category_product');

  // 頁數設定
  const page = req.query.page || 1;
  // 取得資料筆數
  let [result] = await pool.execute(
    'SELECT COUNT(*) AS total FROM product WHERE valid = 1'
  );
  const total = result[0].total;
  // 一頁20筆
  const perPage = 20;
  const totalPage = Math.ceil(total / perPage);
  const limit = perPage;
  const offset = perPage * (page - 1);
  let [data] = await pool.execute(
    'SELECT product.*, category_room.name AS categoryR_name,category_product.name AS categoryP_name FROM (product JOIN category_room ON product.category_room = category_room.id) JOIN category_product ON product.category_product = category_product.id WHERE valid = 1 ORDER BY prod_id Limit ? OFFSET ?',
    [limit, offset]
  );
  res.json({
    pagination: { total, perPage, totalPage, page },
    data,
    stock: { inStock, outStock },
    category,
    categoryAmount,
  });
});

// 商品列表(房間分類)
router.get('/category/:categoryRoom', async (req, res, next) => {
  // 條件設定資料抓取
  // 取得庫存
  let [resultInStock] = await pool.execute(
    'SELECT COUNT(*) AS total FROM product WHERE valid = 1 AND category_room=? AND amount > 0',
    [req.params.categoryRoom]
  );
  const inStock = resultInStock[0].total;
  let [resultOutStock] = await pool.execute(
    'SELECT COUNT(*) AS total FROM product WHERE valid = 1 AND category_room=? AND amount = 0',
    [req.params.categoryRoom]
  );
  const outStock = resultOutStock[0].total;
  // 取得分類數量
  const categoryAmount = [];
  for (let i = 1; i <= 10; i++) {
    let [result] = await pool.execute(
      `SELECT COUNT(*) AS total,category_product.id AS category_id FROM product JOIN category_product ON product.category_product = category_product.id WHERE valid = 1 AND category_room=? AND category_product = ${i} ORDER BY id`,
      [req.params.categoryRoom]
    );
    categoryAmount.push(result[0]);
  }
  let [category] = await pool.execute('SELECT * FROM category_product');

  // 頁數設定
  const page = req.query.page || 1;
  // 取得資料筆數
  let [result] = await pool.execute(
    'SELECT COUNT(*) AS total FROM product WHERE valid = 1 AND category_room=?',
    [req.params.categoryRoom]
  );
  const total = result[0].total;
  // 一頁20筆
  const perPage = 20;
  const totalPage = Math.ceil(total / perPage);
  const limit = perPage;
  const offset = perPage * (page - 1);
  let [data] = await pool.execute(
    'SELECT product.*, category_room.name AS categoryR_name,category_product.name AS categoryP_name FROM (product JOIN category_room ON product.category_room = category_room.id) JOIN category_product ON product.category_product = category_product.id WHERE valid = 1 AND category_room=? ORDER BY prod_id Limit ? OFFSET ?',
    [req.params.categoryRoom, limit, offset]
  );
  res.json({
    pagination: { total, perPage, totalPage, page },
    data,
    stock: { inStock, outStock },
    category,
    categoryAmount,
  });
});

// slider 資料，新品推薦
router.get('/newArrival', async (req, res, next) => {
  console.log('newArrival');
  let [data] = await pool.execute(
    'SELECT product.*, category_room.name AS category_name FROM product JOIN category_room ON product.category_room = category_room.id WHERE valid = 1 order by prod_id DESC limit 10'
  );
  res.json(data);
});

// 商品細節頁
router.get('/:prodId', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT product.*, category_room.name AS category_name FROM product JOIN category_room ON product.category_room = category_room.id WHERE prod_id=?',
    [req.params.prodId]
  );
  res.json(data);
});

// slider 資料，相關商品推薦
router.get('/:categoryRoom/:prodId', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT product.*, category_room.name AS category_name FROM product JOIN category_room ON product.category_room = category_room.id WHERE valid = 1 AND category_room=? AND prod_id != ? AND amount > 0 limit 10',
    [req.params.categoryRoom, req.params.prodId]
  );
  res.json(data);
});

module.exports = router;
