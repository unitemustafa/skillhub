import { Router, type Response } from 'express';
import { Prisma } from '@prisma/client';
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

const currentUserId = (res: Response) => res.locals.user.sub as string;

const requireAdmin = (role: string) => {
  if (role !== 'admin') {
    throw new AppError(403, 'غير مسموح بتنفيذ هذا الإجراء');
  }
};

const ensureOwnedPlayer = async (playerId: string, ownerId: string) => {
  const player = await prisma.player.findFirst({
    where: { id: playerId, ownerId },
    select: { id: true },
  });
  if (!player) throw new AppError(404, 'اللاعب غير موجود');
  return player;
};

const nextPlayerId = async (ownerId: string) => {
  const [ids, allIds] = await Promise.all([
    prisma.player.findMany({
      where: { ownerId },
      select: { id: true },
    }),
    prisma.player.findMany({ select: { id: true } }),
  ]);
  const usedIds = new Set(allIds.map((player) => player.id));
  let nextNumber = Math.max(
    1,
    ...ids.map((player) => Number(player.id.replace(/\D/g, '')) + 1),
  );

  while (true) {
    const candidate = `Y-${String(nextNumber).padStart(4, '0')}`;
    if (!usedIds.has(candidate)) return candidate;
    nextNumber += 1;
  }
};

const isUniqueConflict = (error: unknown) =>
  error instanceof Prisma.PrismaClientKnownRequestError &&
  error.code === 'P2002';

const createOwnedPlayer = async (
  ownerId: string,
  input: ReturnType<typeof playerSchema.parse>,
) => {
  for (let attempt = 0; attempt < 5; attempt += 1) {
    try {
      return await prisma.player.create({
        data: { id: await nextPlayerId(ownerId), ownerId, ...input },
      });
    } catch (error) {
      if (!isUniqueConflict(error)) throw error;
    }
  }
  throw new AppError(409, 'تعذر إنشاء رقم جديد للاعب');
};

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

api.get('/auth/me', async (_req, res) => {
  const user = await prisma.user.findUnique({
    where: { id: currentUserId(res) },
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
  const ownerId = currentUserId(res);
  const search = String(req.query.search ?? '').trim();
  const status = String(req.query.status ?? 'all');
  const page = Math.max(1, Number(req.query.page ?? 1));
  const limit = Math.min(100, Math.max(1, Number(req.query.limit ?? 25)));
  const where = {
    ownerId,
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
      include: {
        subscriptions: {
          where: { ownerId },
          orderBy: { endDate: 'desc' },
          take: 1,
        },
      },
    }),
    prisma.player.count({ where }),
  ]);

  res.json({
    items,
    pagination: { page, limit, total, pages: Math.ceil(total / limit) },
  });
});

api.post('/players', async (req, res) => {
  const ownerId = currentUserId(res);
  const input = playerSchema.parse(req.body);
  const player = await createOwnedPlayer(ownerId, input);
  res.status(201).json(player);
});

api.get('/players/:id', async (req, res) => {
  const ownerId = currentUserId(res);
  const player = await prisma.player.findFirst({
    where: { id: req.params.id, ownerId },
    include: {
      subscriptions: { where: { ownerId }, orderBy: { startDate: 'desc' } },
      evaluations: { where: { ownerId }, orderBy: { evaluationDate: 'desc' } },
      messages: {
        where: { ownerId },
        orderBy: { createdAt: 'desc' },
        take: 20,
      },
    },
  });
  if (!player) throw new AppError(404, 'اللاعب غير موجود');
  res.json(player);
});

api.put('/players/:id', async (req, res) => {
  const ownerId = currentUserId(res);
  const input = playerSchema.parse(req.body);
  await ensureOwnedPlayer(req.params.id, ownerId);
  res.json(
    await prisma.player.update({ where: { id: req.params.id }, data: input }),
  );
});

api.delete('/players/:id', async (req, res) => {
  const ownerId = currentUserId(res);
  await ensureOwnedPlayer(req.params.id, ownerId);
  await prisma.player.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.get('/subscriptions', async (req, res) => {
  const ownerId = currentUserId(res);
  const now = new Date();
  const status = String(req.query.status ?? 'all');
  const where =
    status === 'active'
      ? { ownerId, startDate: { lte: now }, endDate: { gte: now } }
      : status === 'expired'
        ? { ownerId, endDate: { lt: now } }
        : { ownerId };

  res.json(
    await prisma.subscription.findMany({
      where,
      include: { player: true },
      orderBy: { endDate: 'asc' },
    }),
  );
});

api.post('/subscriptions', async (req, res) => {
  const ownerId = currentUserId(res);
  const input = subscriptionSchema.parse(req.body);
  await ensureOwnedPlayer(input.playerId, ownerId);
  const subscription = await prisma.$transaction(async (tx) => {
    const created = await tx.subscription.create({
      data: { ...input, ownerId },
    });
    await tx.player.update({
      where: { id: input.playerId },
      data: { isActive: true },
    });
    await tx.financeTransaction.create({
      data: {
        ownerId,
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
  const ownerId = currentUserId(res);
  const input = subscriptionSchema.parse(req.body);
  const existing = await prisma.subscription.findFirst({
    where: { id: req.params.id, ownerId },
    select: { id: true },
  });
  if (!existing) throw new AppError(404, 'الاشتراك غير موجود');
  await ensureOwnedPlayer(input.playerId, ownerId);
  res.json(
    await prisma.subscription.update({
      where: { id: req.params.id },
      data: { ...input, ownerId },
    }),
  );
});

api.delete('/subscriptions/:id', async (req, res) => {
  const ownerId = currentUserId(res);
  const existing = await prisma.subscription.findFirst({
    where: { id: req.params.id, ownerId },
    select: { id: true },
  });
  if (!existing) throw new AppError(404, 'الاشتراك غير موجود');
  await prisma.subscription.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.get('/evaluations', async (req, res) => {
  const ownerId = currentUserId(res);
  const playerId = req.query.playerId ? String(req.query.playerId) : undefined;
  if (playerId) await ensureOwnedPlayer(playerId, ownerId);
  res.json(
    await prisma.evaluation.findMany({
      where: playerId ? { ownerId, playerId } : { ownerId },
      include: { player: true },
      orderBy: { evaluationDate: 'desc' },
    }),
  );
});

api.post('/evaluations', async (req, res) => {
  const ownerId = currentUserId(res);
  const input = evaluationSchema.parse(req.body);
  await ensureOwnedPlayer(input.playerId, ownerId);
  res
    .status(201)
    .json(await prisma.evaluation.create({ data: { ...input, ownerId } }));
});

api.put('/evaluations/:id', async (req, res) => {
  const ownerId = currentUserId(res);
  const input = evaluationSchema.parse(req.body);
  const existing = await prisma.evaluation.findFirst({
    where: { id: req.params.id, ownerId },
    select: { id: true },
  });
  if (!existing) throw new AppError(404, 'التقييم غير موجود');
  await ensureOwnedPlayer(input.playerId, ownerId);
  res.json(
    await prisma.evaluation.update({
      where: { id: req.params.id },
      data: { ...input, ownerId },
    }),
  );
});

api.delete('/evaluations/:id', async (req, res) => {
  const ownerId = currentUserId(res);
  const existing = await prisma.evaluation.findFirst({
    where: { id: req.params.id, ownerId },
    select: { id: true },
  });
  if (!existing) throw new AppError(404, 'التقييم غير موجود');
  await prisma.evaluation.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.get('/finance/transactions', async (_req, res) => {
  const ownerId = currentUserId(res);
  res.json(
    await prisma.financeTransaction.findMany({
      where: { ownerId },
      orderBy: { occurredAt: 'desc' },
    }),
  );
});

api.post('/finance/transactions', async (req, res) => {
  const ownerId = currentUserId(res);
  const input = transactionSchema.parse(req.body);
  res
    .status(201)
    .json(
      await prisma.financeTransaction.create({ data: { ...input, ownerId } }),
    );
});

api.delete('/finance/transactions/:id', async (req, res) => {
  const ownerId = currentUserId(res);
  const existing = await prisma.financeTransaction.findFirst({
    where: { id: req.params.id, ownerId },
    select: { id: true },
  });
  if (!existing) throw new AppError(404, 'المعاملة المالية غير موجودة');
  await prisma.financeTransaction.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.get('/messages', async (_req, res) => {
  const ownerId = currentUserId(res);
  res.json(
    await prisma.message.findMany({
      where: { ownerId },
      include: { player: true },
      orderBy: { createdAt: 'desc' },
    }),
  );
});

api.post('/messages', async (req, res) => {
  const ownerId = currentUserId(res);
  const input = messageSchema.parse(req.body);
  if (input.playerId) await ensureOwnedPlayer(input.playerId, ownerId);
  const scheduled = Boolean(input.scheduledAt && input.scheduledAt > new Date());
  const message = await prisma.message.create({
    data: {
      ...input,
      ownerId,
      status: scheduled ? 'scheduled' : 'sent',
      sentAt: scheduled ? null : new Date(),
    },
  });
  res.status(201).json(message);
});

api.delete('/messages/:id', async (req, res) => {
  const ownerId = currentUserId(res);
  const existing = await prisma.message.findFirst({
    where: { id: req.params.id, ownerId },
    select: { id: true },
  });
  if (!existing) throw new AppError(404, 'الرسالة غير موجودة');
  await prisma.message.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.get('/notifications', async (_req, res) => {
  const ownerId = currentUserId(res);
  res.json(
    await prisma.notification.findMany({
      where: { ownerId },
      orderBy: { createdAt: 'desc' },
      take: 100,
    }),
  );
});

api.patch('/notifications/read-all', async (_req, res) => {
  const ownerId = currentUserId(res);
  const result = await prisma.notification.updateMany({
    where: { ownerId, isRead: false },
    data: { isRead: true },
  });
  res.json({ updated: result.count });
});

api.patch('/notifications/:id/read', async (req, res) => {
  const ownerId = currentUserId(res);
  const existing = await prisma.notification.findFirst({
    where: { id: req.params.id, ownerId },
    select: { id: true },
  });
  if (!existing) throw new AppError(404, 'الإشعار غير موجود');
  res.json(
    await prisma.notification.update({
      where: { id: req.params.id },
      data: { isRead: true },
    }),
  );
});

api.delete('/notifications/:id', async (req, res) => {
  const ownerId = currentUserId(res);
  const existing = await prisma.notification.findFirst({
    where: { id: req.params.id, ownerId },
    select: { id: true },
  });
  if (!existing) throw new AppError(404, 'الإشعار غير موجود');
  await prisma.notification.delete({ where: { id: req.params.id } });
  res.status(204).end();
});

api.delete('/notifications', async (_req, res) => {
  const ownerId = currentUserId(res);
  await prisma.notification.deleteMany({ where: { ownerId } });
  res.status(204).end();
});

api.get('/dashboard', async (_req, res) => {
  const ownerId = currentUserId(res);
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
    prisma.player.count({ where: { ownerId } }),
    prisma.player.count({ where: { ownerId, isActive: true } }),
    prisma.subscription.count({
      where: { ownerId, startDate: { lte: now }, endDate: { gte: now } },
    }),
    prisma.subscription.count({
      where: {
        ownerId,
        endDate: {
          gte: now,
          lte: new Date(now.getTime() + 7 * 86400000),
        },
      },
    }),
    prisma.evaluation.count({
      where: { ownerId, evaluationDate: { gte: monthStart, lt: monthEnd } },
    }),
    prisma.financeTransaction.findMany({
      where: { ownerId, occurredAt: { gte: monthStart, lt: monthEnd } },
      select: { type: true, amount: true },
    }),
    prisma.notification.count({ where: { ownerId, isRead: false } }),
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
