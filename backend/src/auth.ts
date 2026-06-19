import type { RequestHandler } from 'express';
import jwt from 'jsonwebtoken';
import { config } from './config.js';
import { AppError } from './errors.js';

export type TokenPayload = { sub: string; email: string; role: string };

export const signToken = (payload: TokenPayload) =>
  jwt.sign(payload, config.jwtSecret, { expiresIn: '7d' });

export const requireAuth: RequestHandler = (req, res, next) => {
  const token = req.headers.authorization?.replace(/^Bearer\s+/i, '');
  if (!token) throw new AppError(401, 'يلزم تسجيل الدخول');

  try {
    res.locals.user = jwt.verify(token, config.jwtSecret) as TokenPayload;
    next();
  } catch {
    throw new AppError(401, 'جلسة الدخول غير صالحة أو منتهية');
  }
};
