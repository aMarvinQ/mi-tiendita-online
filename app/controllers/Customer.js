import sequelize from "../config/database.js";
import customerModel from "../models/Customer.js";

class CustomerController {
    // crear cliente con procedimiento almacenado
    async createCustomer (req, res) {
        try {
            const { companyName, tradeName, delAddress, tel, email } = req.body;
            await sequelize.query('EXEC p_insert_clientes @razon_social=:companyName, @nombre_comercial=:tradeName, @direccion_entrega=:delAddress, @telefono=:tel, @email=:email',
                { replacements: { companyName, tradeName, delAddress, tel, email }});
            res.status(201).send('Cliente creado exitosamente');
        } catch ( err ) {
            res.status(500).send(`Error al crear un nuevo cliente: ${err.message}`);
        }
    }

    // ver todos los clientes
    async getAllCustomers (req, res) {
        try {
            const customers = await customerModel.findAll({});
            res.json(customers);
        } catch ( err ) {
            res.status(500).send(`Error al pocesar la solicitud: ${err.message}`);
        }
    }

    // ver cliente por ID
    async getOneCustomer (req, res) {
        try {
            const customer = await customerModel.findByPk(req.params.id);
            if (customer) {
                return res.status(200).json(customer);
            }
            res.status(404).json({error: 'Cliente no encontrado'});
        } catch ( err ) {
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }

    // actualizar cliente con procedimiento almacenado
    async updateCustomer (req, res) {
        try{
            const { companyName, tradeName, delAddress, tel, email } = req.body;
            const { id } = req.params;
            await sequelize.query('EXEC p_update_clientes @idClientes=:id, @razon_social=:companyName, @nombre_comercial=:tradeName, @direccion_entrega=:delAddress, @telefono=:tel, @email=:email',
                { replacements: { id, companyName, tradeName, delAddress, tel, email }});
        } catch ( err ){
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`); 
        }
    }
}

const customerController = new CustomerController();
export default customerController;