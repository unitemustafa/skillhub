import express from 'express';
import cors from 'cors';
import { api } from './routes.js';
import { config } from './config.js';
import { errorHandler, notFound } from './errors.js';

export const app = express();
app.disable('x-powered-by');
app.use(cors({ origin: config.appOrigin === '*' ? true : config.appOrigin }));
app.use(express.json({ limit: '1mb' }));
app.use('/api/v1', api);
app.use(notFound);
app.use(errorHandler);
