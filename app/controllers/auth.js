import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import userModel from '../models/User.js';
import dotenv from 'dotenv';

dotenv.config();

class Auth {
    // registro de usuario
    createUser = async (req, res) => {
        try {
            // parametros requeridos del procedimiento almacenado
            const { idRol, idStatus, email, name, password, tel, birthdate, idCustomer } = req.body;

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

    // inicio de sesión 
    login = async (req, res) => {
        try {
            const { email, password } = req.body;

            const user = await userModel.findOne({where: {email}});
            if (!user) return res.status(401).json({ message: 'Usuario no encontrado'});
            
            const isMatch = await bcrypt.compare(password, user.password);
            if(!isMatch) return res.status(401).json({ message: 'Contraseña incorrecta'});

            const token = jwt.sign({ idUsuarios: user.idUsuarios }, process.env.JWT_SECRET, { expiresIn: '24h'});
            res.status(200).json({ token });
        } catch ( err ){
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`);
        }
    }
}