
var LocalStrategy = require('passport-local').Strategy;
var crypto = require('crypto');
var db = require('./models/db');


function initialize(passport) {
    
    const authenticateuser = async (email, password, done) => {
        const user = await db.user.findOne({ where: { email: email } });
        if (user == null) {
            return done(null, { message: 'No user with that email' });
        }
       
        const hashedPassword = crypto.pbkdf2Sync(password, user.salt, 310000, 32, 'sha256').toString('hex');
        if (user.password !== hashedPassword) {
            return done(null, { message: 'Incorrect username or password.' });
        }
        return done(null, user);
    
    }

    passport.use(new LocalStrategy({usernameField: 'email'}, authenticateuser));

    passport.serializeUser(function(user, done) {
        done(null, {id: user.id, name: user.username});
    });
    
    passport.deserializeUser(async (id, done) => {
        try {
            const user = await db.user.findByPk(id.id);
            if (!user) {
                return done(new Error('User not found'));
            }
            done(null, user);
        } catch (error) {
            done(error);
        }
    });
}
module.exports = initialize;