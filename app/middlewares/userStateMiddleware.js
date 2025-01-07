import userModel from '../models/User.js'

const checkUserState = async ( req, res, next ) => {
    const userId = req.user.idUsuarios;

    try {
        const user = await userModel.findOne({where: { idUsuarios: userId}})

        if (!user || user.estados_idEstados !== 1) {
            return res.status(403).json({ message: 'Cuenta no activada o no encontrada.'});
        }

        next();
    } catch ( err ) {
        return res.statatus(500).json({ message: 'Error al verificar el estado del usuario. '})
    }
}

export default checkUserState;