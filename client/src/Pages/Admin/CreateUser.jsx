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
  idRol: yup.boolean(),
  idStatus: yup.boolean(),
  email: yup
    .string()
    .email("Debe ser un correo válido")
    .required("El correo es obligatorio"),
  name: yup.string().required("El nombre es obligatorio"),
  password: yup
    .string()
    .min(6, "La contraseña debe tener al menos 6 caracteres")
    .required("La contraseña es obligatoria"),
  tel: yup.string().required("El teléfono es obligatorio"),
  birthdate: yup
    .date()
    .typeError("Debe ser una fecha válida")
    .required("La fecha de nacimiento es obligatoria"),
});

export const CreateUserForm = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schema),
  });

  const onSubmit = async (data) => {
    try {
      // Convierte los valores booleanos a los valores esperados (números)
      const payload = {
        ...data,
        idRol: data.idRol ? 1 : 2, // 2 representa "Operador"
        idStatus: data.idStatus ? 1 : 2, // 1 representa "Activo"
      };
      await axios.post("/newUser", payload);
      alert("Usuario creado exitosamente");
    } catch (error) {
      console.error("Error al crear usuario:", error);
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
        Crear Usuario
      </Typography>

      <Box sx={{ display: "flex", flexDirection: "column", gap: 2 }}>
        <Box sx={{ display: "flex", justifyContent: "space-between" }}>
          <Typography variant="h6">Nombre Completo</Typography>
          <TextField
            {...register("name")}
            sx={{ width: "85%" }}
            error={!!errors.name}
            helperText={errors.name?.message}
          />
        </Box>

        <Box sx={{ display: "flex", justifyContent: "space-between" }}>
          <Typography variant="h6">Correo Electrónico</Typography>
          <TextField
            {...register("email")}
            sx={{ width: "85%" }}
            error={!!errors.email}
            helperText={errors.email?.message}
          />
        </Box>

        <Box sx={{ display: "flex", justifyContent: "space-between" }}>
          <Typography variant="h6">Contraseña</Typography>
          <TextField
            type="password"
            {...register("password")}
            sx={{ width: "85%" }}
            error={!!errors.password}
            helperText={errors.password?.message}
          />
        </Box>

        <Box sx={{ display: "flex", justifyContent: "space-between" }}>
          <Typography variant="h6">Teléfono</Typography>
          <TextField
            {...register("tel")}
            sx={{ width: "85%" }}
            error={!!errors.tel}
            helperText={errors.tel?.message}
          />
        </Box>

        <Box sx={{ display: "flex", justifyContent: "space-between" }}>
          <Typography variant="h6">Fecha de Nacimiento</Typography>
          <TextField
            type="date"
            {...register("birthdate")}
            sx={{ width: "85%" }}
            InputLabelProps={{ shrink: true }}
            error={!!errors.birthdate}
            helperText={errors.birthdate?.message}
          />
        </Box>
      </Box>

      <Box sx={{ display: "flex", gap: 2, marginTop: 2, justifyContent: 'center', width: '100%' }}>
      <Box sx={{ display: 'flex', justifyContent: 'center' }}>
      <FormControlLabel
        control={<Checkbox {...register("idRol")} color="primary" />}
        label="Operador"
      />
      {errors.idRol && (
        <Typography color="error" variant="body2">
          {errors.idRol.message}
        </Typography>
      )}
      </Box>

      <Box sx={{ display: 'flex', justifyContent: 'center' }}>
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
        Crear Usuario
      </Button>
    </Box>
  );
};
