-- Requerimientos Iniciales

--sudo su - pedro --> para ir a la carpeta inicial
-->psql
\c postgres
DROP DATABASE desafio2;
CREATE DATABASE desafio2;
\c desafio2
-- desactivamos el autocommit
\echo :AUTOCOMMIT
\set AUTOCOMMIT off


-- Solicitud 01
--comando ingresado en la terminal (fuera del psql)
psql -U pedro desafio2 < unidad2.sql

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
COMMIT;
SELECT * FROM producto WHERE id = 1;
SELECT * FROM producto WHERE id = 2;
SELECT * FROM producto WHERE id = 8;


--solicitud 4
--desabilitar autocommit
\echo :AUTOCOMMIT
\set AUTOCOMMIT off
--insertat un nuevo cliente
BEGIN TRANSACTION;
savepoint nueva_cuenta;
-- no se puede modificar por el usuario?
INSERT INTO cliente (id,nombre,email) VALUES (11,usuario011, usuario011@hotmail.com);
-- reviso si agrego otro usuario
SELECT max(id) from cliente;
--realizo un rollback
rollback to nueva_cuenta;
COMMIT;
-- confirmo que la informacion no fue modificada
select * from cliente;

-- activamos el autocommit
\set AUTOCOMMIT on
\echo :AUTOCOMMIT