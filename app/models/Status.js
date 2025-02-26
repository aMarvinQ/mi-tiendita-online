import { DataTypes } from '@sequelize/core';
import sequelize from '../config/database.js';

// mapeo de la tabla estados
const statusModel = sequelize.define('Estado', {
    idEstados: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
    },
    nombre: {
        type: DataTypes.STRING(45),
        allowNull: false
    }
}, {
    tableName: 'Estados',
    timestamps: false
})

// exportación del modelo status hacía el controlador 
export default statusModel;