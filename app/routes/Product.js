import express from 'express';
// controlador necesario para definir la función de las rutas
import productController from '../controllers/Product.js';
// middlewares necesario para subir la foto convirtiendola en buffer
import upload from '../middlewares/upload.js';

const routes = express.Router();

// rutas del crud, donde cada una necesita del controlador y su metodo
routes.post('/newProduct', upload.single('foto'), productController.createProduct);
routes.get('/allProducts', productController.getAllProducts);
routes.get('/product/:id', productController.getOneProduct);
routes.put('/updateProduct/:id', upload.single('foto'), productController.updateProduct);
routes.put('/deleteProduct/:id', productController.deleteProduct);

// exportación de rutas hacía aplicación principal (app.js)
export default routes;
