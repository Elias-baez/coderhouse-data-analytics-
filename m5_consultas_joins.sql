-- 1. Agregar canal a ventas
ALTER TABLE ventas ADD COLUMN canal VARCHAR(20);

UPDATE ventas SET canal = 'Online'     WHERE id_venta IN (1,3,5,7,9,11,13,15);
UPDATE ventas SET canal = 'Presencial' WHERE id_venta IN (2,4,6,8,10,12,14,16);

-- 2. Crear la tabla territorios
CREATE TABLE territorios (
    id_territorio INT PRIMARY KEY,
    region VARCHAR(50),
    pais VARCHAR(50),
    zona VARCHAR(50)
);

INSERT INTO territorios (id_territorio, region, pais, zona) VALUES
(1, 'Norte', 'Argentina', 'AMBA'),
(2, 'Sur', 'Argentina', 'Patagonia'),
(3, 'Centro', 'Argentina', 'Litoral');

-- 3. Agregar segmento e id_territorio a clientes
ALTER TABLE clientes ADD COLUMN segmento VARCHAR(50);
ALTER TABLE clientes ADD COLUMN id_territorio INT REFERENCES territorios(id_territorio);

UPDATE clientes SET segmento = 'Premium', id_territorio = 1 WHERE id_cliente = 111;
UPDATE clientes SET segmento = 'Estándar', id_territorio = 2 WHERE id_cliente = 112;
UPDATE clientes SET segmento = 'Premium', id_territorio = 3 WHERE id_cliente = 113;

SELECT c.id_cliente, c.nombre, c.segmento, t.region, v.canal
FROM clientes c
LEFT JOIN territorios t ON c.id_territorio = t.id_territorio
LEFT JOIN ventas v ON v.id_cliente = c.id_cliente
LIMIT 5;

FROM tabla_A
INNER JOIN tabla_B ON tabla_A.columna_relacion = tabla_B.columna_relacion

SELECT
    v.fecha_venta,
    c.nombre AS nombre_cliente,
    c.segmento,
    t.region,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta,
    v.canal
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON v.id_producto = p.id_producto
INNER JOIN territorios t ON c.id_territorio = t.id_territorio
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria;

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos p
LEFT JOIN ventas v ON p.id_producto = v.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL;

SELECT 'Online' AS origen, v.id_venta, v.cantidad * v.precio_unitario AS total
FROM ventas v
WHERE v.canal = 'Online'

UNION ALL

SELECT 'Presencial' AS origen, v.id_venta, v.cantidad * v.precio_unitario AS total
FROM ventas v
WHERE v.canal = 'Presencial';

SELECT
    v.canal AS origen,
    SUM(v.cantidad * v.precio_unitario) AS total_por_canal
FROM ventas v
GROUP BY v.canal;