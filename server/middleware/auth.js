// Desc: Middleware for authentication
var passport = require('passport');
var LocalStrategy = require('passport-local');
var crypto = require('crypto');
var db = require('../models/db');

passport.use(new LocalStrategy (function verify(username, password,cd) {
    db.user.findOne({ where: { username: username } }).then(user => {
        if (!user) {
            return cd(null, false);
        }
        
    });
}));
