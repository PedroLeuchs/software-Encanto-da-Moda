function openMenu() {
  document.body.classList.add("menu-expanded");
}
function closeMenu() {
  document.body.classList.remove("menu-expanded");
}

async function getProduto(codigoProduto) {
  return await fetch(`http://localhost:3333/produtos/${codigoProduto}`)
    .then((response) => response.json())
    .then((data) => data);
}

const btnSearch = document.querySelector(".search");
btnSearch.addEventListener("click", () => {
  (async () => {
    let codigoProduto = document.querySelector("#inputCodigoProduto").value;

    if (codigoProduto.length) {
      let produto = await getProduto(codigoProduto);
      if (!produto) {
        alert("Produto não encontrado");
        return;
      }

      document.querySelector("#inputProductName").value = produto.descricao;
      document.querySelector("#inputTamanho").value = produto.tamanho;
      document.querySelector("#inputCor").value = produto.cor;
      document.querySelector("#inputSexo").value = produto.sexo;
      document.querySelector("#inputSegmento").value = produto.segmento;
      document.querySelector("#inputPreco").value = produto.preco;
    } else {
      alert("Digite o código do produto");
    }
  })().catch(console.error);
});
async function getProduto(codigoProduto) {
  return await fetch(`http://localhost:3333/produtos/${codigoProduto}`)
    .then((response) => response.json())
    .then((data) => data);
}

async function getCliente(cpfCliente) {
  return await fetch(`http://localhost:3333/clientes/${cpfCliente}`)
    .then((response) => response.json())
    .then((data) => data);
}
const btnSearch2 = document.querySelector(".search2");
btnSearch2.addEventListener("click", () => {
  (async () => {
    let cpfCliente = document.querySelector("#inputcpfCliente").value;
    if (cpfCliente.length) {
      let cliente = await getCliente(cpfCliente);
      if (!cliente) {
        alert("Cliente não encontrado");
        return;
      }

      document.querySelector("#inputNomeCliente").value = cliente.nome_completo;
      document.querySelector("#inputCpfCliente").value = cliente.cpf;
      document.querySelector("#inputTelCliente").value = cliente.tel;
      document.querySelector("#inputEmailCliente").value = cliente.email;

      document.querySelector("#inputEstadoCliente").value = cliente.estado;
      document.querySelector("#inputRuaCliente").value = cliente.rua;
      document.querySelector("#inputBairroCliente").value = cliente.bairro;
      document.querySelector("#inputCidadeCliente").value = cliente.cidade;
      document.querySelector("#inputComplementoCliente").value =
        cliente.complemento;
      document.querySelector("#inputCepCliente").value = cliente.cep;
      document.querySelector("#inputnumCliente").value = cliente.num_casa;
    } else {
      alert("Digite o CPF do cliente");
    }
  })().catch(console.error);
});
async function getCliente(cpfCliente) {
  return await fetch(`http://localhost:3333/clientes/${cpfCliente}`)
    .then((response) => response.json())
    .then((data) => data);
}

app.listen(3333);
