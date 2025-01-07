import axios from '../../services/axios.js'
import React, { useState, useEffect } from 'react';
import { Container, Card, CardContent, Typography, Button, Box } from '@mui/material';
import './Dashboard.css'

export const Dashboard = () => {
  const [orders, setOrders] = useState([]);

  useEffect(() => {
    // Llamada a la API para obtener los datos
    const fetchOrders = async () => {
      try {
        const response = await axios.get('/allOrders');
        setOrders(response.data);
      } catch (error) {
        console.error('Error al obtener los pedidos:', error);
      }
    };

    fetchOrders();
  }, []);

  return (
    <Container>
      <Typography variant="h4" gutterBottom>
        Dashboard de Pedidos
      </Typography>
        {orders.map((order) => (
          <Card className="order-card" >
          <CardContent >
            <Box display="flex" justifyContent="space-between" alignItems="center" >
              <Box>
                <Typography variant="h6" className="order-title">
                  No. Orden: {order.idOrden}
                </Typography>
                <Typography className="order-detail">Usuario: {order.nombre_completo}</Typography>
                <Typography className="order-detail">Dirección: {order.direccion}</Typography>
              </Box>
              <Box display="flex" flexDirection="column" alignItems="flex-end">
                <Button variant="text" className="details-button">
                  VER MÁS DETALLES
                </Button>
                <Button variant="contained" className="deliver-button">
                  Entregar
                </Button>
              </Box>
            </Box>
          </CardContent>
        </Card>
        ))}
    </Container>
  );
};
