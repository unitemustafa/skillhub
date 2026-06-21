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
});
