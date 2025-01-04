import express from 'express';
import login from '../controllers/login.js';

const router = express.Router();

router.post('/users/register', login.registerUser);
router.get('/users/verify/:token', login.verifyUser);
router.post('/users/login', login.loginUser);

export default router;