import React from "react";
import { Route, Routes } from "react-router-dom";
import { Login, Register, Verify } from "./Pages/Auth";
import { ProductDetail, ProductList } from "./Pages/Products";
import { Cart } from "./Pages/Cart";
import { CatProducts } from "./Pages/CatProducts";
import { MainLayout } from "./Layouts/MainLayouts";
import {Home} from './Pages/Home/Home'
import { PrivateRoute } from "./Routes";
import { Dashboard, CreateUserForm, CreateCategoryForm, CreateProduct } from "./Pages/Admin";

function App() {
  return (
    <>
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/dashboard" element={<Dashboard />}  />
        <Route path="/createUser" element={<CreateUserForm />} />
        <Route path="/createCategory" element={<CreateCategoryForm />} />
        <Route path="/createProduct" element={<CreateProduct />} />
      
        <Route
          path="/"
          element={
            <PrivateRoute>
              <MainLayout />
            </PrivateRoute>
            }
          >
            <Route index element={<Home />} />
            <Route path="/products" element={<ProductList />} />
            <Route path="/product/:id" element={<ProductDetail />} />
            <Route path="/new-product" element={<CreateProduct />} />
            <Route path="/cart" element={<Cart />} />
            <Route path="/cat-products" element={<CatProducts />} />
          </Route>
        </Routes>
    </>
  );
}

export default App;
