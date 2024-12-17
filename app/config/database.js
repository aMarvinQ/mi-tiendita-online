import { Sequelize } from "@sequelize/core";
import { MsSqlDialect } from "@sequelize/mssql";
// modulo 'dotenv para manejar las variables de entorno
import dotEnv from 'dotenv';

// carga de variables de entorno definidas en .env
dotEnv.config();

// Conexión a base de datos
const sequelize = new Sequelize({
  dialect: MsSqlDialect,
  server: process.env.serverDB,
  port: 1433,
  database: process.env.databaseDB,
  authentication: {
    type: "default",
    options: {
      userName: process.env.userNameDB,
      password: process.env.passwordDB,
    },
  },
  trustServerCertificate: true,
});

export { sequelize };