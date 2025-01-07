import { DataTypes } from '@sequelize/core';
import sequelize from '../config/database.js';
// importación de modelos relacionados
import catProductModel from './CatProduct.js';
import userModel from './User.js';
import statusModel from './Status.js';

// mapeo de tabla 
const productModel = sequelize.define('Productos', {
    idProductos: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
    },
    categoriaProductos_idCategoriaProductos: {
        type: DataTypes.INTEGER,
        references: {
            model: catProductModel,
            key: 'idCategoriaProductos'
        },
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
    marca: {
        type: DataTypes.STRING(45),
        allowNull: false
    },
    codigo: {
        type: DataTypes.STRING(45),
        allowNull: true
    },
    stock: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    estados_idEstados: {
        type: DataTypes.INTEGER,
        references: {
            model: statusModel,
            key: 'idEstados'
        },
        allowNull: false
    },
    precio: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    fecha_creacion: {
        type: DataTypes.STRING,
        allowNull: false
    },
    foto: {
        type: DataTypes.STRING,
        allowNull: true
    }
}, {
    tableName: 'Productos',
    timestamps: false
});

// relaciones de tablas
catProductModel.hasMany(productModel, {foreignKey: 'categoriaProductos_idCategoriaProductos'});
userModel.hasMany(productModel, {foreignKey: 'usuarios_idUsuarios'});
productModel.belongsTo(statusModel, {foreignKey: 'estados_idEstados'});

// exportación de modelo hacía su controlador
export default productModel;