import jwt from 'jwt-simple';
import dotenv from 'dotenv';

dotenv.config();

const SECRET_KEY = process.env.SECRET_KEY;

const authenticateToken = (req, res, next) => {
    const token = req.header('Authorization')?.replace('Bearer', '');

    if (!token) {
        return res.status(401).json({ message: 'Acceso denegado. No se encontró un token'});
    }

    try {
        const decoded = jwt.decode(token, SECRET_KEY);
        req.user = decoded;
        next();
    } catch ( err ) {
        return res.status(403).json({ message: 'Token invalido o expirado.' });
    }
}

export default authenticateToken;
