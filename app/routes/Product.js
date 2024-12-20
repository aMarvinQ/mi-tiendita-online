import express from 'express';
import productController from '../controllers/Product.js';
import upload from '../middlewares/upload.js';

const routes = express.Router();

routes.post('/newProduct', upload.single('foto'), productController.createProduct);
routes.get('/allProducts', productController.getAllProducts);
routes.get('/product/:id', productController.getOneProduct);
routes.put('/updateProduct/:id', upload.single('foto'), productController.updateProduct);
routes.put('/deleteProduct/:id', productController.deleteProduct);

export default routes;