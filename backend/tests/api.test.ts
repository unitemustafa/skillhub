import request from 'supertest';
import { beforeAll, describe, expect, it } from 'vitest';
import { app } from '../src/app.js';

let token = '';

describe('SkillHub API', () => {
  beforeAll(async () => {
    const response = await request(app).post('/api/v1/auth/login').send({
      email: 'admin@skillhub.com',
      password: 'Admin123!',
    });
    token = response.body.token;
  });

  it('reports health', async () => {
    const response = await request(app).get('/api/v1/health');
    expect(response.status).toBe(200);
    expect(response.body.status).toBe('ok');
  });

  it('logs in and returns a JWT', () => expect(token).toBeTruthy());

  it('rejects protected routes without a token', async () => {
    expect((await request(app).get('/api/v1/players')).status).toBe(401);
  });

  it('lists players', async () => {
    const response = await request(app).get('/api/v1/players').set('Authorization', `Bearer ${token}`);
    expect(response.status).toBe(200);
    expect(response.body.items.length).toBeGreaterThan(0);
  });

  it('returns dashboard stats', async () => {
    const response = await request(app).get('/api/v1/dashboard').set('Authorization', `Bearer ${token}`);
    expect(response.status).toBe(200);
    expect(response.body.players).toBeGreaterThan(0);
  });
});
