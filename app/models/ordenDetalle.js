import { DataTypes } from '@sequelize/core';
import sequelize from '../config/database';
// importación de modelos relacionados
import ordenModel from './Orden';
import productModel from './Product';

const ordenDetalleModel = sequelize.define('OrdenDetalles', {
    idOrdenDetalles: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
    },
    orden_idOrden: {
        type: DataTypes.INTEGER,
        references: {
            model: ordenModel,
            key: 'idOrden'
        },
        allowNull: false
    },
    productos_idProductos: {
        type: DataTypes.INTEGER,
        references: {
            model: productModel,
            key: 'idProductos'
        },
        allowNull: false
    },
    cantidad: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    precio: {
        type: DataTypes.FLOAT,
        allowNull: false
    },
    subtotal: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
}, {
    tableName: "OrdenDetalles",
    timestamps: false
});

export default ordenDetalleModel;