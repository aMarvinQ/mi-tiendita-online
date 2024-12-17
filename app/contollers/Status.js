import statusModel from '../models/Status.js';

class StatusController {
    async getAllStatus (req, res){
        try {
            let status = await statusModel.findAll({});
            res.json(status)
        } catch ( err ) {
            res.status(500).send(`Error al buscar los estados: ${err.message}`);
        }
    }

    async updateStatus (req, res) {
        try {
            const status = await statusModel.findByPk(req.params.id);
            if (!status) {
                return res.status(404).send('Not found')
            }
            await status.update(req.body);
            res.json(status);
        } catch ( err ) {
            res.status(500).send(`Error al actualizar estado: ${err.message}`)
        }
    }
}

const statusController = new StatusController();
export default statusController;