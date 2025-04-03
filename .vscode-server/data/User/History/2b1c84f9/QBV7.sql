
\c bank_db;


CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    saldo DECIMAL(10, 2) NOT NULL DEFAULT 0
);


CREATE TABLE transacciones (
    transaccion_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id) ON DELETE CASCADE,
    tipo VARCHAR(50) NOT NULL CHECK (tipo IN ('deposito', 'retiro')),
    monto DECIMAL(10, 2) NOT NULL CHECK (monto > 0),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO clientes (nombre, saldo) VALUES ('Juan Perez', 1500.00);
INSERT INTO clientes (nombre, saldo) VALUES ('Ana Garcia', 2500.00);

-
INSERT INTO transacciones (cliente_id, tipo, monto) VALUES (1, 'retiro', 200.00);


SELECT nombre, saldo FROM clientes WHERE cliente_id = 1;
