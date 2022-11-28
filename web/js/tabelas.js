var button = document.getElementById("action-btn");
var table = document.getElementById("table");
var button2 = document.getElementById("action-btn2");
var table2 = document.getElementById("table2");
var button3 = document.getElementById("action-btn3");
var table3 = document.getElementById("table3");
var modal = document.getElementById("modal-container");
var modal2 = document.getElementById("modal-container2");
var modal3 = document.getElementById("modal-container3");

function getTable() {
  var table = document.getElementById("table");

  if (table.style.display === "none") {
    table.style.display = "flex";
    table2.style.display = "none";
    table3.style.display = "none";
    button.style.backgroundColor = "#6F6C72";
    button2.style.backgroundColor = "#2d2c30";
    button3.style.backgroundColor = "#2d2c30";
  } else {
    table.style.display = "none";
    button.style.backgroundColor = "#2d2c30";
  }
}
function getTable2() {
  if (table2.style.display === "none") {
    table.style.display = "none";
    table2.style.display = "flex";
    table3.style.display = "none";
    button.style.backgroundColor = "#2d2c30";
    button2.style.backgroundColor = "#6F6C72";
    button3.style.backgroundColor = "#2d2c30";
  } else {
    table2.style.display = "none";
    button2.style.backgroundColor = "#2d2c30";
  }
}
function getTable3() {
  if (table3.style.display === "none") {
    table.style.display = "none";
    table2.style.display = "none";
    table3.style.display = "flex";
    button.style.backgroundColor = "#2d2c30";
    button2.style.backgroundColor = "#2d2c30";
    button3.style.backgroundColor = "#6F6C72";
  } else {
    table3.style.display = "none";
    button3.style.backgroundColor = "#2d2c30";
  }
}

function getModal() {
  if (table.style.display === "flex") {
    if (modal.style.display === "none") {
      modal.style.display = "flex";
    } else {
      modal.style.display = "none";
    }
  }
}
function getModal2() {
  if (table2.style.display === "flex") {
    if (modal2.style.display === "none") {
      modal2.style.display = "flex";
    } else {
      modal2.style.display = "none";
    }
  }
}
function getModal3() {
  if (table3.style.display === "flex") {
    if (modal3.style.display === "none") {
      modal3.style.display = "flex";
    } else {
      modal3.style.display = "none";
    }
  }
}

// function getModal() {
//   if (modal.style.display === "none") {
//     modal.style.display = "flex";
//   } else {
//     modal.style.display = "none";
//   }
// }
function closeModal() {
  if (modal.style.display === "flex") {
    modal.style.display = "none";
  } else {
    modal.style.display = "flex";
  }
}
function closeModal2() {
  if (modal2.style.display === "flex") {
    modal2.style.display = "none";
  } else {
    modal2.style.display = "flex";
  }
}
