import { DataTypes } from '@sequelize/core';
import sequelize from '../config/database';
// importación de modelos relacionados
import userModel from './User';
import statusModel from './Status';

const ordenModel = sequelize.define('Orden', {
    idOrden : {
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
    estados_idEstados: {
        type: DataTypes.INTEGER,
        references: {
            model: statusModel,
            key: 'idEstados'
        },
        allowNull: false
    },
    fecha_creacion: {
        type: DataTypes.DATE,
        allowNull: false,
        field: 'createdAt'
    },
    nombre_completo: {
        type: DataTypes.STRING(60),
        allowNull: false
    },
    direccion: {
        type: DataTypes.STRING(545),
        allowNull: false
    },
    telefono: {
        type: DataTypes.STRING(45),
        allowNull: true
    },
    correo_electronico: {
        type: DataTypes.STRING(45),
        allowNull: true
    },
    fecha_entrega: {
        type: DataTypes.DATE,
        allowNull: false
    },
    total_orden: {
        type: DataTypes.FLOAT,
        allowNull: true
    }
}, {
    tableName: 'Orden',
    timestamps: true,
    updatedAt: false
});

export default ordenModel;