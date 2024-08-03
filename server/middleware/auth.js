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
        crypto.pbkdf2(password, user.salt, 310000, 32, 'sha256', function(err, key) {
            if (err) { return cb(err); }
            if (!crypto.timingSafeEqual(row.hashed_password, hashedPassword)) {
                return cb(null, false, { message: 'Incorrect username or password.' });
            }
            return cb(null, row);
        });
    });
}));

passport.serializeUser(function(user, cb) {
    process.nextTick(function() {
      cb(null, { id: user.id, username: user.username });
    });
});
  
passport.deserializeUser(function(user, cb) {
    process.nextTick(function() {
        return cb(null, user);
    });
});

module.exports = passport;





