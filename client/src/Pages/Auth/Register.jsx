import React from "react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import { schemaRegister as schema } from "../../services/schemaYup";
import { Box, Typography, TextField, Button } from "@mui/material";
import axios from "../../services/axios";
import "./Register.css";
import { useNavigate } from "react-router-dom";

export const Register = () => {
  const navigate = useNavigate();
  const {
    register,
    handleSubmit,
    watch,
    reset,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schema),
  });

  const password = watch("password");

  const onSubmit = async (data) => {
    try {
      const response = await axios.post("/users/register", data);
      alert("Usuario registrado con éxito");
      console.log(response.data);

      navigate('/login');
      reset();
    } catch (error) {
      alert("Error al registrar usuario");
      console.error(error);
    }
  };

  return (
    <Box className="container">
      <Box className="greeting-box">
        <Typography variant="h2" component="h1" textAlign="center" gutterBottom>
          Bienvenido a <span className="greeting">Mi Tiendita Online</span>
        </Typography>
      </Box>

      {/* Formulario  de Registro*/}
      <Box
        flex={{ xs: 1, md: 1 }}
        display="flex"
        justifyContent="center"
        alignItems="center"
        bgcolor="#cbc9c8"
        p={3}
      >
        <Box
          component="form"
          onSubmit={handleSubmit(onSubmit)}
          sx={{
            width: "100%",
            maxWidth: "300px",
            padding: "2rem",
            bgcolor: "rgba(255, 255, 255, 0.8)",
            borderRadius: "16px",
            boxShadow: "0px 4px 12px rgba(0, 0, 0, 0.1)",
            border: "1px solid rgba(0, 0, 0, 0.2)",
            backdropFilter: "blur(10px)",
          }}
        >
          <Typography
            variant="h5"
            component="h2"
            gutterBottom
            textAlign="center"
          >
            Registro de Usuario
          </Typography>

          <TextField
            label="Correo Electrónico"
            fullWidth
            margin="normal"
            {...register("email")}
            error={!!errors.email}
            helperText={errors.email?.message}
          />
          <TextField
            label="Nombre Completo"
            fullWidth
            margin="normal"
            {...register("name")}
            error={!!errors.name}
            helperText={errors.name?.message}
          />
          <TextField
            label="Contraseña"
            type="password"
            fullWidth
            margin="normal"
            {...register("password")}
            error={!!errors.password}
            helperText={errors.password?.message}
          />
          <TextField
            label="Confirmar Contraseña"
            type="password"
            fullWidth
            margin="normal"
            {...register("confirmPassword", {
              validate: (value) =>
                value === password || "Las contraseñas no coinciden",
            })}
            error={!!errors.confirmPassword}
            helperText={errors.confirmPassword?.message}
          />
          <TextField
            label="Teléfono"
            fullWidth
            margin="normal"
            {...register("tel")}
            error={!!errors.tel}
            helperText={errors.tel?.message}
          />
          <TextField
            label="Fecha de Nacimiento"
            type="date"
            fullWidth
            margin="normal"
            {...register("birthdate")}
            InputLabelProps={{
              shrink: true,
            }}
            error={!!errors.birthdate}
            helperText={errors.birthdate?.message}
          />
          <Button
            type="submit"
            variant="contained"
            color="primary"
            fullWidth
            style={{ marginTop: "1rem", background: "#ffa436" }}
          >
            Registrar
          </Button>
        </Box>
      </Box>
    </Box>
  );
};
