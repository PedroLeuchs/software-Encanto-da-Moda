// const nome_completo = document.querySelector("#nome_completo");
// const cpf = document.querySelector("#cpf");
// const tel = document.querySelector("#tel");
// const estado = document.querySelector("#estado");
// const cidade = document.querySelector("#cidade");
// const bairro = document.querySelector("#bairro");
// const rua = document.querySelector("#rua");
// const complemento = document.querySelector("#complemento");
// const cep = document.querySelector("#cep");
// const num_casa = document.querySelector("#num_casa");

const formCadProduto = document.querySelector("form");
const codigo_produto = document.querySelector("#codigo_produto");
const descricao = document.querySelector("#descricao");
const preco = document.querySelector("#preco");
const tamanho = document.querySelector("#tamanho");
const cor = document.querySelector("#cor");
const sexo = document.querySelector("#sexo");
const segmento = document.querySelect("#segmento");

formCadProduto.addEventListener("submit", (event) => {
  event.preventDefault();

  var newObj = {
    codigo_produto: Number(cpf.value),
    descricao: String(descricao.value),
    preco: Float(preco.value),
    tamanho: String(tamanho.value),
    cor: String(cor.value),
    sexo: String(sexo.value),
    segmento: String(segmento.value),
  };

  console.log(newObj);

  fetch("http://localhost:3333/produtos/", {
    method: "POST",
    body: JSON.stringify(newObj),
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then((res) => res.json())
    .then((res) => console.log(res));
});
