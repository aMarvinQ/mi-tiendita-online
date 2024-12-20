import express from 'express';
import catProductController from '../controllers/catProduct.js';

const router = express.Router();

router.post('/newCatProduct', catProductController.createCatProduct);
router.get('/allCatProduct', catProductController.getAllCatProduct);
router.get('/catProduct/:id', catProductController.getOneCatProduct);
router.put('/updateCatProduct/:id', catProductController.updateCatProduct);
router.put('/deleteCatProduct/:id', catProductController.deleteCatProduct);

export default router;