const route = require('express').Router();
const Users = require('../controllers/Users');
const upload = require('../tools/multer');

// Authentication
// route.post('/login', Users.login);
// route.get('/profile', auth, Users.profile);
// route.get('/logout', auth, Users.logout);

//CRUD
route.post('/singup', upload.single('profile_image'), Users.register);
route.get('/', Users.get_all);
route.get('/:id', Users.getbyID);
route.put('/update/:id', upload.single('profile_image'),Users.update);
route.delete('/delete/:id', Users.remove);

module.exports = route;
