import type { ErrorRequestHandler, RequestHandler } from 'express';
import { Prisma } from '@prisma/client';
import { ZodError } from 'zod';

export class AppError extends Error {
  constructor(public status: number, message: string) {
    super(message);
  }
}

export const notFound: RequestHandler = (req, res) => {
  res.status(404).json({ error: 'المسار غير موجود', path: req.path });
};

export const errorHandler: ErrorRequestHandler = (error, _req, res, _next) => {
  if (error instanceof ZodError) {
    res
      .status(422)
      .json({ error: 'بيانات الطلب غير صالحة', details: error.issues });
    return;
  }

  if (error instanceof Prisma.PrismaClientKnownRequestError) {
    if (error.code === 'P2002') {
      res.status(409).json({ error: 'هذه البيانات مسجلة بالفعل' });
      return;
    }
    if (error.code === 'P2025') {
      res.status(404).json({ error: 'السجل غير موجود' });
      return;
    }
  }

  const status = error instanceof AppError ? error.status : 500;
  const message =
    status === 500 ? 'حدث خطأ داخلي في الخادم' : error.message;
  if (status === 500) console.error(error);
  res.status(status).json({ error: message });
};
