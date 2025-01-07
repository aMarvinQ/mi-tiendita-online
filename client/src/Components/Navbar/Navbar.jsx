// src/components/Navbar/Navbar.js
import React from "react";
import { AppBar, Toolbar, Typography, Box, IconButton, Button, Badge, Select, MenuItem } from "@mui/material";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import MenuIcon from "@mui/icons-material/Menu";
import {Link} from 'react-router-dom'
import './Navbar.css'

const Home = () => <Link to='/' className="titleNav">Inicio</Link>
const Products = () => <Link to='/products' className="titleNav">Productos</Link>

export const Navbar = () => {
  
  return (
    <AppBar position="static" sx={{ backgroundColor: "#ffa436" }}>
      <Toolbar>
        {/* Icono del Menú (opcional para móviles) */}
        <IconButton
          edge="start"
          color="inherit"
          aria-label="menu"
          sx={{ display: { xs: "flex", sm: "none" } }} // Solo visible en pantallas pequeñas
        >
          <MenuIcon />
        </IconButton>

        {/* Logo o Título */}
        <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
          Mi Tiendita Online
        </Typography>

        {/* Menú de Navegación */}
        <Box sx={{ display: { xs: "none", sm: "flex" } }}>
          <Button color="inherit">
            <Home />
          </Button>
          <Button color="inherit" href="/products">
            <Products />
          </Button>
          <Button color="inherit" href="/#">
            Categoría de productos
          </Button>
        </Box>

        {/* Ícono del carrito */}
        <IconButton color="inherit" href="/cart">
          <Badge badgeContent={3} color="error"> {/* Badge para mostrar cantidad */}
            <ShoppingCartIcon />
          </Badge>
        </IconButton>
      </Toolbar>
    </AppBar>
  );
};
