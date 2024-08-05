const { Association } = require('sequelize');
const db = require('../models/db');
const Deck = db.deck;

function get_all(req, res) {
    Deck.findAll({include: 'card'}).then(decks => {
        decks = JSON.parse(JSON.stringify(decks));
        res.send(decks);
    })
    
}

function getbyID(req, res) {
    Deck.findOne({
        where: {
            id: req.params.id
        }
    }).then(deck => {
        deck = deck.toJSON();
        res.send(deck);
    });
}

function create(req, res) {
    Deck.create({
        name: req.body.name,
        cards: [{
            front: req.body.front,
            back: req.body.back
        }]
    },
    {
        include: [{
            association: [db.card]
        }]
    }
).then(deck => {
        res.send('success');
    });
}

function update(req, res) {
    Deck.update({
        name: req.body.name,
        cards: req.body.cards
    }, {
        where: {
            id: req.params.id
        }
    }).then(() => {
        res.send('success');
    });
}

function remove(req, res) {
    Deck.destroy({
        where: {
            id: req.params.id
        }
    }).then(() => {
        res.send('success');
    });
}

module.exports = {
    get_all,
    getbyID,
    create,
    update,
    remove
}
  
  
