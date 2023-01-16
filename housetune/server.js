const express = require('express')
const app = express()
require('dotenv').config()
const pool = require('./utils/db')

const cors = require('cors')
app.use(
  cors({
    origin: ['http://localhost:3000'],
    credentials: true,
  })
)
app.use(express.json())

const expressSession = require('express-session')
const FileStore = require('session-file-store')(expressSession)
const path = require('path')
app.use(
  expressSession({
    store: new FileStore({ path: path.join(__dirname, '..', 'sessions') }),
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
  })
)

app.get('/', (req, res, next) => {
  console.log('首頁')
  res.send('test')
})

// 使用 pool 方法
// inspiration
app.get('/api/list', async (req, res, next) => {
  let [data] = await pool.query('SELECT * FROM inspiration')
  res.json(data)
})

// slider 資料，新品推薦
app.get('/NewArrival', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT product.*, category_room.name AS category_name FROM product JOIN category_room ON product.category_room = category_room.id WHERE valid = 1 order by prod_id DESC limit 10'
  )
  res.json(data)
})

// slider 資料，相關商品推薦
app.get('/Category/:categoryRoom/:prodId', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT product.*, category_room.name AS category_name FROM product JOIN category_room ON product.category_room = category_room.id WHERE valid = 1 AND category_room=? AND prod_id != ? AND amount > 0 limit 10',
    [req.params.categoryRoom, req.params.prodId]
  )
  res.json(data)
})

// 商品列表
app.get('/products', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT product.*, category_room.name AS category_name FROM product JOIN category_room ON product.category_room = category_room.id WHERE valid = 1 limit 10'
  )
  res.json(data)
})

// 商品細節頁
app.get('/products/:prodId', async (req, res, next) => {
  let [data] = await pool.execute(
    'SELECT product.*, category_room.name AS category_name FROM product JOIN category_room ON product.category_room = category_room.id WHERE prod_id=?',
    [req.params.prodId]
  )
  res.json(data)
})

app.use((req, res, next) => {
  console.log('這裡是 404')
  res.send('404 not found')
})

app.listen(3001, () => {
  console.log('Server running at port 3001')
})
