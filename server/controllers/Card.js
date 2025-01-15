const db = require('../models/db');
const Card = db.card;

function get_all(req, res) {
    Card.findAll({
        where: {deck_id: req.params.deckid}
    }).then(cards => {
        res.send(cards);
    });
}

function getbyID(req, res) {
    Card.findOne({
        where: {
            id: req.params.id
        }
    }).then(card => {
        res.send(card);
    });
}

function create(req, res) {
    Card.create({
        name: req.body.name,
        cards: req.body.cards,
        deck_id: req.params.deckid
    },{
        include: [{
            association: 'deck'
        }]
    }).then(card => {
        res.send('success');
    });
}

function update(req, res) {
    Card.update({
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
    Card.destroy({
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


