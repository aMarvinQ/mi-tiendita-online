import express from 'express';
// controlador necesario para definir la función de las rutas
import catProductController from '../controllers/catProduct.js';

const router = express.Router();

// rutas del crud, donde cada una necesita del controlador y su metodo
router.post('/newCatProduct', catProductController.createCatProduct);
router.get('/allCatProduct', catProductController.getAllCatProduct);
router.get('/catProduct/:id', catProductController.getOneCatProduct);
router.put('/updateCatProduct/:id', catProductController.updateCatProduct);
router.put('/deleteCatProduct/:id', catProductController.deleteCatProduct);

// exportación de rutas hacía aplicación principal (app.js)
export default router;