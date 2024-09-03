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
db.subject = require('./SubjectModel')(sequelize, Sequelize);
db.turma = require('./TurmaModel')(sequelize, Sequelize);

// Card belongs to Deck
db.deck.hasMany(db.card, { foreignKey: 'deck_id', onDelete: 'CASCADE' });
db.card.belongsTo(db.deck, { foreignKey: 'deck_id' });

// Deck belongs to Turma
db.turma.hasMany(db.deck, { foreignKey: 'turma_id' });
db.deck.belongsTo(db.turma, { foreignKey: 'turma_id' });

// Turma belongs to User and User belongs to Turma
db.turma.belongsToMany(db.user, { through: 'turma_user', as: 'turmas', foreignKey: 'user_id' });
db.user.belongsToMany(db.turma, { through: 'turma_user', as: 'users', foreignKey: 'turma_id' });

// Deck belongs to Subject and Subject has many Decks
db.deck.belongsTo(db.subject, { foreignKey: 'subject_id' });
db.subject.hasMany(db.deck, { foreignKey: 'subject_id' });

// Deck belongs to User and User has many Decks
db.deck.belongsTo(db.user, { foreignKey: 'user_id' });
db.user.hasMany(db.deck, { foreignKey: 'user_id' });

module.exports = db;