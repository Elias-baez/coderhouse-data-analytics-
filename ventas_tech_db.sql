--1 DROP TABLES
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

--2 CREATE TABLES

CREATE TABLE categorias (
	id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50),
    fecha_registro DATE NOT NULL
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

--3 INSTERT INTO

-- 3. INSERT DATA

INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
(1, 'Computación', 'Laptops, PCs y monitores'),
(2, 'Accesorios', 'Periféricos y complementos'),
(3, 'Audio', 'Auriculares y parlantes');

INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
(111, 'Benjamin', 'benja04@gmail.com', 'Monte Grande', '2012-03-10'),
(112, 'Laura', 'Laura22@gmail.com', 'San Vicente', '2020-05-21'),
(113, 'Alex', 'aleeXx@gmail.com', 'Capital', '2017-11-04');

INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
(201, 'Laptop Pro 15', 1, 1200.00, 15, TRUE),
(202, 'Mouse Inalámbrico', 2, 28.00, 80, TRUE),
(203, 'Monitor 4K 27"', 1, 450.00, 12, TRUE),
(204, 'Auriculares BT Pro', 3, 120.00, 35, TRUE),
(205, 'SSD Externo 1TB', 2, 130.00, 18, TRUE);

INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
(1,  111, 201, 1, 1200.00, '2024-03-05'),
(2,  112, 202, 3,   28.00, '2024-03-06'),
(3,  113, 203, 1,  450.00, '2024-03-07'),
(4,  111, 204, 2,  120.00, '2024-03-08'),
(5,  113, 205, 1,  130.00, '2024-03-10'),
(6,  112, 204, 1,  120.00, '2024-03-11'),
(7,  111, 202, 5,   28.00, '2024-03-12'),
(8,  112, 201, 1, 1200.00, '2024-03-13'),
(9,  113, 202, 2,   28.00, '2024-03-14'),
(10, 111, 205, 1,  130.00, '2024-03-15');

SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;