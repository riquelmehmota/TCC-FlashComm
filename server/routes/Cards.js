const route = require('express').Router();
const Cards = require('../controllers/Card');

//CRUD
route.post('/create/:deckid', Cards.create);
route.get('/getall/:deckid', Cards.get_all);
route.get('/get/:id', Cards.getbyID);
route.put('/update/:id', Cards.update);
route.delete('/delete/:id', Cards.remove);

module.exports = route;