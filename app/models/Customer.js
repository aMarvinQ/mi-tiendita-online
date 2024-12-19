import { DataTypes } from '@sequelize/core';
import sequelize from "../config/database.js";

// mapeado de tabla clientes para crear modelo
const customerModel = sequelize.define('Cliente', {
    idClientes: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
    },
    razon_social: {
        type: DataTypes.STRING(245),
        allowNull: true
    },
    nombre_comercial: {
        type: DataTypes.STRING(34),
        allowNull: true
    },
    direccion_entrega: {
        type: DataTypes.STRING(45),
        allowNull: false
    },
    telefono: {
        type: DataTypes.STRING(45),
        allowNull: false
    },
    correo_electronico: {
        type: DataTypes.STRING(45),
        allowNull: false
    }
}, {
    tableName: 'Clientes',
    timestamps: false
})

// exportación del modelo creado hacía el controlador customer
export default customerModel;

