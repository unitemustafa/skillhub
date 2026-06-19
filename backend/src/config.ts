import 'dotenv/config';

export const config = {
  port: Number(process.env.PORT ?? 3000),
  jwtSecret: process.env.JWT_SECRET ?? 'unsafe-development-secret',
  appOrigin: process.env.APP_ORIGIN ?? '*',
};
