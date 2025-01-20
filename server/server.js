require('dotenv').config();
const express = require('express');
const app = express();
const db = require('./models/db');
const Users = require('./routes/Users');
const Decks = require('./routes/Decks');
const Cards = require('./routes/Cards');
const cors = require('cors');

// authentication imports
const passport = require('passport');
const session = require('express-session');
const MySQLStore = require('express-mysql-session')(session);
const initializePassport = require('./passport_config');


db.sequelize.sync({ force: true }).then(() => {
    console.log('Drop and re-sync db.');
});

app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({ limit: '50mb', extended: true }));
app.use(cors());

//Authentication settings
initializePassport(passport);
app.use(session({
    secret: 'keyboard',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore({
        database: process.env.DB_NAME,
        user: process.env.DB_USERNAME,
        password: process.env.DB_PASSWORD,
        host: 'localhost',
        port: 3306,
    })
}));


app.use(passport.authenticate('session'));


app.use('/users', Users);
app.use('/decks', Decks);
app.use('/cards', Cards);

app.post('/login', passport.authenticate('local', {
    successMessage: 'Logged in',
    failureMessage: 'Failed to log in',
}), (req, res) => {
    if (req.isAuthenticated()) {
        res.send(req.user)
    }
    res.send(req.message);
    
});


app.post('/logout', (req, res, next) => {
    req.logout((err) => {
        if (err) {
            return next(err);
        }
        res.send('Logged out');
    }); 
});

app.get('/image', (req, res) => {
    if (req.isAuthenticated()) {

        db.user.findOne({ where: { id: req.user.id } }).then(user => {
            if (user) {
                res.sendFile(__dirname + '/assets/img/' + user.profile_image);
            } else {
                res.send('User not found');
            }
        }).catch(err => {
            res.send('Error: ' + err.message);
        });
       
    }
    else {
        res.send('Not authenticated');
    }
   
})



app.listen(3000, () => {
    console.log('Server is running on port 3000');
});