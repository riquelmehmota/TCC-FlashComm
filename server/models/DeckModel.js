
module.exports = (sequelize, Sequelize) => {
    const Deck = sequelize.define('deck', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: Sequelize.STRING
        },
        num_cards: {
            type: Sequelize.STRING,
            defaultValue: 0
        },
        
        
    },{
        timestamps: false
    });
    return Deck;
};