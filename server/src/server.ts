import express from "express";
import cors from "cors";
import { PrismaClient } from "@prisma/client";

const app = express();

app.use(express.json());
app.use(cors());

const prisma = new PrismaClient({
  log: ["query"],
});

app.get("/produtos/:id/", async (request, response) => {
  const produtoId = request.params.id;

  const produto = await prisma.cadastro_produto.findUnique({
    select: {
      codigo_produto: true,
      descricao: true,
      cor: true,
      preco: true,
      segmento: true,
      sexo: true,
      tamanho: true,
    },
    where: {
      codigo_produto: Number(produtoId),
    },
  });
  return response.json(produto);
});

app.get("/clientes/:id/", async (request, response) => {
  const id = request.params.id;

  const cliente: any = await prisma.cadastro_cliente.findUnique({
    select: {
      bairro: true,
      cep: true,
      cidade: true,
      complemento: true,
      cpf: true,
      email: true,
      estado: true,
      nome_completo: true,
      num_casa: true,
      rua: true,
      tel: true,
    },
    where: {
      id,
    },
  });
  return response.json(cliente);
});

app.post("/clientes", async (request, response) => {
  const data = request.body;
  console.log(request.body);
  const cliente = await prisma.cadastro_cliente.create({
    data,
  });
  return response.json(cliente);
});
app.post("/produtos", async (request, response) => {
  const data = request.body;
  console.log(request.body);
  const produto = await prisma.cadastro_produto.create({
    data,
  });
  return response.json(produto);
});

// select codigo_produto, descricao from cadastro_produto where codigo_produto = produtoParametroId

app.listen(3333);

// http://localhost:3333/produtos
