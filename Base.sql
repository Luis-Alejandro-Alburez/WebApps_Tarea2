DROP DATABASE IF EXISTS BancoDB;
CREATE DATABASE BancoDB;

DROP TABLE IF EXISTS BancoDB.Clientes;
CREATE TABLE BancoDB.Clientes
(    
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(100)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS BancoDB.Cuentas;
CREATE TABLE BancoDB.Cuentas
(
    id_cuenta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    tipo_cuenta VARCHAR(100),
    saldo DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES BancoDB.Clientes(id_cliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO BancoDB.Clientes (nombre, ciudad)
VALUES 
("Luis", "Antigua"),
("Juan", "Ciudad"),
("María", "Escuintla"),
("Ana", "Esquipulas");

SELECT * FROM BancoDB.Clientes;
TRUNCATE TABLE BancoDB.Clientes;

INSERT INTO BancoDB.Cuentas (id_cliente, tipo_cuenta, saldo)
VALUES 
(1, "ahorros", 100),
(1, "corriente", 500),
(2, "ahorros", 500),
(3, "corriente", 600.50);

SELECT * FROM BancoDB.Cuentas;
            
SELECT 
    *
FROM
    BancoDB.Clientes
WHERE
    id_cliente NOT IN (SELECT DISTINCT
            id_cliente
        FROM
            BancoDB.Cuentas);