/*
  Warnings:

  - You are about to alter the column `tel` on the `Cadastro_cliente` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Cadastro_cliente" (
    "nome_completo" TEXT NOT NULL,
    "cpf" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "tel" INTEGER NOT NULL,
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
