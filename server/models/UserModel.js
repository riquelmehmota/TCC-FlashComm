
module.exports = (sequelize, Sequelize) => {
    const User = sequelize.define('user', {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        username: {
            type: Sequelize.STRING
        },
        email: {
            type: Sequelize.STRING
        },
        password: {
            type: Sequelize.STRING
        },
        streak: {
            type: Sequelize.INTEGER
        },
        profile_image: {
            type: Sequelize.BLOB
        }, 
        
    },{
        timestamps: false
    });
    return User;
};