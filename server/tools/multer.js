const multer = require('multer');

// Set storage destination and filename
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'assets/img');
    },
    filename: function (req, file, cb) {
        if(!file) {
            cb(new Error('No file provided'), false);
        }
        const ext = file.mimetype.split('/')[1];
        cb(null, `${file.originalname}-${Date.now()}.${ext}`);
    }
});

// Create multer instance
const upload = multer({ storage });

module.exports = upload;