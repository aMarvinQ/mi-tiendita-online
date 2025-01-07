import React from "react";
import { useForm, Controller } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import * as yup from "yup";
import { Box, TextField, Button, Typography } from "@mui/material";
import { axios } from '../../services/axios.js'

// Esquema de validación con Yup
const schema = yup.object().shape({
  idCategory: yup.number().required("La categoría es obligatoria"),
  idUser: yup.number().required("El ID de usuario es obligatorio"),
  name: yup.string().required("El nombre es obligatorio"),
  trademark: yup.string().required("La marca es obligatoria"),
  code: yup.string().required("El código es obligatorio"),
  stock: yup
    .number()
    .typeError("El stock debe ser un número")
    .required("El stock es obligatorio"),
  idStatus: yup.number().required("El estado es obligatorio"),
  price: yup
    .number()
    .typeError("El precio debe ser un número")
    .required("El precio es obligatorio"),
  foto: yup.mixed().test("fileType", "Debes subir una imagen válida", (value) =>
    value?.type?.startsWith("image/")
  ),
});

export const CreateProductForm = () => {
  const {
    control,
    handleSubmit,
    register,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schema),
  });

  const onSubmit = async (data) => {
    try {
      const payload = {
        ...data
      };
      await axios.post("/newProduct", payload);
      alert("Product creado exitosamente");
    } catch (error) {
      console.error("Error al crear producto:", error);
      alert("Ocurrió un error al crear el producto");
    }
  };

  return (
    <Box
      component="form"
      onSubmit={handleSubmit(onSubmit)}
      noValidate
      sx={{ maxWidth: 400, margin: "0 auto", padding: 2, border: "1px solid #ccc", borderRadius: 2 }}
    >
      <Typography variant="h5" gutterBottom>
        Crear Producto
      </Typography>

      <Controller
        name="idCategory"
        control={control}
        defaultValue=""
        render={({ field }) => (
          <TextField
            {...field}
            label="ID Categoría"
            fullWidth
            margin="normal"
            error={!!errors.idCategory}
            helperText={errors.idCategory?.message}
          />
        )}
      />

      <Controller
        name="idUser"
        control={control}
        defaultValue=""
        render={({ field }) => (
          <TextField
            {...field}
            label="ID Usuario"
            fullWidth
            margin="normal"
            error={!!errors.idUser}
            helperText={errors.idUser?.message}
          />
        )}
      />

      <Controller
        name="name"
        control={control}
        defaultValue=""
        render={({ field }) => (
          <TextField
            {...field}
            label="Nombre del Producto"
            fullWidth
            margin="normal"
            error={!!errors.name}
            helperText={errors.name?.message}
          />
        )}
      />

      <Controller
        name="trademark"
        control={control}
        defaultValue=""
        render={({ field }) => (
          <TextField
            {...field}
            label="Marca"
            fullWidth
            margin="normal"
            error={!!errors.trademark}
            helperText={errors.trademark?.message}
          />
        )}
      />

      <Controller
        name="code"
        control={control}
        defaultValue=""
        render={({ field }) => (
          <TextField
            {...field}
            label="Código"
            fullWidth
            margin="normal"
            error={!!errors.code}
            helperText={errors.code?.message}
          />
        )}
      />

      <Controller
        name="stock"
        control={control}
        defaultValue=""
        render={({ field }) => (
          <TextField
            {...field}
            label="Stock"
            type="number"
            fullWidth
            margin="normal"
            error={!!errors.stock}
            helperText={errors.stock?.message}
          />
        )}
      />

      <Controller
        name="idStatus"
        control={control}
        defaultValue=""
        render={({ field }) => (
          <TextField
            {...field}
            label="ID Estado"
            type="number"
            fullWidth
            margin="normal"
            error={!!errors.idStatus}
            helperText={errors.idStatus?.message}
          />
        )}
      />

      <Controller
        name="price"
        control={control}
        defaultValue=""
        render={({ field }) => (
          <TextField
            {...field}
            label="Precio"
            type="number"
            fullWidth
            margin="normal"
            error={!!errors.price}
            helperText={errors.price?.message}
          />
        )}
      />

      <Box marginY={2}>
        <Typography variant="body1">Foto del Producto</Typography>
        <input
          type="file"
          {...register("foto")}
          accept="image/*"
          style={{ marginTop: 8 }}
        />
        <Typography variant="body2" color="error">
          {errors.foto?.message}
        </Typography>
      </Box>

      <Button type="submit" variant="contained" color="primary" fullWidth>
        Crear Producto
      </Button>
    </Box>
  );
};
