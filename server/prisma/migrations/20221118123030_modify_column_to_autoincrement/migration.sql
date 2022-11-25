/*
  Warnings:

  - The primary key for the `Cadastro_produto` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `codigo_produto` on the `Cadastro_produto` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Cadastro_produto" (
    "codigo_produto" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "descricao" TEXT NOT NULL,
    "preco" REAL NOT NULL,
    "tamanho" TEXT NOT NULL,
    "cor" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "segmento" TEXT NOT NULL
);
INSERT INTO "new_Cadastro_produto" ("codigo_produto", "cor", "descricao", "preco", "segmento", "sexo", "tamanho") SELECT "codigo_produto", "cor", "descricao", "preco", "segmento", "sexo", "tamanho" FROM "Cadastro_produto";
DROP TABLE "Cadastro_produto";
ALTER TABLE "new_Cadastro_produto" RENAME TO "Cadastro_produto";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
