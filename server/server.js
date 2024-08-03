const express = require('express');
const app = express();
const express_json = require('express-json');
const db = require('./models/db');
const Users = require('./routes/Users');
const Decks = require('./routes/Decks');
const Cards = require('./routes/Cards');
const cors = require('cors');
var logger = require('morgan');
var passport = require('passport');
var session = require('express-session');

const session = require('express-session');

const MySQLStore = require('express-mysql-session')(session);


db.sequelize.sync({ force: true }).then(() => {
    console.log('Drop and re-sync db.');
});

app.use(session({
    secret: 'keyboard',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore({
        db: 'tcc',
        host: 'localhost',
        port: 3306,
    })
}));

app.use(passport.authenticate('session'));


app.use(express_json());
app.use(cors());


app.use('/users', Users);
app.use('/decks', Decks);
app.use('/cards', Cards);


app.listen(3000, () => {
    console.log('Server is running on port 3000');
});