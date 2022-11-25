/*
  Warnings:

  - You are about to alter the column `cadastro_clienteCpf` on the `Vendas_balcao` table. The data in that column could be lost. The data in that column will be cast from `String` to `BigInt`.
  - The primary key for the `Cadastro_cliente` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `cpf` on the `Cadastro_cliente` table. The data in that column could be lost. The data in that column will be cast from `String` to `BigInt`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Vendas_balcao" (
    "codigo_venda" TEXT NOT NULL PRIMARY KEY,
    "createdData" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total" REAL NOT NULL,
    "cadastro_clienteCpf" BIGINT NOT NULL,
    CONSTRAINT "Vendas_balcao_cadastro_clienteCpf_fkey" FOREIGN KEY ("cadastro_clienteCpf") REFERENCES "Cadastro_cliente" ("cpf") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Vendas_balcao" ("cadastro_clienteCpf", "codigo_venda", "createdData", "total") SELECT "cadastro_clienteCpf", "codigo_venda", "createdData", "total" FROM "Vendas_balcao";
DROP TABLE "Vendas_balcao";
ALTER TABLE "new_Vendas_balcao" RENAME TO "Vendas_balcao";
CREATE TABLE "new_Cadastro_cliente" (
    "nome_completo" TEXT NOT NULL,
    "cpf" BIGINT NOT NULL PRIMARY KEY,
    "tel" BIGINT NOT NULL,
    "email" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "complemento" TEXT NOT NULL,
    "cep" INTEGER NOT NULL,
    "num_casa" INTEGER NOT NULL
);
INSERT INTO "new_Cadastro_cliente" ("bairro", "cep", "cidade", "complemento", "cpf", "email", "estado", "nome_completo", "num_casa", "rua", "tel") SELECT "bairro", "cep", "cidade", "complemento", "cpf", "email", "estado", "nome_completo", "num_casa", "rua", "tel" FROM "Cadastro_cliente";
DROP TABLE "Cadastro_cliente";
ALTER TABLE "new_Cadastro_cliente" RENAME TO "Cadastro_cliente";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
