import sequelize from "../config/database.js";
import productModel from "../models/Product.js";

class ProductController {
  // crear un nuevo producto
    createProduct = async (req, res) => {
        try {
                const { idCategory, idUser, name, trademark, code, stock, idStatus, price } = req.body;
                const foto = req.file ? req.file.buffer : null;

                await sequelize.query(
                    `EXEC p_insert_productos
                     @categoriaProductos_idCategoriaProductos=:idCategory,
                     @usuarios_idUsuarios=:idUser, 
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

    // ver todos los productos
    getAllProducts = async(req, res) => {
        try {
            const products = await productModel.findAll({});
            res.status(201).json(products);
        } catch ( err ) {
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }

    // ver un producto por id 
    getOneProduct = async (req, res) => {
        try {
            const product = await productModel.findByPk(req.params.id);
            if (product) {
                return res.status(201).json(product);
            }
            res.status(404).json({err: 'Producto no encontrado'});
        } catch ( err ){
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }

    // actualizar productos con procedimiento almacenado 
    updateProduct = async (req, res ) => {
        try {
            const { idCategory, idUser, name, trademark, code, stock, idStatus, price } = req.body;
            const foto = req.file ? req.file.buffer : null;
            const { id } = req.params;

            await sequelize.query(
                `EXEC p_update_productos
                 @idProductos=:id,
                 @categoriaProductos_idCategoriaProductos=:idCategory, 
                 @usuarios_idUsuarios=:idUser, 
                 @nombre=:name, 
                 @marca=:trademark, 
                 @codigo=:code, 
                 @stock=:stock, 
                 @estados_idEstados=:idStatus, 
                 @precio=:price, 
                 @foto=:foto`,
                { replacements: {
                    id, 
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

            res.status(201).send('Producto actualizado exitosamente');
        } catch (err) {
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }

    // inactivar, cambio de estado producto por procedimiento almacenado
    deleteProduct = async (req, res) => {
        try {
            const { idStatus } = req.body;
            const { id } = req.params;
            await sequelize.query(`EXEC p_delete_producto
                @idProductos=:id,
                @estados_idEstados=:idStatus`,
                { replacements: { id, idStatus}
            });

            res.status(201).send('Producto eliminado exitosamente');
        } catch ( err ){
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`)
        }
    }
}

// exportación del objeto instanciado hacía rutas
const productController = new ProductController;
export default productController;