/*
  Warnings:

  - You are about to drop the `Schedule` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserSchedule` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `password` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "UserSchedule" DROP CONSTRAINT "UserSchedule_scheduleId_fkey";

-- DropForeignKey
ALTER TABLE "UserSchedule" DROP CONSTRAINT "UserSchedule_userId_fkey";

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "password" TEXT NOT NULL;

-- DropTable
DROP TABLE "Schedule";

-- DropTable
DROP TABLE "UserSchedule";

-- CreateTable
CREATE TABLE "schedules" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "sendDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "schedules_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users_schedules" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "scheduleId" INTEGER NOT NULL,

    CONSTRAINT "users_schedules_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "users_schedules" ADD CONSTRAINT "users_schedules_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users_schedules" ADD CONSTRAINT "users_schedules_scheduleId_fkey" FOREIGN KEY ("scheduleId") REFERENCES "schedules"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
