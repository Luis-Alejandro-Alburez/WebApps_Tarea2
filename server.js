var mysql2 = require("mysql2");

var conn = mysql2.createConnection({
  host: "localhost",
  database: "BancoDB",
  user: "root",
  password: "1234", //Password incorrecto, tuve que cambiarlo porque el password es sensible
});

// confirmación de conexión establecida
conn.connect(function (error) {
  if (error) {
    throw error;
  } else {
    console.log("connexión exitosa");
  }
});

// Consultas de la tarea
// Listado de todas las cuentas creadas
conn.query("SELECT * FROM BancoDB.Cuentas;", function (error, results, fields) {
  if (error) throw error;

  console.table(results);
});

// Listado de todos los clientes creados
conn.query(
  "SELECT * FROM BancoDB.Clientes;",
  function (error, results, fields) {
    if (error) throw error;

    console.table(results);
  }
);

//Listado de todas las cuentas que están asociadas a clientes
conn.query(
  "SELECT * FROM BancoDB.Cuentas cu LEFT JOIN BancoDB.Clientes cl ON cu.id_cliente = cl.id_cliente;",
  function (error, results, fields) {
    if (error) throw error;

    console.table(results);
  }
);

//Listado de todos los clientes que no enen cuentas asociadas
conn.query(
  "SELECT * FROM BancoDB.Clientes WHERE id_cliente NOT IN (SELECT DISTINCT id_cliente FROM BancoDB.Cuentas);",
  function (error, results, fields) {
    if (error) throw error;

    console.table(results);
  }
);

conn.end();
