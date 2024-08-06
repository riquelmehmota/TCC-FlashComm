const route = require('express').Router();
const Decks = require('../controllers/Decks');

//CRUD
route.post('/create', Decks.create);
route.get('/', Decks.get_all);
route.get('/:id', Decks.getbyID);
route.put('/update/:id', Decks.update);
route.delete('/delete/:id', Decks.remove);

module.exports = route;