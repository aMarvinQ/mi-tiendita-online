import { DataTypes } from '@sequelize/core';
import sequelize from "../config/database";

// mapeo de tabla
const rolModel = sequelize.define('Rol', {
    idRol: {
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
    tableName: 'Rol',
    timestamps: false
});

// exportación de modelo hacía controladores
export default rolModel;