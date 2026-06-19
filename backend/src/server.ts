import { app } from './app.js';
import { config } from './config.js';
import { prisma } from './db.js';

const server = app.listen(config.port, '0.0.0.0', () => {
  console.log(`SkillHub API running at http://localhost:${config.port}/api/v1`);
});

const shutdown = async () => {
  server.close();
  await prisma.$disconnect();
};

process.on('SIGINT', shutdown);
process.on('SIGTERM', shutdown);
