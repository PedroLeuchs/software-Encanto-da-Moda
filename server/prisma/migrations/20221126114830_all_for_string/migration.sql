/*
  Warnings:

  - The primary key for the `Cadastro_cliente` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `cadastro_clienteCpf` on the `Vendas_balcao` table. All the data in the column will be lost.
  - The required column `id` was added to the `Cadastro_cliente` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `client_id` to the `Vendas_balcao` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Cadastro_cliente" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome_completo" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "tel" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "complemento" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "num_casa" TEXT NOT NULL
);
INSERT INTO "new_Cadastro_cliente" ("bairro", "cep", "cidade", "complemento", "cpf", "email", "estado", "nome_completo", "num_casa", "rua", "tel") SELECT "bairro", "cep", "cidade", "complemento", "cpf", "email", "estado", "nome_completo", "num_casa", "rua", "tel" FROM "Cadastro_cliente";
DROP TABLE "Cadastro_cliente";
ALTER TABLE "new_Cadastro_cliente" RENAME TO "Cadastro_cliente";
CREATE UNIQUE INDEX "Cadastro_cliente_cpf_key" ON "Cadastro_cliente"("cpf");
CREATE TABLE "new_Vendas_balcao" (
    "codigo_venda" TEXT NOT NULL PRIMARY KEY,
    "createdData" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total" REAL NOT NULL,
    "client_id" TEXT NOT NULL,
    CONSTRAINT "Vendas_balcao_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "Cadastro_cliente" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Vendas_balcao" ("codigo_venda", "createdData", "total") SELECT "codigo_venda", "createdData", "total" FROM "Vendas_balcao";
DROP TABLE "Vendas_balcao";
ALTER TABLE "new_Vendas_balcao" RENAME TO "Vendas_balcao";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
