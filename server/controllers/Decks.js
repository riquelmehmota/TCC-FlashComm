const { Association } = require('sequelize');
const db = require('../models/db');
const Deck = db.deck;

async function get_all(req, res) {
    await Deck.findAll({include: 'cards'}).then(decks => {
        decks = JSON.parse(JSON.stringify(decks));
        res.send(decks);
    })
    
}

async function getbyID(req, res) {
    await Deck.findOne({
        where: {
            id: req.params.id
        },
        include: 'cards'
    }).then(deck => {
        deck = JSON.parse(JSON.stringify(deck));
        res.send(deck);
    });
}

async function create(req, res) {
    let _cards = req.body.cards;
    let cardData = _cards.map(card => ({front: card.front, back: card.back}));
    await Deck.create({
        name: req.body.name,
        description: req.body.description,
        cards: cardData,
        num_cards: _cards.length
    },
    {
        include: [{
            association: 'cards'
        }]
    }
).then(deck => {
        res.send('success');
}).catch(err => {
    console.log(err);
    res.send('error');
});
}

async function update(req, res) {
    let _cards = req.body.cards;
    let cardData = _cards.map(card => ({front: card.front, back: card.back}));
    await Deck.update({
        name: req.body.name,
        cards: cardData,
        num_cards: _cards.length,
    }, {
        where: {
            id: req.params.id
        },
        include: [{
            association: 'cards'
        }]
    }).then(() => {
        res.send('success');
    });
}

async function remove(req, res) {
    await Deck.destroy({
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
  
  
