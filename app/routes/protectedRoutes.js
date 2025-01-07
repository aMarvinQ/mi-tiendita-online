import express from 'express';
import authenticateToken from '../middlewares/authMiddleware';
import checkUserState from '../middlewares/userStateMiddleware';


const router = express.Router();

router.get('/protected-data', authenticateToken, checkUserState, getProtectedData);