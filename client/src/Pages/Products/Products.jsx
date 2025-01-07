// import React, { useState, useEffect } from 'react';
// import axios from '../../services/axios.js';
// import { Box, Typography, Pagination, CircularProgress, Card, CardContent } from '@mui/material';


// export const ProductList = () => {
//     const [products, setProducts] = useState([]);
//     const [loading, setLoading] = useState(false);
//     const [totalPages, setTotalPages] = useState(1);
//     const [itemsPerPage] = useState(10);

//     const fetchProducts = async (page) => {
//         try {
//             const response = await axios.get('/allProducts', {
//                 params: { page, limit: itemsPerPage },
//             });
//             console.log(response.data); // Verifica la respuesta
//             setProducts(response.data.data);
//             setTotalPages(response.data.totalPages);
//         } catch (error) {
//             console.error('Error fetching products:', error);
//             setProducts([]);
//         }
//     };

//     useEffect(() => {
//         fetchProducts(1); 
//     }, []);

//     const handlePageChange = (event, value) => {
//         fetchProducts(value);
//     };

//     return (
//         <Box sx={{ padding: 4 }}>
//             <Typography variant="h4" gutterBottom>Lista de Productos</Typography>
//             {loading ? (
//                 <CircularProgress />
//             ) : (
//                 <>
//                     <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 2 }}>
//                         {products.map(product => (
//                             <Card key={product.id} sx={{ width: 'calc(25% - 16px)', boxShadow: 3 }}>
//                                 <CardContent>
//                                     <Typography variant="h6">{product.nombre}</Typography>
//                                     <Typography variant="body1">${product.precio}</Typography>
//                                 </CardContent>
//                             </Card>
//                         ))}
//                     </Box>
//                     <Pagination
//                         count={totalPages}
//                         onChange={handlePageChange}
//                         sx={{ marginTop: 4, display: 'flex', justifyContent: 'center' }}
//                     />
//                 </>
//             )}
//         </Box>
//     );
// };

// ProductList.js

import React, { useState, useEffect } from 'react';
import { Box, Typography, Pagination, CircularProgress } from '@mui/material';
import axios from '../../services/axios.js';
import {ProductCard} from './ProductCard'; // Asegúrate de importar el nuevo componente

export const ProductList = () => {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(false);
  const [totalPages, setTotalPages] = useState(1);
  const [itemsPerPage] = useState(10);

  const fetchProducts = async (page) => {
    try {
      const response = await axios.get('/allProducts', {
        params: { page, limit: itemsPerPage },
      });
      setProducts(response.data.data);
      setTotalPages(response.data.totalPages);
    } catch (error) {
      console.error('Error fetching products:', error);
      setProducts([]);
    }
  };

  useEffect(() => {
    fetchProducts(1);
  }, []);

  const handlePageChange = (event, value) => {
    fetchProducts(value);
  };

  return (
    <Box sx={{ padding: 4 }}>
      <Typography variant="h4" gutterBottom>
        Lista de Productos
      </Typography>
      {loading ? (
        <CircularProgress />
      ) : (
        <>
          <Box
            sx={{
              display: 'flex',
              flexWrap: 'wrap',
              gap: 2,
              justifyContent: 'center',
              marginTop: 2,
            }}
          >
            {products.length > 0 ? (
              products.map((product) => (
                <ProductCard key={product.idProductos} product={product} /> // Usamos ProductCard aquí
              ))
            ) : (
              <Typography variant="body1" textAlign="center" sx={{ marginTop: 4 }}>
                No hay productos disponibles.
              </Typography>
            )}
          </Box>
          <Pagination
            count={totalPages}
            onChange={handlePageChange}
            sx={{ marginTop: 4, display: 'flex', justifyContent: 'center' }}
          />
        </>
      )}
    </Box>
  );
};
