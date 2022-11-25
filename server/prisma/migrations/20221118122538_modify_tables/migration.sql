/*
  Warnings:

  - The primary key for the `Vendas_balcao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `data` on the `Vendas_balcao` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Vendas_balcao" (
    "codigo_venda" TEXT NOT NULL PRIMARY KEY,
    "cpf" INTEGER NOT NULL,
    "createdData" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total" REAL NOT NULL
);
INSERT INTO "new_Vendas_balcao" ("codigo_venda", "cpf", "total") SELECT "codigo_venda", "cpf", "total" FROM "Vendas_balcao";
DROP TABLE "Vendas_balcao";
ALTER TABLE "new_Vendas_balcao" RENAME TO "Vendas_balcao";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
