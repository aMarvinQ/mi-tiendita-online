import React, { useContext } from "react";
import { Link } from "react-router-dom";
import { Box, Typography, TextField, Button } from "@mui/material";
import { useForm } from "react-hook-form";

import axios from "../../services/axios.js";
import { yupResolver } from "@hookform/resolvers/yup";
import { schemaLogin as schema } from "../../services/schemaYup.js";
import { AuthContext } from "../../Context/AuthContext";

export const Login = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({ 
      resolver: yupResolver(schema) 
    });

const { login } = useContext(AuthContext)

  const onSubmit = async (data) => {
    try {
      const response = await axios.post("/users/login", data);
      login(response.data.token);
      alert("Inicio de sesión exitoso");
    } catch (err) {
      if (err.response?.status === 403) {
        alert("La cuenta no está activa. Verifica tu correo para activarla.");
    } else if (err.response?.status === 401) {
        alert("Correo o contraseña incorrectos.");
    } else {
        alert("Error al iniciar sesión. Intenta de nuevo más tarde.");
    }
    }
  };

  return (
    <Box
      display="flex"
      flexDirection={{ xs: "column", md: "row" }}
      minHeight="100vh"
      bgcolor={"#"}
    >
      {/* Lado izquierdo: mensaje de bienvenida */}
      <Box
        flex={1}
        display="flex"
        justifyContent="center"
        alignItems="center"
        bgcolor="#cbc9c8"
        p={3}
      >
        <Typography variant="h3" component="h1" textAlign="center" gutterBottom>
          Bienvenido a{" "}
          <span style={{ color: "#ffa436" }}>Mi Tiendita Online</span>
        </Typography>
      </Box>

      {/* Lado derecho: formulario de login */}
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
            Iniciar Sesión
          </Typography>

          <TextField
            fullWidth
            label="Correo Electrónico"
            margin="normal"
            {...register("email")}
            error={!!errors.email}
            helperText={errors.email?.message}
          />
          <TextField
            fullWidth
            type="password"
            label="Contraseña"
            margin="normal"
            {...register("password")}
            error={!!errors.password}
            helperText={errors.password?.message}
          />
          <Button
            type="submit"
            variant="contained"
            fullWidth
            style={{ marginTop: "1rem", background: "#ffa436" }}
          >
            Iniciar Sesión
          </Button>
          <Typography
            variant="body2"
            gutterBottom
            style={{ marginTop: "1rem" }}
          >
            ¿Aún no tienes cuanta?.{" "}
            <Link to={"/register"} style={{ color: "#ffa436" }}>
              Registrate
            </Link>
          </Typography>
        </Box>
      </Box>
    </Box>
  );
};
