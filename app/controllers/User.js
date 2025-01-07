import sequelize from "../config/database.js";
import userModel from "../models/User.js";

class UserController {
    // crear un nuevo usuario con procedimiento almacenado
    createUser = async (req, res) => {
        try {
            // parametros requeridos del procedimiento almacenado
            const { idRol, idStatus, email, name, password, tel, birthdate, idCustomer = null} = req.body;
            
            await sequelize.query(`EXEC p_insert_usuarios 
                @rol_idRol=:idRol, 
                @estados_idEstados=:idStatus, 
                @email=:email, 
                @nombre_completo=:name, 
                @password=:password, 
                @telefono=:tel, 
                @fecha_nac=:birthdate, 
                @clientes_idClientes=:idCustomer`, 
                { replacements: { 
                    idRol, 
                    idStatus, 
                    email, 
                    name, 
                    password, 
                    tel, 
                    birthdate, 
                    idCustomer }});

            res.status(201).send('Usuario creado exitosamente');
        } catch ( err ) {
            res.status(500).send(`Error al crear usuario: ${err.message}`);
        }
    }

    // ver todos los usuarios
    getAllUsers = async (req, res) => {
        try {
            const users = await userModel.findAll({});
            res.json(users);
        } catch ( err ){
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }

    // ver un usuario por llave primaria
    getOneUser = async (req, res) => {
        try {
            const user = await userModel.findByPk(req.params.id);
            if (user) {
                return res.status(200).json(user);
            }
        } catch ( err ) {
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }

    // actualizar usuario
    updateUser = async (req, res) => {
        try {
            const { idRol, idStatus, name, password, tel } = req.body;
            const { id } = req.params;
                await sequelize.query('EXEC p_update_usuarios @idUsuarios=:id, @rol_idRol=:idRol, @estados_idEstados=:idStatus, @nombre_completo=:name, @password=:password, @telefono=:tel', 
                    { replacements: { id, idRol, idStatus, name, password, tel }});
                res.status(201).send('Usuario actualizado con exito');
        } catch ( err ) {
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }

    // inactivación de usuario con eliminación lógica
    deleteUser = async (req, res) => {
        try {
            const { idStatus } = req.body;
            const { id } = req.params;

            await sequelize.query('EXEC p_delete_usuario @idUsuarios=:id, @estados_idEstado=:idStatus', 
                { replacements: { id, idStatus }});
            res.status(201).send('Usuario eliminado con exito');
        } catch ( err ) {
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }
}

// exportación del objeto instanciado hacía routes
const userController = new UserController
export default userController;