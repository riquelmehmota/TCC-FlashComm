const multer = require('multer');

// Set storage destination and filename
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'assets/img');
    },
    filename: function (req, file, cb) {
        const ext = file.minetype.split('/')[1];
        cb(null, `assets/img/${file.originalname}-${Date.now()}.${ext}`);
    }
});

// Create multer instance
const upload = multer({ storage });

module.exports = upload;