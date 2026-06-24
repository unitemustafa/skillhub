import { prisma } from "../src/db.js";
import request from "supertest";
import { afterAll, beforeAll, describe, expect, it } from "vitest";
import { app } from "../src/app.js";

let token = "";
let isolatedToken = "";
let isolatedEmail = "";

describe("SkillHub API", () => {
  beforeAll(async () => {
    const response = await request(app).post("/api/v1/auth/login").send({
      email: "mustafa@admin.com",
      password: "01266666610",
    });
    token = response.body.token;

    isolatedEmail = `isolated-${Date.now()}@skillhub.test`;
    await request(app)
      .post("/api/v1/users")
      .set("Authorization", `Bearer ${token}`)
      .send({
        name: "Isolated Account",
        email: isolatedEmail,
        password: "Secret123",
        role: "user",
        activationPlan: "monthly",
      });

    const isolatedLogin = await request(app).post("/api/v1/auth/login").send({
      email: isolatedEmail,
      password: "Secret123",
    });
    isolatedToken = isolatedLogin.body.token;
  });

  afterAll(async () => {
    if (!isolatedEmail) return;
    const users = await request(app)
      .get("/api/v1/users")
      .set("Authorization", `Bearer ${token}`);
    const user = users.body.find(
      (item: { email: string }) => item.email === isolatedEmail,
    );
    if (user?.id) {
      await request(app)
        .delete(`/api/v1/users/${user.id}`)
        .set("Authorization", `Bearer ${token}`);
    }
  });

  it("reports health", async () => {
    const response = await request(app).get("/api/v1/health");
    expect(response.status).toBe(200);
    expect(response.body.status).toBe("ok");
  });

  it("logs in and returns a JWT", () => expect(token).toBeTruthy());

  it("rejects protected routes without a token", async () => {
    expect((await request(app).get("/api/v1/players")).status).toBe(401);
  });

  it("lists players", async () => {
    const response = await request(app)
      .get("/api/v1/players")
      .set("Authorization", `Bearer ${token}`);
    expect(response.status).toBe(200);
    expect(response.body.items.length).toBeGreaterThan(0);
  });

  it("returns dashboard stats", async () => {
    const response = await request(app)
      .get("/api/v1/dashboard")
      .set("Authorization", `Bearer ${token}`);
    expect(response.status).toBe(200);
    expect(response.body.players).toBeGreaterThan(0);
  });

  it("lists application users for admins", async () => {
    const response = await request(app)
      .get("/api/v1/users")
      .set("Authorization", `Bearer ${token}`);
    expect(response.status).toBe(200);
    expect(
      response.body.some(
        (user: { email: string }) => user.email === "mustafa@admin.com",
      ),
    ).toBe(true);
    expect(response.body[0].stats.playersCount).toBeTypeOf("number");
  });

  it("blocks recreating accounts deleted after activation expiry", async () => {
    const email = `expired-${Date.now()}@skillhub.test`;
    const createResponse = await request(app)
      .post("/api/v1/users")
      .set("Authorization", `Bearer ${token}`)
      .send({
        name: "Expired Account",
        email,
        password: "Secret123",
        role: "user",
        activationPlan: "monthly",
      });
    expect(createResponse.status).toBe(201);

    await prisma.user.update({
      where: { email },
      data: { activationEndsAt: new Date(Date.now() - 1000) },
    });

    const usersResponse = await request(app)
      .get("/api/v1/users")
      .set("Authorization", `Bearer ${token}`);
    expect(usersResponse.status).toBe(200);
    expect(
      usersResponse.body.some((user: { email: string }) => user.email === email),
    ).toBe(false);

    const recreateResponse = await request(app)
      .post("/api/v1/users")
      .set("Authorization", `Bearer ${token}`)
      .send({
        name: "Expired Account Again",
        email,
        password: "Secret123",
        role: "user",
        activationPlan: "monthly",
      });
    expect(recreateResponse.status).toBe(409);
  }, 15000);

  it("keeps player data scoped to the authenticated account", async () => {
    const initialList = await request(app)
      .get("/api/v1/players")
      .set("Authorization", `Bearer ${isolatedToken}`);
    expect(initialList.status).toBe(200);
    expect(initialList.body.items).toHaveLength(0);

    const created = await request(app)
      .post("/api/v1/players")
      .set("Authorization", `Bearer ${isolatedToken}`)
      .send({
        name: "Scoped Player",
        birthDate: "2014-01-01",
        phone: "01012345678",
        guardianName: "Scoped Guardian",
        guardianRelation: "parent",
        guardianJob: "coach",
        isActive: true,
      });
    expect(created.status).toBe(201);

    const scopedList = await request(app)
      .get("/api/v1/players")
      .set("Authorization", `Bearer ${isolatedToken}`);
    expect(
      scopedList.body.items.map((player: { id: string }) => player.id),
    ).toContain(created.body.id);

    const adminList = await request(app)
      .get("/api/v1/players")
      .set("Authorization", `Bearer ${token}`);
    expect(
      adminList.body.items.map((player: { id: string }) => player.id),
    ).not.toContain(created.body.id);

    const crossAccountRead = await request(app)
      .get(`/api/v1/players/${created.body.id}`)
      .set("Authorization", `Bearer ${token}`);
    expect(crossAccountRead.status).toBe(404);
  }, 15000);

  it("returns a sync snapshot scoped to the authenticated account", async () => {
    const isolatedSnapshot = await request(app)
      .get("/api/v1/sync/snapshot")
      .set("Authorization", `Bearer ${isolatedToken}`);
    expect(isolatedSnapshot.status).toBe(200);
    expect(isolatedSnapshot.body.serverTime).toBeTruthy();
    expect(isolatedSnapshot.body.snapshotGeneratedAt).toBeTruthy();
    expect(
      isolatedSnapshot.body.players.every(
        (player: { ownerId: string }) => player.ownerId !== undefined,
      ),
    ).toBe(true);

    const adminSnapshot = await request(app)
      .get("/api/v1/sync/snapshot")
      .set("Authorization", `Bearer ${token}`);
    expect(adminSnapshot.status).toBe(200);
    const isolatedIds = new Set(
      isolatedSnapshot.body.players.map((player: { id: string }) => player.id),
    );
    expect(
      adminSnapshot.body.players.some((player: { id: string }) =>
        isolatedIds.has(player.id),
      ),
    ).toBe(false);
  }, 15000);

  it("rejects sync snapshots for expired accounts", async () => {
    const email = `snapshot-expired-${Date.now()}@skillhub.test`;
    const createResponse = await request(app)
      .post("/api/v1/users")
      .set("Authorization", `Bearer ${token}`)
      .send({
        name: "Expired Snapshot Account",
        email,
        password: "Secret123",
        role: "user",
        activationPlan: "monthly",
      });
    expect(createResponse.status).toBe(201);

    const loginResponse = await request(app).post("/api/v1/auth/login").send({
      email,
      password: "Secret123",
    });
    expect(loginResponse.status).toBe(200);

    await prisma.user.update({
      where: { email },
      data: { activationEndsAt: new Date(Date.now() - 1000) },
    });

    const snapshot = await request(app)
      .get("/api/v1/sync/snapshot")
      .set("Authorization", `Bearer ${loginResponse.body.token}`);
    expect(snapshot.status).toBe(403);
  }, 15000);

  it("uses Idempotency-Key to avoid duplicate finance transactions", async () => {
    const idempotencyKey = `finance-${Date.now()}`;
    const payload = {
      type: "income",
      category: "manual",
      amount: 123,
      description: `Idempotent finance ${Date.now()}`,
    };

    const first = await request(app)
      .post("/api/v1/finance/transactions")
      .set("Authorization", `Bearer ${isolatedToken}`)
      .set("Idempotency-Key", idempotencyKey)
      .send(payload);
    const second = await request(app)
      .post("/api/v1/finance/transactions")
      .set("Authorization", `Bearer ${isolatedToken}`)
      .set("Idempotency-Key", idempotencyKey)
      .send(payload);

    expect(first.status).toBe(201);
    expect(second.status).toBe(201);
    expect(second.body.id).toBe(first.body.id);

    const transactions = await request(app)
      .get("/api/v1/finance/transactions")
      .set("Authorization", `Bearer ${isolatedToken}`);
    expect(
      transactions.body.filter(
        (item: { description: string }) =>
          item.description === payload.description,
      ),
    ).toHaveLength(1);
  }, 15000);
});
