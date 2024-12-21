import express from 'express';
import orderDetailsController from '../controllers/OrderDetails.js';

const router = express.Router();

router.post('/orders', orderDetailsController.createOrder);
router.get('/allOrders', orderDetailsController.getAllOrders);
router.get('/order/:id', orderDetailsController.getOneOrder);
router.put('/updateOrder/:id', orderDetailsController.updateOrder);
router.put('/deleteOrder/:id', orderDetailsController.deleteOrder);

export default router;