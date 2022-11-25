/*
  Warnings:

  - You are about to drop the column `cpf` on the `Vendas_balcao` table. All the data in the column will be lost.
  - Added the required column `cadastro_clienteCpf` to the `Vendas_balcao` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Vendas_balcao" (
    "codigo_venda" TEXT NOT NULL PRIMARY KEY,
    "createdData" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total" REAL NOT NULL,
    "cadastro_clienteCpf" INTEGER NOT NULL,
    CONSTRAINT "Vendas_balcao_cadastro_clienteCpf_fkey" FOREIGN KEY ("cadastro_clienteCpf") REFERENCES "Cadastro_cliente" ("cpf") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Vendas_balcao" ("codigo_venda", "createdData", "total") SELECT "codigo_venda", "createdData", "total" FROM "Vendas_balcao";
DROP TABLE "Vendas_balcao";
ALTER TABLE "new_Vendas_balcao" RENAME TO "Vendas_balcao";
CREATE TABLE "new_Itens_de_vendas" (
    "codigo_item" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "quantidade" INTEGER NOT NULL,
    "subtotal" REAL NOT NULL,
    "codigo_venda" TEXT NOT NULL,
    "codigo_produto" INTEGER NOT NULL,
    CONSTRAINT "Itens_de_vendas_codigo_venda_fkey" FOREIGN KEY ("codigo_venda") REFERENCES "Vendas_balcao" ("codigo_venda") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Itens_de_vendas_codigo_produto_fkey" FOREIGN KEY ("codigo_produto") REFERENCES "Cadastro_produto" ("codigo_produto") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Itens_de_vendas" ("codigo_item", "codigo_produto", "codigo_venda", "quantidade", "subtotal") SELECT "codigo_item", "codigo_produto", "codigo_venda", "quantidade", "subtotal" FROM "Itens_de_vendas";
DROP TABLE "Itens_de_vendas";
ALTER TABLE "new_Itens_de_vendas" RENAME TO "Itens_de_vendas";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
