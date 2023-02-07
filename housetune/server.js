const express = require('express');
const app = express();
require('dotenv').config();
const pool = require('./utils/db');

const cors = require('cors');
app.use(
  cors({
    origin: ['http://localhost:3000'],
    credentials: true,
  })
);
app.use(express.json());

const expressSession = require('express-session');
const FileStore = require('session-file-store')(expressSession);
const path = require('path');
app.use(
  expressSession({
    store: new FileStore({ path: path.join(__dirname, '..', 'sessions') }),
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
    cookie: { maxAge: 1000 * 60 * 60 * 24 },
    cookie: { maxAge: 1000 * 60 * 60 * 24 },
  })
)

const authRouter = require('./routers/authRouter')
app.use('/api/auth', authRouter)

const useCoupon = require('./routers/useCoupon')
app.use('/api/usecoupon', useCoupon)

// 成立訂單
const paymentRouter = require('./routers/paymentRouter')
app.use('/api/payment', paymentRouter)

app.get('/', (req, res, next) => {
  console.log('首頁')
  res.send('test')
})



// 使用 pool 方法
// inspiration
app.get('/api/list', async (req, res, next) => {
  let [data] = await pool.query('SELECT * FROM inspiration');
  res.json(data);
});

const productRouter = require('./routers/productRouter')
app.use('/api/products', productRouter)

const sellerRouter = require('./routers/sellerRouter')
app.use('/api/seller', sellerRouter)

const usedProduct = require('./routers/usedProductRouter')
app.use(usedProduct)

const usedPlatform = require('./routers/usedPlatformRouter')
app.use(usedPlatform)

app.use((req, res, next) => {
  console.log('這裡是 404');
  res.send('404 not found');
});

app.listen(3001, () => {
  console.log('Server running at port 3001');
});
