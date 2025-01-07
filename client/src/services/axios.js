// importamos axios para la conexión de la api
import axios from 'axios'

// instanciamos la función create y almacenamos en una constante
const instance = axios.create({
    // endpoint de la api
    baseURL: 'http://localhost:3000/api',
    headers: {
        
        'Content-Type': 'application/json',
    }
})

// exportamos la constante hacía los componentes
export default instance;