import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { QueryTypes } from '@sequelize/core';
import sequelize from '../config/database.js';
import userModel from '../models/User.js';

const SECRET_KEY = process.env.SECRET_KEY;

// registro 

class Login {
    registerUser = async (req, res) => {
        const { email, name, password, tel, birthdate} = req.body;
            
        try {
            const hashedPassword = await bcrypt.hash(password, 10);
            const result = await sequelize.query(
                `EXEC p_crear_usuario
                    @correo_electronico=:email,
                    @nombre_completo=:name, 
                    @password=:password,
                    @telefono=:tel,
                    @fecha_nac=:birthdate`, {
                        replacements: {
                            email,
                            name,
                            password: hashedPassword,
                            tel,
                            birthdate
                        },
                        type: QueryTypes.RAW
                    }
            );

            res.status(201).send('Usuario registrado con éxito');
        } catch ( err ){
            res.status(500).send(`Error al registrar usuario: ${err.message}`)
        }
    }
}

const login = new Login
export default login;