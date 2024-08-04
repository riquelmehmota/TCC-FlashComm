/*Desc: Middleware for authentication. This is where the passport-local strategy is defined. 
The serializeUser and deserializeUser functions are also defined here. The serializeUser function 
is used to store the user's id and username in the session. The deserializeUser function is used to 
retrieve the user's information from the session. The verify function is used to check if the user's 
username and password are correct. If the user's username and password are correct, the user's 
information is stored in the session. If the user's username and password are incorrect, an error 
message is returned. The authenticate function is used to authenticate the user using the 
passport-local strategy. The successMessage and failureMessage options are used to return a 
success message or a failure message when the user is authenticated. The logout function is used to 
log the user out of the session. If the user is successfully logged out, a success message is returned. 
If there is an error logging the user out, an error message is returned.
*/
var LocalStrategy = require('passport-local').Strategy;
var crypto = require('crypto');
var db = require('./models/db');


function initialize(passport) {
    const authenticateuser = async (email, password, done) => {
        const user = await db.user.findOne({ where: { email: email } });
        if (user == null) {
            return done(null, false, { message: 'No user with that email' });
        }
       
        const hashedPassword = crypto.pbkdf2Sync(password, user.salt, 310000, 32, 'sha256').toString('hex');
        if (user.password !== hashedPassword) {
            return done(null, false, { message: 'Incorrect username or password.' });
        }
        return done(null, user);
    
    }
    passport.use(new LocalStrategy({usernameField: 'email'}, authenticateuser));

    passport.serializeUser(function(user, done) {
        done(null, user.id);
    });
    passport.deserializeUser(async (id, done) => {
        try {
            const user = await db.user.findByPk(id);
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