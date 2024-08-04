
const db = require('../models/db');
const crypto = require('crypto');
const User = db.user;


function get_all(req, res) {
  User.findAll().then(users => {
    res.send(users);
  });
}

function getbyID(req, res) {
  User.findOne({
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
    permission: req.body.permission, // 0 = user, 1 = admin or teacher
  }).then(user => {
    res.send('success');
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