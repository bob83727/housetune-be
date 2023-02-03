const express = require('express');
const router = express.Router();
const pool = require('../utils/db');

router.post('/', async(req, res, next)=>{
    console.log("我要寫進資料庫", req.body);
    let result = await pool.execute('INSERT INTO chat_room (reciever_id, sender_id, timestamp, message, status) VALUES (?, ?, ?, ?, ?)', [req.body.recieverId, req.body.senderId, req.body.fulltime, req.body.message, 1])
    // console.log(result);
    res.sendStatus(200)
})
router.post('/get', async(req, res, next)=>{
    // console.log(req.body);
    let result = await pool.execute('SELECT * FROM chat_room WHERE ( reciever_id = ? AND sender_id = ?) OR ( sender_id = ? AND reciever_id = ?)', [req.body.userId, req.body.recieverId, req.body.userId, req.body.recieverId])
    console.log(result[0]);
    let messages=result[0]
    res.status(200).send(messages)
})
router.post('/switch', async(req, res, next)=>{
    let result = await pool.execute('SELECT * FROM user WHERE account = ?', [req.body.otherReciever])
    let reciever = result[0]
    res.status(200).send(reciever)
})



module.exports =router