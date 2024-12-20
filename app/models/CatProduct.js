import { DataTypes } from '@sequelize/core';
import sequelize from "../config/database.js";
// importación de modelos para incluir relaciones
import userModel from './User.js';
import statusModel from './Status.js';

const catProductModel = sequelize.define('CategoriaProductos', {
    idCategoriaProductos: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
    },
    usuarios_idUsuarios: {
        type: DataTypes.INTEGER,
        references: {
            model: userModel,
            key: 'idUsuarios'
        },
        allowNull: false
    },
    nombre: {
        type: DataTypes.STRING(45),
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
    fecha_creacion: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    tableName: 'CategoriaProductos',
    timestamps: false
});

userModel.hasMany(catProductModel, {foreignKey: 'usuarios_idUsuarios'});
catProductModel.belongsTo(statusModel, {foreignKey: 'estados_idEstados'});
export default catProductModel;