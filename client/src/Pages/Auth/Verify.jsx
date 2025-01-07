import React, { useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';

export const Verify = () => {
  const { token } = useParams();

  useEffect(() => {
    const verifyAccount = async () => {
      try {
        const response = await axios.get(`users/verify/${token}`);
        alert(response.data);
      } catch (error) {
        alert(error.response.data);
      }
    };

    verifyAccount();
  }, [token]);

  return <div>Verificando cuenta...</div>;
};
