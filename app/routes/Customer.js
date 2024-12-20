import express from 'express';
// controlador necesario para definir la función de las rutas
import customerController from '../controllers/Customer.js';

const router = express.Router();

// rutas del crud, donde cada una necesita del controlador y su metodo
router.post('/newCustomer', customerController.createCustomer);
router.get('/allCustomers', customerController.getAllCustomers);
router.get('/customer/:id', customerController.getOneCustomer);
router.put('/updateCustomer/:id', customerController.updateCustomer);

// exportación de rutas hacía aplicación principal (app.js)
export default router;