const express = require('express');
const argon2 = require('argon2');
const router = express.Router();
const { body, validationResult } = require('express-validator');
const pool = require('../utils/db');

//先設定好檢查各項資料的規則
const registerRules = [
    //中間件 負責檢查email是否合法
    body('email').isEmail().withMessage('請輸入正確格式的email'),
    //中間件 檢查密碼的長度
    body('password').isLength({ min: 8 }).withMessage('密碼長度至少為8'),
    //中間件：檢查password和confirmPassword是否一致
    //客製自己想要的檢查條件
    body('rePassword')
      .custom((value, { req }) => {
        return value === req.body.password;
      })
      .withMessage('驗證密碼不符合'),
  ];

  router.post('/register', registerRules, async (req, res, next)=>{
    const validateResult = validationResult(req);
    console.log(validateResult);
    //errors陣列是空的代表ok
    if(!validateResult.isEmpty()){
        return res.status(400).json({ errors: validateResult.array() });
    }
    //檢查email是否已存在
    let [members] = await pool.execute(
        'SELECT * FROM user WHERE email = ?',
        [req.body.email]
      );
    //有代表重複註冊
    if (members.length > 0) {
        return res.status(200).json({
          errors: [
            {
              msg: 'email已經註冊過',
              param: 'email',
            },
          ],
        });
      }
    //沒有就可以進到下一步＝>hash雜湊密
    const hashedPassword = await argon2.hash(req.body.password);
    //寫入資料庫
    const fullAddress = req.body.address1 + req.body.address2 + req.body.address3
    let today=new Date()
    let now = today.getFullYear() + "-" + today.getMonth()+1 + "-" + today.getDate() + " " + today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            
    let result = await pool.execute(
        'INSERT INTO user (account, password, name, phone, email, address, bank_code, bank_account, rating, created_at, last_modified, valid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [req.body.account, hashedPassword, req.body.name, req.body.phone, req.body.email, fullAddress, req.body.bankcode, req.body.bankaccount, 0.0, now, now, 1]
      );
    console.log(result);
    res.send("註冊成功！將自動導入登錄頁面")
  })
    








module.exports =router