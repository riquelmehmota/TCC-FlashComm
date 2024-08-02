module.exports = (sequelize, Sequelize) => {
    const Card = sequelize.define('card', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        front: {
            type: Sequelize.STRING
        },
        back: {
            type: Sequelize.STRING
        },
        deck_id: {
            type: Sequelize.INTEGER
        },
        
    },{
        timestamps: false
    });
    return Card;
};