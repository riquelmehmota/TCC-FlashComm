
module.exports = (sequelize, Sequelize) => {
    const Deck = sequelize.define('deck', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: Sequelize.STRING,
            allowNull: false
        },
        num_cards: {
            type: Sequelize.STRING,
            defaultValue: 0,
        },
        description: {
            type: Sequelize.STRING,
        },
        
        
        
    },{
        timestamps: false
    });
    return Deck;
};