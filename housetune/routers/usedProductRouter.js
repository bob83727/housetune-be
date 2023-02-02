const express = require('express')
const router = express.Router()
const { body , validationResult } = require('express-validator')
const pool = require('../utils/db')


// 二手商品 新增
const multer = require('multer')
const path = require('path')

// 設定圖片儲存位置
const storageImg = multer.diskStorage({
  // 設定目的地 -> public/upload
  destination: function(req, file, cb){
    cb(null, path.join(__dirname, '..', 'public', 'uploads'))
  },
  filename: function(req, file, cb){
    const ext = file.originalname.split('.').pop()
    cb(null, `${Date.now()}.${ext}`)
  }
})
const uploadImg = multer({
  storage: storageImg,
  // 圖片格式 validation
  fileFilter: function(req, file, cb){
    if(file.mimetype !== 'image/jpeg' && file.mimetype !== 'image/jpg' && file.mimetype !== 'image/png'){
       cb(new Error('上傳圖片檔案格式錯誤'), false)
    } else{
      cb(null, true)
    }
  },
  limits:{
    fileSize: 200 * 1024, // 204800
  }
})

// 驗證資料
const addRules = [
    body('name').isLength({ min:2 }).withMessage('產品名稱最少為兩個字或一種類別名稱'),
    body('categoryRoom').isLength({ min:1 }).withMessage('請選擇房間類別'),
    body('categoryProduct').isLength({ min:1 }).withMessage('請選擇產品類別'),
    body('description').isLength({ min:10 }).withMessage('產品描述最少為10個字'),
    body('originalPrice').isLength({ min:1 }).withMessage('請輸入原價'),
    body('price').isLength({ min:1 }).withMessage('請輸入售價'),
    body('amount').isLength({ min:1 }).withMessage('商品數量不得為0'),
]

// /api/auth
router.post('/usedproduct/add',uploadImg.single('img'), addRules, async (req , res , next)=>{
  console.log('POST /usedproduct/add', req.body, req.file);

  // 輸出驗證結果
  const addResult = validationResult(req);
  console.log(addResult);
  if(!addResult.isEmpty()){
    return res.status(400).json({ errors: addResult.array() })
  }

  let today=new Date()
  let now = today.getFullYear() + "-" + today.getMonth()+1 + "-" + today.getDate() + " " + today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();

  const filename = req.file ? path.join('uploads', req.file.filename) : '';

 // 寫進資料庫
  let result = await pool.execute('INSERT INTO used_product (name, category_room, category_product, amount, description, original_price, price, img, bought_in, created_at, updated_at, valid, seller_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [req.body.name, req.body.categoryRoom, req.body.categoryProduct, req.body.amount, req.body.description, req.body.originalPrice, req.body.price, filename, req.body.boughtIn, now, now, req.body.valid, req.body.id]);
  console.log(result);
  res.send('新增商品成功')
});

// 編輯-撈資料
router.get('/usedproduct/edit/:useP_id', async (req, res, next) => {
  let response = await pool.execute('SELECT * FROM used_product WHERE useP_id =?',[req.params.useP_id])
  // console.log(req.params.useP_id);
  // console.log(response[0])
  res.status(200).send(response[0])
})
// 撈資料測試
router.get('/usedproduct', async (req, res , next) => {
  let [data] = await pool.execute('SELECT * FROM used_product')
  res.json(data)
})

module.exports = router