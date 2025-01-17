// Initialize express router
const db = require('../models/db');
const crypto = require('crypto');
const fs = require('fs').promises;
const User = db.user;
const path = require('path');



async function get_all(req, res) {
    
    await User.findAll().then(users => {
      res.send(users);
    });

}

async function getbyID(req, res) {
  if(req.isAuthenticated()) {
    await User.findOne({
      where: {
        id: req.user.id
      }
    }).then(user => {
      res.send(user);
    });
  }
  else {
    res.status(401).send('Unauthorized');
  }
}

async function get_image(req, res) {
  try {

    if(!req.isAuthenticated()) {
      return res.status(401).send('Unauthorized');
    }

    const user = await User.findOne({
      where: {
        id: req.user.id
      }
    });

    if (!user || !user.profile_image) {
      return res.status(404).send('Image not found');
    }

    res.setHeader('Content-Type', `${user.mimetype}`);

    res.send(user.profile_image);

  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
}


async function register(req,res) {
  const salt = crypto.randomBytes(16).toString('hex');
  const hashedPassword = crypto.pbkdf2Sync(req.body.password, salt, 310000, 32, 'sha256').toString('hex');
  
  
  try {
    if (!req.file.mimetype.startsWith('image/')) {
      return res.status(400).send('Please upload a valid image file');
    }
    
    var profileImage = req.file.filename;
    
  } catch (err) {
    profileImage = 'Default_pfp.jpg';
  }
  
  try {
    await User.create({
      username: req.body.username,
      email: req.body.email,
      salt: salt,
      password: hashedPassword,
      profile_image: profileImage,
      mimetype: `Image/${req.file.originalname.split('.')[1]}`
      
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
  catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
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

async function remove(req, res) {
  await User.destroy({
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