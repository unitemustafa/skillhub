import 'dotenv/config';

const normalizeOrigin = (value: string) => {
  if (value === '*') return value;
  try {
    return new URL(value).origin;
  } catch {
    return value;
  }
};

export const config = {
  port: Number(process.env.PORT ?? 3000),
  jwtSecret: process.env.JWT_SECRET ?? 'unsafe-development-secret',
  appOrigin: normalizeOrigin(process.env.APP_ORIGIN ?? '*'),
};
