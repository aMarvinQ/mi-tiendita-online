import React from "react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import * as yup from "yup";
import {
  Box,
  TextField,
  Button,
  Typography,
  Checkbox,
  FormControlLabel,
} from "@mui/material";
import axios from "../../services/axios.js";

// Esquema de validación con Yup
const schema = yup.object({
  name: yup.string().required(),
  idStatus: yup.boolean(),
});

export const CreateCategoryForm = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schema),
  });

  const onSubmit = async (data) => {
    try {
      const payload = {
        ...data,
        idStatus: data.idStatus ? 1 : 2,
        idUser: 1,
      };
      await axios.post("/newCatProduct", payload);
      alert("Categoría creada exitosamente");
    } catch (error) {
      console.error("Error al crear la categoría:", error);
      alert("Ocurrió un error al crear el usuario");
    }
  };

  return (
    <Box
      component="form"
      onSubmit={handleSubmit(onSubmit)}
      noValidate
      sx={{
        margin: "0 auto",
        padding: 4,
        display: "flex",
        flexDirection: "column",
        gap: 3,
      }}
    >
      <Typography variant="h3" sx={{ marginBottom: 2 }}>
        Crear Categoría de productos
      </Typography>

      <Box sx={{ display: "flex", flexDirection: "column", gap: 2 }}>
        <Box sx={{ display: "flex", justifyContent: "space-between" }}>
          <Typography variant="h6">Nombre</Typography>
          <TextField
            {...register("name")}
            sx={{ width: "85%" }}
            error={!!errors.name}
            helperText={errors.name?.message}
          />
        </Box>
      </Box>
      <Box
        sx={{
          display: "flex",
          gap: 2,
          marginTop: 2,
          justifyContent: "center",
          width: "100%",
        }}
      >
        <Box sx={{ display: "flex", justifyContent: "center" }}>
          <FormControlLabel
            control={<Checkbox {...register("idStatus")} color="primary" />}
            label="Activo"
          />
          {errors.idStatus && (
            <Typography color="error" variant="body2">
              {errors.idStatus.message}
            </Typography>
          )}
        </Box>
      </Box>

      <Button
        type="submit"
        variant="contained"
        color="primary"
        fullWidth
        sx={{ marginTop: 3 }}
      >
        Crear Categoría
      </Button>
    </Box>
  );
};
