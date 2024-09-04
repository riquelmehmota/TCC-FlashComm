
module.exports = (sequelize, Sequelize) => {
    const User = sequelize.define('user', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        username: {
            type: Sequelize.STRING,
            allowNull: false
        },
        email: {
            type: Sequelize.STRING,
            allowNull: false
        },
        password: {
            type: Sequelize.STRING,
            allowNull: false
        },
        salt: {
            type: Sequelize.STRING,
            allowNull: false
        },
        streak: {
            type: Sequelize.INTEGER,
            defaultValue: 0
        },
        profile_image: {
            type: Sequelize.BLOB('long'),
            defaultValue: null
        },
        mimetype: {
            type: Sequelize.STRING,
            defaultValue: null
        }
        
    },{
        timestamps: false
    });
    return User;
};