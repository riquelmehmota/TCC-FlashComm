const route = require('express').Router();
const Decks = require('../controllers/Decks');

//CRUD
route.post('/create', Decks.create);
route.get('/getall', Decks.get_all);
route.get('/get/:id', Decks.getbyID);
route.put('/update/:id', Decks.update);
route.delete('/delete/:id', Decks.remove);

module.exports = route;