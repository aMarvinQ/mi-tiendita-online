// modulos
import express from 'express';
import statusController from "../controllers/Status.js"; 

// función router de express
const router = express.Router();

// rutas para estados
router.post('/newStatus', statusController.createStatus);
router.get('/allStatus', statusController.getAllStatus);
router.get('/status/:id', statusController.getOneStatus);
router.put('/updateStatus/:id', statusController.updateStatus);
router.delete('/deleteStatus/:id', statusController.deleteStatus);

export default router;