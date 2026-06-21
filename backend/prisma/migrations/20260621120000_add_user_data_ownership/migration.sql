ALTER TABLE "Player" ADD COLUMN "ownerId" TEXT;
ALTER TABLE "Subscription" ADD COLUMN "ownerId" TEXT;
ALTER TABLE "Evaluation" ADD COLUMN "ownerId" TEXT;
ALTER TABLE "FinanceTransaction" ADD COLUMN "ownerId" TEXT;
ALTER TABLE "Message" ADD COLUMN "ownerId" TEXT;
ALTER TABLE "Notification" ADD COLUMN "ownerId" TEXT;

WITH fallback_user AS (
  SELECT "id"
  FROM "User"
  ORDER BY "createdAt" ASC
  LIMIT 1
)
UPDATE "Player"
SET "ownerId" = (SELECT "id" FROM fallback_user)
WHERE "ownerId" IS NULL;

UPDATE "Subscription"
SET "ownerId" = "Player"."ownerId"
FROM "Player"
WHERE "Subscription"."playerId" = "Player"."id"
  AND "Subscription"."ownerId" IS NULL;

UPDATE "Evaluation"
SET "ownerId" = "Player"."ownerId"
FROM "Player"
WHERE "Evaluation"."playerId" = "Player"."id"
  AND "Evaluation"."ownerId" IS NULL;

WITH fallback_user AS (
  SELECT "id"
  FROM "User"
  ORDER BY "createdAt" ASC
  LIMIT 1
)
UPDATE "FinanceTransaction"
SET "ownerId" = (SELECT "id" FROM fallback_user)
WHERE "ownerId" IS NULL;

UPDATE "Message"
SET "ownerId" = "Player"."ownerId"
FROM "Player"
WHERE "Message"."playerId" = "Player"."id"
  AND "Message"."ownerId" IS NULL;

WITH fallback_user AS (
  SELECT "id"
  FROM "User"
  ORDER BY "createdAt" ASC
  LIMIT 1
)
UPDATE "Message"
SET "ownerId" = (SELECT "id" FROM fallback_user)
WHERE "ownerId" IS NULL;

WITH fallback_user AS (
  SELECT "id"
  FROM "User"
  ORDER BY "createdAt" ASC
  LIMIT 1
)
UPDATE "Notification"
SET "ownerId" = (SELECT "id" FROM fallback_user)
WHERE "ownerId" IS NULL;

ALTER TABLE "Player" ALTER COLUMN "ownerId" SET NOT NULL;
ALTER TABLE "Subscription" ALTER COLUMN "ownerId" SET NOT NULL;
ALTER TABLE "Evaluation" ALTER COLUMN "ownerId" SET NOT NULL;
ALTER TABLE "FinanceTransaction" ALTER COLUMN "ownerId" SET NOT NULL;
ALTER TABLE "Message" ALTER COLUMN "ownerId" SET NOT NULL;
ALTER TABLE "Notification" ALTER COLUMN "ownerId" SET NOT NULL;

CREATE INDEX "Player_ownerId_idx" ON "Player"("ownerId");
CREATE INDEX "Player_ownerId_name_idx" ON "Player"("ownerId", "name");
CREATE INDEX "Player_ownerId_phone_idx" ON "Player"("ownerId", "phone");
CREATE INDEX "Subscription_ownerId_idx" ON "Subscription"("ownerId");
CREATE INDEX "Subscription_ownerId_endDate_idx" ON "Subscription"("ownerId", "endDate");
CREATE INDEX "Evaluation_ownerId_idx" ON "Evaluation"("ownerId");
CREATE INDEX "Evaluation_ownerId_evaluationDate_idx" ON "Evaluation"("ownerId", "evaluationDate");
CREATE INDEX "FinanceTransaction_ownerId_idx" ON "FinanceTransaction"("ownerId");
CREATE INDEX "FinanceTransaction_ownerId_occurredAt_idx" ON "FinanceTransaction"("ownerId", "occurredAt");
CREATE INDEX "Message_ownerId_idx" ON "Message"("ownerId");
CREATE INDEX "Message_ownerId_createdAt_idx" ON "Message"("ownerId", "createdAt");
CREATE INDEX "Notification_ownerId_idx" ON "Notification"("ownerId");
CREATE INDEX "Notification_ownerId_createdAt_idx" ON "Notification"("ownerId", "createdAt");

ALTER TABLE "Player" ADD CONSTRAINT "Player_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "Evaluation" ADD CONSTRAINT "Evaluation_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "FinanceTransaction" ADD CONSTRAINT "FinanceTransaction_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "Message" ADD CONSTRAINT "Message_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
