
const db = require('../models/db');
const crypto = require('crypto');
const User = db.user;


async function get_all(req, res) {
  await User.findAll({include: 'turma'}).then(users => {
    res.send(users);
  });
}

async function getbyID(req, res) {
  await User.findOne({
    where: {
      id: req.params.id
    }
  }).then(user => {
    res.send(user);
  });
}

async function register(req, res) {
  const salt = crypto.randomBytes(16).toString('hex');
  const hashedPassword = crypto.pbkdf2Sync(req.body.password, salt, 310000, 32, 'sha256').toString('hex');

  await User.create({
    username: req.body.username,
    email: req.body.email,
    salt: salt,
    password: hashedPassword,
  }).then((err,User) => {
    
    if (err) {return res.status(500).send("There was a problem registering the user.")}
    var user = {
      id: User.id,
      username: req.body.username
    };

    req.login(user, function(err) {
      if (err) { return next(err); }
      res.send('success');
    });
  });
}

async function update(req, res) {
  const user = await User.findOne({where: {id: req.params.id} })
  User.username = req.body.username || User.username,
  User.email = req.body.email || User.email,
  User.password = req.body.password || User.password,
  User.permission = req.body.permission || User.permission,
  User.streak = req.body.streak || User.streak,
  User.profile_image = req.body.profile_image || User.profile_image
  await User.save().then(() => {
    res.send('success');
  });
  
}

function remove(req, res) {
  User.destroy({
    where: {
      id: req.params.id
    }
  }).then(() => {
    res.send('success');
  });
}

module.exports = {
    get_all,
    getbyID,
    register,
    update,
    remove
}