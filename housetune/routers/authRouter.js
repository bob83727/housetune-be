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
  body('password').isLength({ min: 6 }).withMessage('密碼長度至少為6'),
  //中間件：檢查password和confirmPassword是否一致
  //客製自己想要的檢查條件
  body('rePassword')
    .custom((value, { req }) => {
      return value === req.body.password;
    })
    .withMessage('驗證密碼不符合'),
];

router.post('/register', registerRules, async (req, res, next) => {
  const validateResult = validationResult(req);
  console.log(validateResult);
  //errors陣列是空的代表ok
  if (!validateResult.isEmpty()) {
    return res.status(400).json({ errors: validateResult.array() });
  }
  //檢查email和帳號是否已存在
  let [members1] = await pool.execute('SELECT * FROM user WHERE email = ?', [
    req.body.email,
  ]);
  let [members2] = await pool.execute('SELECT * FROM user WHERE account = ?', [
    req.body.account,
  ]);
  //有代表重複註冊
  if (members1.length > 0) {
    return res.status(400).json({
      errors: [
        {
          msg: 'email已經註冊過',
          param: 'email',
        },
      ],
    });
  }

  if (members2.length > 0) {
    return res.status(400).json({
      errors: [
        {
          msg: '此帳號已有用戶使用，請更換',
          param: 'account',
        },
      ],
    });
  }
  //沒有就可以進到下一步＝>hash雜湊密
  const hashedPassword = await argon2.hash(req.body.password);
  //寫入資料庫
  const fullAddress = req.body.address1 + req.body.address2 + req.body.address3;
  let today = new Date();
  let now =
    today.getFullYear() +
    '-' +
    today.getMonth() +
    1 +
    '-' +
    today.getDate() +
    ' ' +
    today.getHours() +
    ':' +
    today.getMinutes() +
    ':' +
    today.getSeconds();

  let result = await pool.execute(
    'INSERT INTO user (account, password, name, phone, email, address, bank_code, bank_account, rating, created_at, last_modified, valid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
    [
      req.body.account,
      hashedPassword,
      req.body.name,
      req.body.phone,
      req.body.email,
      fullAddress,
      req.body.bankcode,
      req.body.bankaccount,
      0.0,
      now,
      now,
      1,
    ]
  );
  console.log(result);
  res.send('註冊成功！將自動導入登錄頁面');
});

router.post('/login', async (req, res, next) => {
  //接收到資料後跟資料庫做比對
  console.log(req.body.account);
  let [members] = await pool.execute('SELECT * FROM user WHERE account = ?', [
    req.body.account,
  ]);
  //陣列長度為0代表沒有這個會員
  console.log(members);
  if (members.length === 0) {
    return res.status(400).json({
      errors: [
        {
          msg: '帳號或密碼錯誤',
        },
      ],
    });
  }
  console.log('hello');
  //第二步比對密碼
  let member = members[0];
  let result = await argon2.verify(member.password, req.body.password);
  console.log(result);
  if (result === false) {
    return res.status(400).json({
      errors: [
        {
          msg: '帳號或密碼錯誤',
        },
      ],
    });
  }
  if (member.valid !== 1) {
    return res.status(200).json({
      errors: [
        {
          msg: '此用戶已遭停權，請與客服聯繫',
        },
      ],
    });
  }
  //到這裡即為真實存在之用戶=>開始處理session
  //要寫進session的內容
  let retMember = {
    id: member.user_id,
    account: member.account,
    name: member.name,
    phone: member.phone,
    email: member.email,
    address: member.address,
    bankcode: member.bank_code,
    bankaccount: member.bank_account,
    liked: member.liked,
    cart: member.cart,
    validcoupons: member.valid_coupons,
    invalidcoupons: member.invalid_coupons,
    rating: member.rating,
    createdat: member.created_at,
  };
  //寫進session
  req.session.member = retMember;
  res.json({
    msg: '登入成功',
    member: retMember,
  });
});

router.get('/forgot', async (req, res, next) => {
  let [data] = await pool.execute('SELECT user.name FROM user WHERE email=?', [
    req.query.toEmail,
  ]);
  res.json(data);
});

router.get('/member', (req, res, next) => {
  if (req.session.member) {
    res.json({
      loggedIn: true,
      userInfo: req.session.member,
    });
  } else {
    res.json({
      loggedIn: false,
    });
  }
});

router.post('/logout', (req, res, next) => {
  req.session.member = null;
  res.json({
    msg: '登出成功',
  });
});

module.exports = router;
