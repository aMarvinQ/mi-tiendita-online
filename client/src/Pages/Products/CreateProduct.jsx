import React from 'react';
import { useForm } from 'react-hook-form';
import { Container, TextField, Button, Typography, MenuItem } from '@mui/material';
import axios from '../../services/axios';

export const CreateProduct = () => {
  const { register, handleSubmit, formState: { errors } } = useForm();

  const onSubmit = async (data) => {
    const formData = new FormData();
    formData.append('idCategory', data.idCategory);
    formData.append('idUser', data.idUser);
    formData.append('name', data.name);
    formData.append('trademark', data.trademark);
    formData.append('code', data.code);
    formData.append('stock', data.stock);
    formData.append('idStatus', data.idStatus);
    formData.append('price', data.price);
    formData.append('foto', data.foto[0]);

    try {
      const response = await axios.post('/newProduct', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      });
      alert('Producto creado exitosamente');
      console.log(response.data);
    } catch (error) {
      alert('Error al crear el producto');
      console.error(error);
    }
  };

  return (
    <Container>
      <Typography variant="h4" component="h1" gutterBottom>
        Crear Producto
      </Typography>
      <form onSubmit={handleSubmit(onSubmit)}>
        <TextField
          label="Categoría ID"
          fullWidth
          margin="normal"
          {...register('idCategory', { required: 'El ID de la categoría es obligatorio' })}
          error={!!errors.idCategory}
          helperText={errors.idCategory?.message}
        />
        <TextField
          label="Usuario ID"
          fullWidth
          margin="normal"
          {...register('idUser', { required: 'El ID del usuario es obligatorio' })}
          error={!!errors.idUser}
          helperText={errors.idUser?.message}
        />
        <TextField
          label="Nombre"
          fullWidth
          margin="normal"
          {...register('name', { required: 'El nombre es obligatorio' })}
          error={!!errors.name}
          helperText={errors.name?.message}
        />
        <TextField
          label="Marca"
          fullWidth
          margin="normal"
          {...register('trademark', { required: 'La marca es obligatoria' })}
          error={!!errors.trademark}
          helperText={errors.trademark?.message}
        />
        <TextField
          label="Código"
          fullWidth
          margin="normal"
          {...register('code', { required: 'El código es obligatorio' })}
          error={!!errors.code}
          helperText={errors.code?.message}
        />
        <TextField
          label="Stock"
          fullWidth
          margin="normal"
          type="number"
          {...register('stock', { required: 'El stock es obligatorio' })}
          error={!!errors.stock}
          helperText={errors.stock?.message}
        />
        <TextField
          label="Estado ID"
          fullWidth
          margin="normal"
          {...register('idStatus', { required: 'El ID del estado es obligatorio' })}
          error={!!errors.idStatus}
          helperText={errors.idStatus?.message}
        />
        <TextField
          label="Precio"
          fullWidth
          margin="normal"
          type="number"
          {...register('price', { required: 'El precio es obligatorio' })}
          error={!!errors.price}
          helperText={errors.price?.message}
        />
        <Button variant="contained" component="label" fullWidth margin="normal">
          Subir Foto
          <input
            type="file"
            hidden
            {...register('foto', { required: 'La foto es obligatoria' })}
          />
        </Button>
        {errors.foto && <Typography variant="body2" color="error">{errors.foto.message}</Typography>}
        <Button type="submit" variant="contained" color="primary" fullWidth margin="normal">
          Crear Producto
        </Button>
      </form>
    </Container>
  );
};
