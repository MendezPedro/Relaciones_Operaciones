-- Requerimientos Iniciales

sudo su - dvaldes

psql

dvaldes=# CREATE DATABASE clase02;

\echo :AUTOCOMMIT
\set AUTOCOMMIT off


-- Solicitud 01

psql -U dvaldes clase02 < unidad2.sql

-- Solicitud 02
BEGIN TRANSACTION;
INSERT INTO compra (cliente_id,fecha) VALUES (1,now());
INSERT INTO detalle_compra (producto_id,compra_id,cantidad) VALUES (9,(SELECT max(id) FROM compra),5);
UPDATE producto SET stock = stock - 5;
SELECT * FROM producto WHERE id = 9;
COMMIT;
SELECT * FROM producto WHERE id = 9;

-- Solicitud 03


BEGIN TRANSACTION;
INSERT INTO compra (cliente_id,fecha) VALUES (2,now());
INSERT INTO detalle_compra (producto_id,compra_id,cantidad) VALUES (1,(SELECT max(id) FROM compra),3);
INSERT INTO detalle_compra (producto_id,compra_id,cantidad) VALUES (2,(SELECT max(id) FROM compra),3);
INSERT INTO detalle_compra (producto_id,compra_id,cantidad) VALUES (8,(SELECT max(id) FROM compra),3);
UPDATE producto SET stock = stock - 3 WHERE id=1;
UPDATE producto SET stock = stock - 3 WHERE id=2;
UPDATE producto SET stock = stock - 3 WHERE id=8;
SELECT * FROM producto WHERE id = 1;
SELECT * FROM producto WHERE id = 2;
SELECT * FROM producto WHERE id = 8;
COMMIT;

--solicitud 4

\echo :AUTOCOMMIT
\set AUTOCOMMIT off

BEGIN TRANSACTION;
INSER INTO cliente (nombre,email) VALUES (usuario011, usuario011@hotmaicl.com);
SELECT max(id) from cliente;
COMMIT