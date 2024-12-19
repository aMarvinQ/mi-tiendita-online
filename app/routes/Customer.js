import express from 'express';
import customerController from '../controllers/Customer.js';

const router = express.Router();

router.post('/newCustomer', customerController.createCustomer);
router.get('/allCustomers', customerController.getAllCustomers);
router.get('/customer/:id', customerController.getOneCustomer);
router.put('/updateCustomer/:id', customerController.updateCustomer);

export default router;