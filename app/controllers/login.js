import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import JWT from 'jwt-simple'
import { QueryTypes } from '@sequelize/core';
import sequelize from '../config/database.js';
import userModel from '../models/User.js';
import dotenv from 'dotenv'
import transporter from '../config/nodemailer.js';

dotenv.config();

// variables de entorno para servidor smtp
const SECRET_KEY = process.env.SECRET_KEY;
const EMAIL_USER = process.env.EMAIL_USER;

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

            // Crear token de verificación
            const token = jwt.sign({ email }, SECRET_KEY, { expiresIn: '1h' });

            // Correo para activar cuenta
            const verificationLink = `http://localhost:3000/api/users/verify/${token}`;
            const mailOptions = {
                from: EMAIL_USER,
                to: email,
                subject: '<h1>Bienvenido a Mi Tiendita Online</h1>',
                html: `<div><p>Hola <strong>${name}</strong>,Por favor verifica tu cuenta haciendo clic en el siguiente boton: </p> <button>${verificationLink}<button></div>`,
                Headers: {
                    'Content-Type': 'text/html'
                }
            };

            transporter.sendMail(mailOptions, (err, info) => {
                if (err) {
                    console.error(`Error al enviar el correo: ${err.message}`);
                    return res.status(500).send('Error al enviar el correo');
                }
                console.log(`Correo enviado: ${info.response}`);
                res.status(201).send('Usuario registrado con éxito. Verifique su correo electrónico para activar su cuenta.');
            });
        } catch (err) {
            res.status(500).send(`Error al registrar usuario: ${err.message}`);
        }
    };

    // Función para verificar el token y activar la cuenta
    verifyUser = async (req, res) => {
        const { token } = req.params;

        try {
            const decoded = jwt.verify(token, SECRET_KEY);
            const email = decoded.email;

            await sequelize.query(
                `UPDATE Usuarios SET estados_idEstados = 1 WHERE correo_electronico = :email`,
                {
                    replacements: { email },
                    type: QueryTypes.RAW
                }
            );

            res.status(200).send('Cuenta activada con éxito');
        } catch (err) {
            res.status(500).send(`Error al verificar usuario: ${err.message}`);
        }

    }
    

    // login del usuario
    loginUser = async (req, res) => {
        const { email, password } = req.body;

        try {

            const user = await userModel.findOne({where: {correo_electronico: email}});

            if (user.estados_idEstados !== 1) {
                return res.status(403).json({ message: 'La cuenta no está activa. Verifica tu correo para activarla.' });
            }
            
            const isMatch = await bcrypt.compare(password, user.password);

            if(!isMatch) {
                return res.status(401).json({ message: 'Contraseña incorrecta'});
            }

            const token = JWT.encode({ idUsuarios: user.estados_idUsuarios }, SECRET_KEY, 'HS256', { expiresIn: '24h'});
            res.status(200).json({ token });
        } catch ( err ){
            res.status(500).send(`Error al procesar la solicitud: ${err.message}`); 
        }
    }
}

const login = new Login
export default login;