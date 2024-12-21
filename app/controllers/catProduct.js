// modulos requeridos
import sequelize from "../config/database.js";
import catProductModel from "../models/CatProduct.js";

class CatProductController {
  // método para crear una nueva categoría mediante un proceso almacenado
  createCatProduct= async (req, res) => {
    try {
      // parametros necesarios que pasará el usuario
        const { idUser, name, idStatus } = req.body;

        await sequelize.query(`EXEC p_insert_catProductos 
            @usuarios_idUsuarios=:idUser, 
            @nombre=:name, 
            @estados_idEstados=:idStatus`,
            
          { replacements: { 
              idUser, 
              name, 
              idStatus 
            }});

        res.status(201).send('Categoría creada exitosamente');
    } catch ( err ) {
      res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
    }
  }

  // ver todas las categorías
  getAllCatProduct = async (req, res) => {
    try {
      const catProducts = await catProductModel.findAll({});
      res.json(catProducts);
    } catch ( err ){
      res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
    }
  }

  // ver una categoría
  getOneCatProduct = async (req, res) => {
    try {
        const catProduct = await catProductModel.findByPk(req.params.id);
        if (catProduct) {
            return res.status(200).json(catProduct);
        }
    } catch ( err ) {
        res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
    }
  }

  // actualizar categoría 
  updateCatProduct = async (req, res) => {
    try {
      const { idUser, name, idStatus } = req.body;
      const { id } = req.params;
        
      await sequelize.query(`EXEC p_update_catProductos 
          @idCategoriaProductos=:id, 
          @usuarios_idUsuarios=:idUser, 
          @nombre=:name, 
          @estados_idEstados=:idStatus`, 

        { replacements: { 
            id, 
            idUser, 
            name, 
            idStatus 
        }});

            res.status(201).send('Categoría actualizado con exito');
    } catch ( err ) {
        res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
    }
  }

  // eliminación lógica de una categoría de productos con procedimientos almacenados 
  deleteCatProduct = async (req, res) => {
    try {
      const { idStatus } = req.body;
      const { id } = req.params;
      
      await sequelize.query(`Exec p_delete_catProductos 
          @idCategoriaProductos=:id, 
          @estados_idEstados=:idStatus`,

        { replacements: { 
            id, 
            idStatus 
          }});
          
        res.status(201).send('Categoria eliminada con exito');
    } catch ( err ) {
      res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
    }
  }
}


// Exportación del objeto instanciado hacía routes
const catProductController = new CatProductController();
export default catProductController;
