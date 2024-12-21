import sequelize from '../config/database.js';
import ordenModel from '../models/Orden.js';

class OrderDetailsController {
    createOrder = async (req, res) => {
        const { idUser, idStatus, name, address, tel, email, delDate, totalOrder, orderDetails } = req.body;
    
        try {
          // Convertir los detalles de la orden a una cadena JSON
          const orderDetailsJson = JSON.stringify(orderDetails);
    
          // Ejecutar el procedimiento almacenado con los parámetros
          const result = await sequelize.query(`
            EXEC insertOrden 
              @idUsuarios = :idUser,
              @idEstados = :idStatus,
              @nombre = :name,
              @direccion = :address,
              @telefono = :tel,
              @email = :email,
              @fecha_entrega = :delDate,
              @total_orden = :totalOrder,
              @ordenDetalles = :orderDetails
          `, {
            replacements: {
              idUser,
              idStatus,
              name,
              address,
              tel,
              email,
              delDate,
              totalOrder,
              orderDetails: orderDetailsJson
            },
            type: sequelize.QueryTypes.RAW
          });
    
          res.status(201).json({ message: 'Orden creada exitosamente', idOrden: result[0].idOrden });
        } catch (err) {
          res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
      }
    
    //   ver todas las ordenes 
    getAllOrders = async (req, res) => {
        try {
            const orders = await sequelize.query(`EXEC getAllOrders;`);

            res.status(201).json(orders);
        } catch ( err ){
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }

    // ver una orden por id
    getOneOrder = async (req, res) => {
        try {
            const { id }= req.params;

            const order = await sequelize.query(`EXEC getOrderById
                @idOrden=:id`, {
                    replacements: {
                        id
                    },
                    type: sequelize.QueryTypes.SELECT
                });
                if (order.length === 0) {
                    return res.status(404).json({error: 'Orden no encontrada '});
                }

                res.status(201).json(order);
        } catch ( err ) {
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }

    // actualización de orden detalle
    updateOrder = async (req, res) => {
        try {
          const { id } = req.params;
          const { idUser, idStatus, name, address, tel, email, delDate, totalOrder, orderDetails } = req.body;
        
          const orderDetailsJson = JSON.stringify(orderDetails);
    
          await sequelize.query(`
            EXEC updateOrder 
              @idOrden = :id,
              @idUsuarios = :idUser,
              @idEstados = :idStatus,
              @nombre = :name,
              @direccion = :address,
              @telefono = :tel,
              @email = :email,
              @fecha_entrega = :delDate,
              @total_orden = :totalOrder,
              @ordenDetalles = :orderDetails
          `, {
            replacements: {
              id,
              idUser,
              idStatus,
              name,
              address,
              tel,
              email,
              delDate,
              totalOrder,
              orderDetails: orderDetailsJson
            },
            type: sequelize.QueryTypes.RAW
          });
    
          res.status(200).send('Orden actualizada exitosamente');
        } catch (error) {
          res.status(500).send(`Error al actualizar la orden: ${error.message}`);
        }
      }
    
    //   eliminación logica con procemineito almacenado
    deleteOrder = async (req, res) => {
        try {
            const { id } = req.params;
            const { idStatus } = req.body;

            await sequelize.query(`EXEC deleteOrder 
                @idOrden=:id,
                @idEstado=:idStatus`, {
                    replacements: {
                        id,
                        idStatus
                    },
                    type: sequelize.QueryTypes.RAW
                });

            res.status(201).send('Orden eliminada correctamente');
        } catch ( err ){
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }
}

const orderDetailsController = new OrderDetailsController;
export default orderDetailsController;
