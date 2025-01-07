import React, { useState, useEffect } from "react";
import axios from "../../services/axios.js";
import { Card, CardContent, Typography, CardMedia } from "@mui/material";

export const ProductCard = ({ product }) => {
  const [imageUrl, setImageUrl] = useState("");

  useEffect(() => {
    const fetchImage = async () => {
      try {
        const response = await axios.get(`/api/products/${product.idProductos}/image`, {
          responseType: 'blob', 
        });
        const imageBlob = response.data;
        const imageObjectUrl = URL.createObjectURL(imageBlob);
        setImageUrl(imageObjectUrl);
      } catch (error) {
        console.error('Error al obtener la imagen', error);
      }
    };

    fetchImage();
    console.log('hola' + imageUrl);
  }, [product.idProductos]);


  return (
    <Card sx={{ width: "calc(25% - 16px)", boxShadow: 3, marginBottom: 2 }}>
       {imageUrl ? (
          <CardMedia
            component="img"
            alt={product.nombre}
            height="200"
            image={imageUrl}
          />
        ) : (
          <CardMedia
            component="img"
            alt="Imagen no disponible"
            height="140"
            image="default-image.jpg" // Coloca una imagen por defecto
          />
        )}
      <CardContent>
        <Typography variant="h6" component="div">
          {product.nombre}
        </Typography>
        <Typography variant="body2" color="text.secondary">
          Q.{product.precio}
        </Typography>
      </CardContent>
    </Card>
  );
};
