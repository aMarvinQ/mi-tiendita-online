import sequelize from "../config/database.js";
import productModel from "../models/Product.js";

class ProductController {
  // crear un nuevo producto
    async createProduct(req, res) {
        try {
                const { idCategory, idUser, name, trademark, code, stock, idStatus, price } = req.body;
                const foto = req.file ? req.file.buffer : null;

                await sequelize.query(
                    `EXEC p_insert_productos
                     @categoriaProductos_idCategoriaProductos=:idCategory, @usuarios_idUsuarios=:idUser, 
                     @nombre=:name, 
                     @marca=:trademark, 
                     @codigo=:code, 
                     @stock=:stock, 
                     @estados_idEstados=:idStatus, 
                     @precio=:price, 
                     @foto=:foto`,
                    { replacements: { 
                        idCategory, 
                        idUser, 
                        name, 
                        trademark, 
                        code, 
                        stock, 
                        idStatus, 
                        price, 
                        foto }
                    }
                );

                res.status(201).send('Producto creado exitosamente');
        } catch (err) {
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }
}


const productController = new ProductController;
export default productController;