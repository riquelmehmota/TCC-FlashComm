const express = require('express');
const express_json = require('express-json');
const db = require('./models/db');
const Users = require('./routes/Users');
const Decks = require('./routes/Decks');
const Cards = require('./routes/Cards');
const cors = require('cors');


db.sequelize.sync({ force: true }).then(() => {
    console.log('Drop and re-sync db.');
});

const app = express();
app.use(express_json());
app.use(cors());


app.use('/users', Users);
app.use('/decks', Decks);
app.use('/cards', Cards);


app.listen(3000, () => {
    console.log('Server is running on port 3000');
});