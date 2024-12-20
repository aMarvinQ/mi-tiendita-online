import { DataTypes } from '@sequelize/core';
import sequelize from '../config/database.js';

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
            // foreign key
        },
        allowNull: false
    },
    usuarios_idUsuarios: {
        type: DataTypes.INTEGER,
        references: {
            // foreign key
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
            // foreign key
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
        type: DataTypes.BLOB,
        allowNull: false
    }
}, {
    tableName: 'Productos',
    timestamps: false
});

export default productModel;