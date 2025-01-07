import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { Container, Typography, Card, CardContent, CardMedia, CircularProgress } from '@mui/material';
import axios from '../../services/axios';

export const ProductDetail = () => {
  const { id } = useParams();
  const [product, setProduct] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchProduct = async () => {
      try {
        const response = await axios.get(`/product/${id}`);
        setProduct(response.data);
        setLoading(false);
      } catch (error) {
        console.error('Error al obtener el producto:', error);
        setLoading(false);
      }
    };

    fetchProduct();
  }, [id]);

  if (loading) {
    return (
      <Container>
        <CircularProgress />
      </Container>
    );
  }

  if (!product) {
    return (
      <Container>
        <Typography variant="h5" component="h2">
          Producto no encontrado
        </Typography>
      </Container>
    );
  }

  // Función para convertir el buffer de la imagen a base64
  const bufferToBase64 = (buffer) => {
    const binary = buffer.map(b => String.fromCharCode(b)).join('');
    return window.btoa(binary);
  };

  return (
    <Container>
      <Typography variant="h4" component="h1" gutterBottom>
        Detalles del Producto
      </Typography>
      <Card>
        <CardMedia
          component="img"
          alt={product.nombre}
          height="140"
          image={product.foto.data ? `data:image/jpeg;base64,${bufferToBase64(product.foto.data)}` : 'https://via.placeholder.com/140'}
          title={product.nombre}
        />
        <CardContent>
          <Typography gutterBottom variant="h5" component="div">
            {product.nombre}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Marca: {product.marca}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Código: {product.codigo}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Stock: {product.stock}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Estado: {product.estados_idEstados === 1 ? 'Activo' : 'Inactivo'}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Precio: ${product.precio}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Fecha de creación: {new Date(product.fecha_creacion).toLocaleDateString()}
          </Typography>
        </CardContent>
      </Card>
    </Container>
  );
};


