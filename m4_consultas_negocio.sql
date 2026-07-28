SELECT
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_facturado,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta);

INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
(11, 112, 203, 2,  450.00, '2024-04-03'),
(12, 113, 201, 1, 1200.00, '2024-04-10'),
(13, 111, 202, 4,   28.00, '2024-04-18'),
(14, 112, 205, 2,  130.00, '2024-05-02'),
(15, 113, 204, 3,  120.00, '2024-05-15'),
(16, 111, 201, 1, 1200.00, '2024-05-20');

SELECT
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC
LIMIT 5;

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

CASE 
    WHEN condicion THEN 'resultado_A'
    ELSE 'resultado_B'
END AS nombre_columna

SELECT
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE
        WHEN SUM(cantidad * precio_unitario) > (
            SELECT AVG(total_mes)
            FROM (
                SELECT SUM(cantidad * precio_unitario) AS total_mes
                FROM ventas
                GROUP BY EXTRACT(MONTH FROM fecha_venta)
            ) AS totales_por_mes
        ) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta);

-- Hallazgos:
-- 1. El producto 201 concentra la mayor facturación ($4800) pese a vender solo 4 unidades, 
--    mientras que el producto 202 vende 14 unidades pero factura apenas $392 — sugiere que 
--    201 es un producto de alto valor unitario y 202 uno de rotación con margen bajo.
-- 2. Marzo fue el único mes por encima del promedio de facturación ($3750 vs. un promedio 
--    de $2594), impulsado por el mayor volumen de pedidos (10 contra 3 en abril y mayo).
-- 3. Los 3 clientes de la base son recurrentes (más de un pedido cada uno), con el cliente 
--    111 como el más activo: 6 pedidos y $3022 gastados en total.