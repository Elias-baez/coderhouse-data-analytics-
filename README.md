# RetailPro — Proyecto de Análisis de Datos

Proyecto integrador del curso Data Analytics de CoderHouse. Simula el
trabajo de análisis de datos para un distribuidor tecnológico ficticio
(RetailPro), cubriendo desde el diseño de la base de datos hasta un
modelo de Power BI con medidas DAX.

Este proyecto combina PostgreSQL para la base de datos y Power BI
Desktop para el ETL, el modelado y la visualización, usando DAX
para las medidas de cálculo.

## Requisitos previos
- PostgreSQL 14 o superior
- pgAdmin 4
- Power BI Desktop (versión de julio 2026 o posterior)

## Estructura del repositorio
| Archivo | Descripción |
|---|---|
| `ventas_tech_db.sql` | Script de creación de la base de datos y tablas |
| `m4_consultas_negocio.sql` | Consultas de análisis de negocio (agregaciones, CASE WHEN) |
| `m5_consultas_joins.sql` | Consultas con INNER JOIN, LEFT JOIN y UNION ALL |
| `Pipeline_ETL_TuApellido_TuNombre.pbix` | Pipeline de ETL en Power BI con Power Query |
| `Baez_Elias_Checkpoint2.pbix` | Modelo de datos con relaciones activas y medidas DAX |

## Cómo ejecutar los scripts SQL
1. Instalar PostgreSQL y pgAdmin.
2. Crear una base de datos nueva.
3. Ejecutar `ventas_tech_db.sql` para crear las tablas e insertar los datos base.
4. Ejecutar `m4_consultas_negocio.sql` y `m5_consultas_joins.sql` para correr las consultas de análisis.

## Autor
Elias Baez — CoderHouse, Data Analytics
