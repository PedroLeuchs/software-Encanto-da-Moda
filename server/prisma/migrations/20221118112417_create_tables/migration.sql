-- CreateTable
CREATE TABLE "Vendas_balcao" (
    "codigo_venda" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "cpf" INTEGER NOT NULL,
    "data" DATETIME NOT NULL,
    "total" REAL NOT NULL
);

-- CreateTable
CREATE TABLE "Itens_de_vendas" (
    "codigo_item" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "codigo_venda" INTEGER NOT NULL,
    "codigo_produto" INTEGER NOT NULL,
    "quantidade" INTEGER NOT NULL,
    "subtotal" REAL NOT NULL
);

-- CreateTable
CREATE TABLE "Cadastro_cliente" (
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

-- CreateTable
CREATE TABLE "Cadastro_produto" (
    "codigo_produto" TEXT NOT NULL PRIMARY KEY,
    "descricao" TEXT NOT NULL,
    "preco" REAL NOT NULL,
    "tamanho" TEXT NOT NULL,
    "cor" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "segmento" TEXT NOT NULL
);
