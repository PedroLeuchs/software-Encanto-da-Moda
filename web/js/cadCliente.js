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
    cpf: String(cpf.value.toString()),
    tel: String(tel.value.toString()),
    nome_completo: String(nome_completo.value),
    estado: String(estado.value),
    cidade: String(cidade.value),
    bairro: String(bairro.value),
    rua: String(rua.value),
    complemento: String(complemento.value),
    cep: String(cep.value.toString()),
    num_casa: String(num_casa.value.toString()),
    email: String(email.value),
  };

  console.log(newObj);

  fetch("http://localhost:3333/clientes", {
    method: "POST",
    body: JSON.stringify(newObj),
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then((res) => res.json())
    .then((res) => console.log(res));
});
