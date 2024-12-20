import express from 'express';
import productController from '../controllers/Product.js';
import upload from '../middlewares/upload.js';

const routes = express.Router();

routes.post('/newProduct', upload.single('foto'), productController.createProduct);

export default routes;