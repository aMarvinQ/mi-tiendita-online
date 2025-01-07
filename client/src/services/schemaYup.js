import * as yup from "yup";

export const schemaRegister = yup.object().shape({
  email: yup
    .string()
    .email("Debe ser un correo válido")
    .required("El correo es obligatorio"),
  name: yup
    .string()
    .min(2, "El nombre debe tener al menos 2 caracteres")
    .required("El nombre es obligatorio"),
  password: yup
    .string()
    .min(6, "La contraseña debe tener al menos 6 caracteres")
    .required("La contraseña es obligatoria"),
  confirmPassword: yup
    .string()
    .oneOf([yup.ref("password"), null], "Las contraseñas no coinciden")
    .required("La confirmación de la contraseña es obligatoria"),
  tel: yup
    .string()
    .matches(/^\d+$/, "El teléfono debe contener solo números")
    .min(8, "El teléfono debe tener 8 dígitos")
    .max(8, "El teléfono debe tener 8 dígitos")
    .required("El teléfono es obligatorio"),
  birthdate: yup
    .date()
    .max(new Date(Date.now() - 567648000000), "Debes tener al menos 18 años")
    .required("La fecha de nacimiento es obligatoria"),
});

export const schemaLogin = yup.object().shape({
  email: yup
    .string()
    .email("Debe ser un email válido")
    .required("El correo obligatorio"),
  password: yup.string()
                .required("La contraseña es obligatoria"),
});
