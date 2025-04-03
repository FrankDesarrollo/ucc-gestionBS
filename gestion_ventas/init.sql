CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    producto_id INT REFERENCES productos(producto_id),
    cantidad INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO clientes (nombre_cliente) VALUES
('Juan Pérez'), ('Ana García'), ('Carlos López');

INSERT INTO productos (nombre_producto, precio) VALUES
('Laptop', 2500.00), ('Mouse', 100.00), ('Teclado', 300.00);

INSERT INTO ventas (cliente_id, producto_id, cantidad) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 1),
(3, 3, 3),
(2, 2, 1);
