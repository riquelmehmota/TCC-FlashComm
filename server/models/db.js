const Sequelize = require('sequelize');
require('dotenv').config();

// Create a new Sequelize instance
const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USERNAME, process.env.DB_PASSWORD, {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    dialect: 'mysql',
});

db = {};
db.Sequelize = Sequelize;
db.sequelize = sequelize;
db.user = require('./UserModel')(sequelize, Sequelize);
db.deck = require('./DeckModel')(sequelize, Sequelize);
db.card = require('./CardModel')(sequelize, Sequelize);
db.card.belongsTo(db.deck, { foreignKey: 'deck_id' });


module.exports = db;