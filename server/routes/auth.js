const express = require('express');
const Middleware = require('../middleware/auth');
const router = express.Router();

router.post('/login', Middleware.authenticate('local'), (req, res) => {
    res.json(req.user);
})



module.exports = router;