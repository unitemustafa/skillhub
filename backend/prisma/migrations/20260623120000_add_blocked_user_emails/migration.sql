CREATE TABLE "BlockedUserEmail" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BlockedUserEmail_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "BlockedUserEmail_email_key" ON "BlockedUserEmail"("email");
CREATE INDEX "BlockedUserEmail_email_idx" ON "BlockedUserEmail"("email");
