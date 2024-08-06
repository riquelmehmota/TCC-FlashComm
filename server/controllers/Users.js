
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

function register(req, res) {
  const salt = crypto.randomBytes(16).toString('hex');
  const hashedPassword = crypto.pbkdf2Sync(req.body.password, salt, 310000, 32, 'sha256').toString('hex');
  User.create({
    username: req.body.username,
    email: req.body.email,
    salt: salt,
    password: hashedPassword,
  }).then((User) => {
    var user = {
      id: User.id,
      username: User.username
    };

    req.login(user, function(err) {
      if (err) { return next(err); }
      res.send(user);
    });
  });
}

function update(req, res) {
  User.update({
    username: req.body.username,
    email: req.body.email,
    password: req.body.password
  }, {
    where: {
      id: req.params.id
    }
  }).then(() => {
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