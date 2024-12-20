import express from 'express';
import userController from '../controllers/User.js';

const router = express.Router();

// rutas del crud, donde cada una necesita del controlador y su metodo
router.post('/newUser', userController.createUser);
router.get('/allUsers', userController.getAllUsers);
router.get('/user/:id', userController.getOneUser);
router.put('/updateUser/:id', userController.updateUser);
router.put('/deleteUser/:id', userController.deleteUser);

// exportación de rutas hacía aplicación principal (app.js)
export default router;