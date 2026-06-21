import { Router } from 'express';
import bcrypt from 'bcryptjs';
import { prisma } from './db.js';
import { requireAuth, signToken } from './auth.js';
import { AppError } from './errors.js';
import {
  evaluationSchema,
  loginSchema,
  messageSchema,
  playerSchema,
  subscriptionSchema,
  transactionSchema,
  userSchema,
} from './validation.js';

export const api = Router();

api.get('/health', (_req, res) => {
  res.json({ status: 'ok', service: 'skillhub-api' });
});

api.post('/auth/login', async (req, res) => {
  const input = loginSchema.parse(req.body);
  const user = await prisma.user.findUnique({
    where: { email: input.email.toLowerCase() },
  });

  if (!user || !(await bcrypt.compare(input.password, user.passwordHash))) {
    throw new AppError(401, 'البريد الإلكتروني أو كلمة المرور غير صحيحة');
  }

  const token = signToken({ sub: user.id, email: user.email, role: user.role });
  res.json({
    token,
    user: { id: user.id, name: user.name, email: user.email, role: user.role },
  });
});

api.use(requireAuth);

const requireAdmin = (role: string) => {
  if (role !== 'admin') {
    throw new AppError(403, 'غير مسموح بتنفيذ هذا الإجراء');
  }
};

api.get('/auth/me', async (_req, res) => {
  const user = await prisma.user.findUnique({
    where: { id: res.locals.user.sub },
    select: { id: true, name: true, email: true, role: true, createdAt: true },
  });
  if (!user) throw new AppError(404, 'المستخدم غير موجود');
  res.json(user);
});

api.get('/users', async (_req, res) => {
  requireAdmin(res.locals.user.role);
  res.json(
    await prisma.user.findMany({
      select: {
        id: true,
        name: true,
        email: true,
        role: true,
        createdAt: true,
      },
      orderBy: { createdAt: 'desc' },
    }),
  );
});

api.post('/users', async (req, res) => {
  requireAdmin(res.locals.user.role);
  const input = userSchema.parse(req.body);
  const passwordHash = await bcrypt.hash(input.password, 12);
  const user = await prisma.user.upsert({
    where: { email: input.email },
    update: {
      name: input.name,
      passwordHash,
      role: input.role,
    },
    create: {
      name: input.name,
      email: input.email,
      passwordHash,
      role: input.role,
    },
    select: {
      id: true,
      name: true,
      email: true,
      role: true,
      createdAt: true,
    },
  });
  res.status(201).json(user);
});

api.get('/players', async (req, res) => {
  const search = String(req.query.search ?? '').trim();
  const status = String(req.query.status ?? 'all');
  const page = Math.max(1, Number(req.query.page ?? 1));
  const limit = Math.min(100, Math.max(1, Number(req.query.limit ?? 25)));
  const where = {
    ...(search
      ? {
          OR: [
            { name: { contains: search } },
            { phone: { contains: search } },
            { id: { contains: search } },
          ],
        }
      : {}),
    ...(status === 'active'
      ? { isActive: true }
      : status === 'inactive'
        ? { isActive: false }
        : {}),
  };

  const [items, total] = await prisma.$transaction([
    prisma.player.findMany({
      where,
      orderBy: { createdAt: 'desc' },
      skip: (page - 1) * limit,
      take: limit,
      include: { subscriptions: { orderBy: { endDate: 'desc' }, take: 1 } },
    }),
    prisma.player.count({ where }),
  ]);

  res.json({
    items,
    pagination: { page, limit, total, pages: Math.ceil(total / limit) },
  });
});

api.post('/players', async (req, res) => {
  const input = playerSchema.parse(req.body);
  const ids = await prisma.player.findMany({ select: { id: true } });
  const nextNumber = Math.max(
    1,
    ...ids.map((player) => Number(player.id.replace(/\D/g, '')) + 1),
  );
  const player = await prisma.player.create({
    data: { id: `Y-${String(nextNumber).padStart(4, '0')}`, ...input },
  });
  res.status(201).json(player);
});

api.get('/players/:id', async (req, res) => {
  const player = await prisma.player.findUnique({
    where: { id: req.params.id },
    include: {
      subscriptions: { orderBy: { startDate: 'desc' } },
      evaluations: { orderBy: { evaluationDate: 'desc' } },
      messages: { orderBy: { createdAt: 'desc' }, take: 20 },
    },
  });
  if (!player) throw new AppError(404, 'اللاعب غير موجود');
  res.json(player);
});

api.put('/players/:id', async (req, res) => {
  const input = playerSchema.parse(req.body);
  res.json(
    await prisma.player.update({ where: { id: req.params.id }, data: input }),
  );
});

api.delete('/players/:id', async (req, res) => {
  await prisma.player.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.get('/subscriptions', async (req, res) => {
  const now = new Date();
  const status = String(req.query.status ?? 'all');
  const where =
    status === 'active'
      ? { startDate: { lte: now }, endDate: { gte: now } }
      : status === 'expired'
        ? { endDate: { lt: now } }
        : {};

  res.json(
    await prisma.subscription.findMany({
      where,
      include: { player: true },
      orderBy: { endDate: 'asc' },
    }),
  );
});

api.post('/subscriptions', async (req, res) => {
  const input = subscriptionSchema.parse(req.body);
  const subscription = await prisma.$transaction(async (tx) => {
    const created = await tx.subscription.create({ data: input });
    await tx.player.update({
      where: { id: input.playerId },
      data: { isActive: true },
    });
    await tx.financeTransaction.create({
      data: {
        type: 'income',
        category: 'subscription',
        amount: input.amount,
        description: `اشتراك اللاعب ${input.playerId}`,
      },
    });
    return created;
  });
  res.status(201).json(subscription);
});

api.put('/subscriptions/:id', async (req, res) => {
  const input = subscriptionSchema.parse(req.body);
  res.json(
    await prisma.subscription.update({
      where: { id: req.params.id },
      data: input,
    }),
  );
});

api.delete('/subscriptions/:id', async (req, res) => {
  await prisma.subscription.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.get('/evaluations', async (req, res) => {
  const playerId = req.query.playerId ? String(req.query.playerId) : undefined;
  res.json(
    await prisma.evaluation.findMany({
      where: playerId ? { playerId } : {},
      include: { player: true },
      orderBy: { evaluationDate: 'desc' },
    }),
  );
});

api.post('/evaluations', async (req, res) => {
  const input = evaluationSchema.parse(req.body);
  res.status(201).json(await prisma.evaluation.create({ data: input }));
});

api.put('/evaluations/:id', async (req, res) => {
  const input = evaluationSchema.parse(req.body);
  res.json(
    await prisma.evaluation.update({
      where: { id: req.params.id },
      data: input,
    }),
  );
});

api.delete('/evaluations/:id', async (req, res) => {
  await prisma.evaluation.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.get('/finance/transactions', async (_req, res) => {
  res.json(
    await prisma.financeTransaction.findMany({
      orderBy: { occurredAt: 'desc' },
    }),
  );
});

api.post('/finance/transactions', async (req, res) => {
  const input = transactionSchema.parse(req.body);
  res
    .status(201)
    .json(await prisma.financeTransaction.create({ data: input }));
});

api.delete('/finance/transactions/:id', async (req, res) => {
  await prisma.financeTransaction.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.get('/messages', async (_req, res) => {
  res.json(
    await prisma.message.findMany({
      include: { player: true },
      orderBy: { createdAt: 'desc' },
    }),
  );
});

api.post('/messages', async (req, res) => {
  const input = messageSchema.parse(req.body);
  const scheduled = Boolean(input.scheduledAt && input.scheduledAt > new Date());
  const message = await prisma.message.create({
    data: {
      ...input,
      status: scheduled ? 'scheduled' : 'sent',
      sentAt: scheduled ? null : new Date(),
    },
  });
  res.status(201).json(message);
});

api.delete('/messages/:id', async (req, res) => {
  await prisma.message.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.get('/notifications', async (_req, res) => {
  res.json(
    await prisma.notification.findMany({
      orderBy: { createdAt: 'desc' },
      take: 100,
    }),
  );
});

api.patch('/notifications/read-all', async (_req, res) => {
  const result = await prisma.notification.updateMany({
    where: { isRead: false },
    data: { isRead: true },
  });
  res.json({ updated: result.count });
});

api.patch('/notifications/:id/read', async (req, res) => {
  res.json(
    await prisma.notification.update({
      where: { id: req.params.id },
      data: { isRead: true },
    }),
  );
});

api.delete('/notifications/:id', async (req, res) => {
  await prisma.notification.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.delete('/notifications', async (_req, res) => {
  await prisma.notification.deleteMany();
  res.status(204).end();
});

api.get('/dashboard', async (_req, res) => {
  const now = new Date();
  const monthStart = new Date(now.getFullYear(), now.getMonth(), 1);
  const monthEnd = new Date(now.getFullYear(), now.getMonth() + 1, 1);

  const [
    players,
    activePlayers,
    activeSubscriptions,
    expiringSubscriptions,
    evaluations,
    finances,
    unreadNotifications,
  ] = await prisma.$transaction([
    prisma.player.count(),
    prisma.player.count({ where: { isActive: true } }),
    prisma.subscription.count({
      where: { startDate: { lte: now }, endDate: { gte: now } },
    }),
    prisma.subscription.count({
      where: {
        endDate: {
          gte: now,
          lte: new Date(now.getTime() + 7 * 86400000),
        },
      },
    }),
    prisma.evaluation.count({
      where: { evaluationDate: { gte: monthStart, lt: monthEnd } },
    }),
    prisma.financeTransaction.findMany({
      where: { occurredAt: { gte: monthStart, lt: monthEnd } },
      select: { type: true, amount: true },
    }),
    prisma.notification.count({ where: { isRead: false } }),
  ]);

  const income = finances
    .filter((item) => item.type === 'income')
    .reduce((sum, item) => sum + item.amount, 0);
  const expenses = finances
    .filter((item) => item.type === 'expense')
    .reduce((sum, item) => sum + item.amount, 0);

  res.json({
    players,
    activePlayers,
    activeSubscriptions,
    expiringSubscriptions,
    evaluations,
    income,
    expenses,
    balance: income - expenses,
    unreadNotifications,
  });
});
