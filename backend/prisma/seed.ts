import { PrismaClient } from "@prisma/client";
import bcrypt from "bcryptjs";

const prisma = new PrismaClient();

const admins = [
  {
    email: "mustafa@admin.com",
    password: "01266666610",
    name: "مدير التطبيق",
  },
] as const;
const adminEmail = admins[0].email;
const adminPassword = admins[0].password;

const players = [
  {
    id: "Y-0066",
    name: "معتز بالله محمود",
    birthDate: "2010-12-17",
    phone: "01064610345",
    guardianName: "شيماء محمود",
    guardianRelation: "أم",
    guardianJob: "مدرسة",
    isActive: true,
  },
  {
    id: "Y-0065",
    name: "سومية أحمد سيد",
    birthDate: "2014-04-11",
    phone: "01009695550",
    guardianName: "أحمد سيد",
    guardianRelation: "أب",
    guardianJob: "محاسب",
    isActive: true,
  },
  {
    id: "Y-0064",
    name: "أنس أحمد سيد",
    birthDate: "2018-01-20",
    phone: "01009695550",
    guardianName: "أحمد سيد",
    guardianRelation: "أب",
    guardianJob: "محاسب",
    isActive: false,
  },
  {
    id: "Y-0063",
    name: "يحيى جابر محمد",
    birthDate: "2014-03-08",
    phone: "01018475533",
    guardianName: "جابر محمد",
    guardianRelation: "أب",
    guardianJob: null,
    isActive: true,
  },
] as const;

async function main() {
  const passwordHash = await bcrypt.hash(adminPassword, 12);

  const primaryAdmin = await prisma.user.upsert({
    where: { email: adminEmail },
    update: {
      name: "مدير النظام",
      passwordHash,
      role: "admin",
      activationPlan: "permanent",
      activationStartsAt: new Date(),
      activationEndsAt: null,
    },
    create: {
      name: "مدير النظام",
      email: adminEmail,
      passwordHash,
      role: "admin",
      activationPlan: "permanent",
      activationStartsAt: new Date(),
      activationEndsAt: null,
    },
  });
  const ownerId = primaryAdmin.id;

  await prisma.user.deleteMany({ where: { email: { not: adminEmail } } });

  for (const player of players) {
    await prisma.player.upsert({
      where: { id: player.id },
      update: {
        name: player.name,
        birthDate: new Date(player.birthDate),
        phone: player.phone,
        guardianName: player.guardianName,
        guardianRelation: player.guardianRelation,
        guardianJob: player.guardianJob,
        isActive: player.isActive,
        ownerId,
      },
      create: {
        ...player,
        ownerId,
        birthDate: new Date(player.birthDate),
      },
    });
  }

  if ((await prisma.subscription.count({ where: { ownerId } })) === 0) {
    const now = new Date();
    const endDate = new Date(now);
    endDate.setMonth(endDate.getMonth() + 1);

    await prisma.subscription.create({
      data: {
        ownerId,
        playerId: "Y-0066",
        amount: 500,
        startDate: now,
        endDate,
        notes: "اشتراك شهري",
      },
    });

    await prisma.financeTransaction.createMany({
      data: [
        {
          ownerId,
          type: "income",
          category: "subscription",
          amount: 500,
          description: "اشتراك اللاعب Y-0066",
        },
        {
          ownerId,
          type: "expense",
          category: "equipment",
          amount: 150,
          description: "شراء أدوات تدريب",
        },
      ],
    });
  }

  if ((await prisma.evaluation.count({ where: { ownerId } })) === 0) {
    await prisma.evaluation.create({
      data: {
        ownerId,
        playerId: "Y-0066",
        coach: "كابتن محمد",
        fitness: 8,
        speed: 7,
        skill: 9,
        discipline: 8,
        teamwork: 9,
        notes: "تطور واضح في التحكم بالكرة والالتزام بالتعليمات.",
      },
    });
  }

  if ((await prisma.notification.count({ where: { ownerId } })) === 0) {
    await prisma.notification.createMany({
      data: [
        {
          ownerId,
          title: "اشتراك يقترب من الانتهاء",
          body: "اشتراك معتز بالله ينتهي خلال 7 أيام",
          type: "subscription",
        },
        {
          ownerId,
          title: "تقييم جديد",
          body: "تم تسجيل تقييم جديد للاعب معتز بالله",
          type: "evaluation",
        },
      ],
    });
  }
}

main()
  .then(() => {
    console.log(`Database seeded. Login with ${adminEmail} / ${adminPassword}`);
  })
  .finally(() => prisma.$disconnect());
