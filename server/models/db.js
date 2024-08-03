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
db.deck.hasMany(db.card, { foreignKey: 'deck_id' });
db.card.belongsTo(db.deck, { foreignKey: 'deck_id' });
db.turma.hasMany(db.deck, { foreignKey: 'user_id' });
db.turma.belongsToMany(db.user, { through: 'turma_user', as: 'turmas', foreignKey: 'user_id' });
db.user.belongsToMany(db.turma, { through: 'turma_user', as: 'users', foreignKey: 'turma_id' });
db.deck.belongsTo(db.subject, { foreignKey: 'subject_id' });
db.subject.hasMany(db.deck, { foreignKey: 'subject_id' });

module.exports = db;