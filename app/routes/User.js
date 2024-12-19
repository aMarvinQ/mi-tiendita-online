import express from 'express';
import userController from '../controllers/User.js';

const router = express.Router();

router.post('/newUser', userController.createUser);
router.get('/allUsers', userController.getAllUsers);
router.get('/user/:id', userController.getOneUser);
router.put('/updateUser/:id', userController.updateUser);
router.put('/deleteUser/:id', userController.deleteUser);

export default router;