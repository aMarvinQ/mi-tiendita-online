import sequelize from '../config/database.js';
import statusModel from '../models/Status.js'; //modelo necesario para el controlador "statusModel"

class StatusController {

    // crear estado con procedimiento almacenado
    createStatus = async (req, res) => {
        try {
            const { name } = req.body;
            await sequelize.query('EXEC p_insert_estados @nombre=:name',
                { replacements: { name }});
            return res.status(201).send(`Estado creado exitosamente`);
        } catch ( err ) {
            res.status(500).send(`Error al crear un nuevo estado: ${err.message}`)
        }
    }

    // ver todos los estados
    getAllStatus = async (req, res) => {
        try {
            const status = await statusModel.findAll({});
            res.json(status)
        } catch ( err ) {
            res.status(500).send(`Error al buscar los estados: ${err.message}`);
        }
    }

    // ver estado por id
    getOneStatus = async (req, res) => {
        try {
            const status = await statusModel.findByPk(req.params.id);
            if (status) {
                return res.status(200).json(status)
            }
            res.status(404).json({error: 'Estado no encontrado'})
        } catch ( err ) {
            res.status(500).send(`Error al buscar estado: ${err.message}`);
        }
    }

    // actualizar estados con procedimientos almacenados
    updateStatus = async (req, res) => {
        try {
            const { name } = req.body;
            const { id } = req.params;
            await sequelize.query('EXEC p_update_estado @idEstados=:id, @nombre=:name',
                { replacements: { id, name } });
            res.status(200).json(`Estado actualizado con exito`);
        } catch ( err ) {
            res.status(500).send(`Error al actualizar estado: ${err.message}`);
        }
    }

    // eliminar estados
    deleteStatus = async (req, res) => {
        try {
            const status = await statusModel.destroy({
                where: { idEstados: req.params.id }
            });
            if (status) {
                res.status(204).send('Estado eliminado con exito');
            }
            res.status(404).send('Estado no encontrado');
        } catch ( err ) {
            res.status(500).send(`Error al eliminar estado: ${err.message}`)
        }
    }

}

// exportación del controlador hacía las rutas
const statusController = new StatusController();
export default statusController;