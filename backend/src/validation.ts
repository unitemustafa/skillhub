import { z } from "zod";

const date = z.coerce.date();
const optionalText = z.string().trim().optional().nullable();

export const loginSchema = z.object({
  email: z.email(),
  password: z.string().min(6),
});

export const userSchema = z.object({
  name: z.string().trim().min(2),
  email: z.email().transform((value) => value.toLowerCase()),
  password: z.string().min(6),
  role: z.enum(["admin", "user"]).default("user"),
  activationPlan: z.enum(["monthly", "yearly", "permanent"]).default("monthly"),
});

export const playerSchema = z.object({
  name: z.string().trim().min(2),
  birthDate: date,
  phone: z.string().trim().min(10).max(20),
  guardianName: z.string().trim().min(2),
  guardianRelation: z.string().trim().min(1),
  guardianJob: optionalText,
  isActive: z.boolean().optional(),
});

export const subscriptionSchema = z
  .object({
    playerId: z.string().min(1),
    amount: z.coerce.number().positive(),
    startDate: date,
    endDate: date,
    notes: optionalText,
  })
  .refine((value) => value.endDate > value.startDate, {
    message: "تاريخ الانتهاء يجب أن يكون بعد تاريخ البداية",
    path: ["endDate"],
  });

export const evaluationSchema = z.object({
  playerId: z.string().min(1),
  coach: z.string().trim().min(2),
  evaluationDate: date.optional(),
  fitness: z.coerce.number().int().min(1).max(10),
  speed: z.coerce.number().int().min(1).max(10),
  skill: z.coerce.number().int().min(1).max(10),
  discipline: z.coerce.number().int().min(1).max(10),
  teamwork: z.coerce.number().int().min(1).max(10),
  notes: z.string().trim().default(""),
});

export const transactionSchema = z.object({
  type: z.enum(["income", "expense"]),
  category: z.string().trim().min(1),
  amount: z.coerce.number().positive(),
  description: z.string().trim().min(2),
  occurredAt: date.optional(),
});

export const messageSchema = z.object({
  playerId: z.string().optional().nullable(),
  recipient: z.string().trim().min(5),
  channel: z.enum(["whatsapp", "sms"]),
  body: z.string().trim().min(1).max(500),
  scheduledAt: date.optional().nullable(),
});
