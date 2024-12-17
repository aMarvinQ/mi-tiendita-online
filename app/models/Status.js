import { DataTypes } from '@sequelize/core';
import sequelize from '../config/database.js';

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

export default statusModel;