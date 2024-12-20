import multer from "multer";

const storage = multer.memoryStorage();
const upload = multer({
    storage,
    limits: { fileSize: 5 * 1024 * 1024 },
    fileFilter: (req, file, cb) => {
        if (!file.mimetype.startsWith('image/')) {
            return cb(new Error('El archivo debe ser una imagen'));
        }
        cb(null, true);
    },
});

export default upload;
