import express from "express";
import  { sequelize }  from "./database.js"

const app = express();
const port = 3000;

app.use(express.json());

app.get("/", (req, res) => {
  res.send("Hola Mundo");
});

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
