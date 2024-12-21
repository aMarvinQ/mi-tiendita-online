import express from "express";
import sequelize from "./app/config/database.js"

// importación de rutas
import statusRouter from "./app/routes/Status.js";
import customerRouter from "./app/routes/Customer.js";
import userRouter from './app/routes/User.js';
import catProductRouter from './app/routes/catProduct.js';
import productRoutes from './app/routes/Product.js';
import orderDetailsRoutes from './app/routes/OrderDetails.js';

const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.send("Hola Mundo");
});

// Rutas
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
