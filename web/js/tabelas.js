function removeClasses() {
  document.querySelectorAll(".btnAtivo").forEach((el) => {
    el.classList.remove("btnAtivo");
  });
  document.querySelectorAll(".ativo").forEach((el) => {
    el.classList.remove("ativo");
  });
}

function open(table, button) {
  table.classList.toggle("ativo");
  button.classList.toggle("btnAtivo");
}

function getTable() {
  var table = document.getElementById("table");
  var button = document.getElementById("action-btn");
  removeClasses();
  open(table, button);
}

function getTable2() {
  var table = document.getElementById("table2");
  var button = document.getElementById("action-btn2");
  removeClasses();
  open(table, button);
}
function getTable3() {
  var table = document.getElementById("table3");
  var button = document.getElementById("action-btn3");
  removeClasses();
  open(table, button);
}

function getModal() {
  var modal = document.getElementById("modal-container");
  var modal2 = document.getElementById("modal-container2");
  var button = document.querySelector("#openModal");

  document.querySelectorAll(".ativo").forEach((el) => {
    if (el.id === "table") {
      open(modal, button);
    } else if (el.id === "table2") {
      open(modal2, button);
    }
  });
}

function closeModal(modal) {
  document.getElementById(modal).classList.remove("ativo");
  document.getElementById("openModal").classList.remove("btnAtivo");
}
