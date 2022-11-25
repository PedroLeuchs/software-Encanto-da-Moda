const formCadCliente = document.querySelector("form");
const nome_completo = document.querySelector("#nome_completo");
const cpf = document.querySelector("#cpf");
const tel = document.querySelector("#tel");
const estado = document.querySelector("#estado");
const cidade = document.querySelector("#cidade");
const bairro = document.querySelector("#bairro");
const rua = document.querySelector("#rua");
const complemento = document.querySelector("#complemento");
const cep = document.querySelector("#cep");
const num_casa = document.querySelector("#num_casa");

formCadCliente.addEventListener("submit", (event) => {
  event.preventDefault();

  var newObj = {
    cpf: Number(cpf.value),
    tel: Number(tel.value),
    nome_completo: String(nome_completo.value),
    estado: String(estado.value),
    cidade: String(cidade.value),
    bairro: String(bairro.value),
    rua: String(rua.value),
    complemento: String(complemento.value),
    cep: Number(cep.value),
    num_casa: Number(num_casa.value),
  };

  console.log(newObj);

  fetch("http://localhost:3333/clientes/", {
    method: "POST",
    body: JSON.stringify(newObj),
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then((res) => res.json())
    .then((res) => console.log(res));
});
