import express from 'express';
import statusController from "../contollers/Status.js";

const router = express.Router();

router.get('/status', statusController.getAllStatus);
router.put('/status/:id', statusController.updateStatus);

export default router;

