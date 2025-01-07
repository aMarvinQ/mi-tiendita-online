import express from "express";
import sequelize from './config/database.js'
import cors from 'cors'
import path from 'path'

// importación de rutas
import statusRouter from "./routes/Status.js";
import customerRouter from "./routes/Customer.js";
import userRouter from './routes/User.js';
import catProductRouter from './routes/catProduct.js';
import productRoutes from './routes/Product.js';
import orderDetailsRoutes from './routes/OrderDetails.js';
import loginRoutes from "./routes/login.js";
import authenticateToken from "./middlewares/authMiddleware.js";
import checkUserState from "./middlewares/userStateMiddleware.js";

const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

app.get("/", (req, res) => {
  res.send("Hola Mundo");
});

// Rutas públicas
app.use('/api', loginRoutes);

// rutas protegidas
// app.use('/api', authenticateToken, checkUserState);

app.use('/api', statusRouter);
app.use('/api', customerRouter);
app.use('/api', userRouter);
app.use('/api', catProductRouter);
app.use('/api', productRoutes);
app.use('/api', orderDetailsRoutes);



app.get('/test', async (req, res) => {
  try {
    await sequelize.authenticate();
    res.send('Conexión exitosa');
  } catch (error) {
    res.status(500).send('Error conectando la base de datos '+ error.message);
  }
});

app.listen(port, () => {
  console.log(`Server listening on port: ${port}`);
});

