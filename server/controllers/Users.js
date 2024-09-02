// Initialize express router
const db = require('../models/db');
const crypto = require('crypto');
const fs = require('fs').promises;
const User = db.user;
const path = require('path');


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

async function get_image(req, res) {
  var user = await User.findOne({
    where: {
      id: req.params.id
    }
  });
  console.log(user.dataValues.profile_image);
  res.send(user.dataValues.profile_image);
  
}

async function register(req, res) {
  const salt = crypto.randomBytes(16).toString('hex');
  const hashedPassword = crypto.pbkdf2Sync(req.body.password, salt, 310000, 32, 'sha256').toString('hex');
  
  
  try {
    if (!req.file.mimetype.startsWith('image/')) {
      return res.status(400).send('Please upload a valid image file');
    }
    
    const profileImagePath = path.join(__dirname, '../assets/img', req.file.filename);
    var profileImage = await fs.readFile(profileImagePath);
  } catch (err) {
    profileImage = await fs.readFile(path.join(__dirname, '../assets/img/Default_pfp.jpg'));
  }
 
  await User.create({
    username: req.body.username,
    email: req.body.email,
    salt: salt,
    password: hashedPassword,
    profile_image: profileImage
    
  }).then((User) => {
    let user = {
      id: User.id,
      username: User.username,
    };
    req.login(user, (err) => {
      if (err) {
        return res.status(400).send('Failed to log in');
      }
      res.send(user);
    });
  });
}

function update(req, res) {
  if (!req.file && req.file.mimetype.startsWith('image/')) {
    return res.status(400).send('Please upload a valid image file');
  }
  
  try {
    const profileImagePath = path.join(__dirname, '../assets/img', req.file.filename);
    const profileImage = fs.readFile(profileImagePath);
  } catch (err) {
    profileImage = null
  }

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
    get_image,
    register,
    update,
    remove
}