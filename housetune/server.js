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
  })
);

app.get('/', (req, res, next) => {
  console.log('首頁');
  res.send('test');
});

//使用pool方法
app.get('/api/list', async (req, res, next) => {
  
  let [data] = await pool.query('SELECT * FROM inspiration');
  res.json(data);
});

app.use((req, res, next) => {
  console.log('這裡是 404');
  res.send('404 not found');
});

app.listen(3002, () => {
  console.log('Server running at port 3002');
});
