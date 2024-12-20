import { DataTypes } from '@sequelize/core';
import sequelize from '../config/database.js';
// imoprtación de modelos relacionados
import statusModel from './Status.js';
import customerModel from './Customer.js';

// mapeado de tabla usuarios 

const userModel = sequelize.define('Usuario', {
    idUsuarios: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
    },
    rol_idRol: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    estados_idEstados: {
        type: DataTypes.INTEGER,
        references: {
            model: statusModel,
            key: 'idEstados'
        },
        allowNull: false
    },
    correo_electronico: {
        type: DataTypes.STRING(45),
        allowNull: false
    },
    nombre_completo: {
        type: DataTypes.STRING(45),
        allowNull: false
    },
    password: {
        type: DataTypes.STRING(45),
        allowNull: false
    },
    telefono: {
        type: DataTypes.STRING(45),
        allowNull: false
    },
    fecha_nac: {
        type: DataTypes.DATE,
        allowNull: false
    },
    fecha_creacion: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    clientes_idClientes: {
        type: DataTypes.INTEGER,
        references: {
            model: customerModel,
            key: 'idClientes'
        }
    }
}, {
    tableName: 'Usuarios',
    timestamps: false
})

// relaciones
userModel.belongsTo(statusModel, {foreignKey: 'estados_idEstados'});
userModel.belongsTo(customerModel, {foreignKey: 'clientes_idClientes'});

// exportación de modelo hacía controladores
export default userModel;