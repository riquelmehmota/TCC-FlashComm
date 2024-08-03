module.exports = (sequelize, Sequelize) => {
    const Card = sequelize.define('card', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        front: {
            type: Sequelize.STRING,
            allowNull: false
        },
        back: {
            type: Sequelize.STRING,
            allowNull: false
        },
        deck_id: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
        interval: {
            type: Sequelize.DATE
        },
    },{
        timestamps: false
    });
    return Card;
};