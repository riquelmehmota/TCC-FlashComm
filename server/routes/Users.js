const route = require('express').Router();
const Users = require('../controllers/Users');
const upload = require('../tools/multer');


//CRUD
route.post('/singup', upload.single('profile_image'), Users.register);
route.get('/', Users.get_all);
route.get('/data', Users.getbyID);
route.put('/update/:id', upload.single('profile_image'),Users.update);
route.delete('/delete/:id', Users.remove);
route.get('/image', Users.get_image);

module.exports = route;
