
module.exports = (sequelize, Sequelize) => {
    Turma = sequelize.define('turma', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: Sequelize.STRING
        },
        
    },{
        timestamps: false
    });
    return Turma;
};