
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
        streak: {
            type: Sequelize.INTEGER(1000),
            
        },
        profile_image: {
            type: Sequelize.BLOB('long')
        }, 
        
    },{
        timestamps: false
    });
    return User;
};