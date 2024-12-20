    // modulos
import express from 'express';
// controlador necesario
import statusController from "../controllers/Status.js"; 

// función router de express
const router = express.Router();

// rutas del crud, donde cada una necesita del controlador y su metodo
router.post('/newStatus', statusController.createStatus);
router.get('/allStatus', statusController.getAllStatus);
router.get('/status/:id', statusController.getOneStatus);
router.put('/updateStatus/:id', statusController.updateStatus);
router.delete('/deleteStatus/:id', statusController.deleteStatus);

// exportación de rutas hacía aplicación principal (app.js)
export default router;  