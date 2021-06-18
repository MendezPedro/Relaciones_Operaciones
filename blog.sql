\c postgres

DROP DATABASE blog;
CREATE DATABASE blog;

\c blog

CREATE TABLE usuario (
    id serial,
    email varchar(50),
    PRIMARY KEY (id)
);

insert into usuario(email)
values('usuario01@hotmail.com');
insert into usuario(email)
values('usuario02@hotmail.com');
insert into usuario(email)
values('usuario03@hotmail.com');
insert into usuario(email)
values('usuario04@hotmail.com');
insert into usuario(email)
values('usuario05@hotmail.com');
insert into usuario(email)
values('usuario06@hotmail.com');
insert into usuario(email)
values('usuario07@hotmail.com');
insert into usuario(email)
values('usuario08@hotmail.com');
insert into usuario(email)
values('usuario09@hotmail.com');

CREATE TABLE post (
    id serial,
    titulo VARCHAR(50),
    fecha DATE,
    usuario_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 1:esto es malo', '2020-06-29', 1);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 2:esto es malo', '2020-06-20', 5);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 3:esto es excelente', '2020-05-30', 1);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 4:esto es bueno', '2020-05-09', 9);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 5:esto es bueno', '2020-07-10', 7);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 6:esto es excelente', '2020-07-18', 5);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 7:esto es excelente', '2020-07-07', 8);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 8:esto es excelente', '2020-05-14', 5);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 9:esto es bueno', '2020-05-08', 2);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 10:esto es bueno', '2020-06-02', 6);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 11:esto es bueno', '2020-05-05', 4);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 12:esto es malo', '2020-07-23', 9);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 13:esto es excelente', '2020-05-30', 5);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 14:esto es excelente', '2020-05-01', 8);
INSERT INTO post
(titulo, fecha, usuario_id)
VALUES
('post 15:esto es malo', '2020-06-17', 7);


CREATE TABLE comentarios(
id INT,
usuario_id INT,
post_id INT,
texto VARCHAR(55),
fecha DATE,
PRIMARY KEY (post_id),
FOREIGN KEY (usuario_id) REFERENCES usuario(id),
FOREIGN KEY (post_id) REFERENCES post(id)
);

INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('1', '3', '6', 'Este es el comentarios 1', '2020-07-08');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('2', '4', '2', 'Este es el comentarios 2', '2020-06-07');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('3', '6', '4', 'Este es el comentarios 3', '2020-06-16');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('4', '2', '13', 'Este es el comentarios 4', '2020-06-15');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('5', '6', '6', 'Este es el comentarios 5', '2020-05-14');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('6', '3', '3', 'Este es el comentarios 6', '2020-07-08');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('7', '6', '1', 'Este es el comentarios 7', '2020-05-22');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('8', '6', '7', 'Este es el comentarios 8', '2020-07-09');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('9', '8', '13', 'Este es el comentarios 9', '2020-06-30');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('10', '8', '6', 'Este es el comentarios 10', '2020-06-19');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('11', '5', '1', 'Este es el comentarios 11', '2020-05-09');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('12', '8', '15', 'Este es el comentarios 12', '2020-06-17');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('13', '1', '9', 'Este es el comentarios 13', '2020-05-01');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('14', '2', '5', 'Este es el comentarios 14', '2020-05-31');
INSERT INTO comentarios
(id, usuario_id, post_id, texto, fecha)
VALUES
('15', '4', '3', 'Este es el comentarios 15', '2020-06-28');


--Seleccionar el correo, id y título de todos los post publicados por el usuario 5

select A.id, B.email
from post as A
inner join usuario as B
on A.id = B.usuario
and usuario = 'usuario05@hotmail.com';

-- las tablas son en plural y todo en ingles
--ejercucuio 4
select email, u.id, titulo
from usuarios as u
inner join post 
on usuarios.id = post.usuarios_id
where u.id = 5;

-- ejercicio 5
select B.email, A.id, A.texto
from comentarios as A 
inner join usuarios as B 
on B.id = A.usuario_id 
where B.email != 'usuario06@hotmail.com';


-- los alias que se ocupan, es mejor usar una letra referencial en vez de A o B
--ejercicios 6
select *
from usuarios u 
left join post  p 
on u.id= p.usuario_id
where p.id is null;

--ejercicio 7

select *
from posts p 
full outer join comentarios com 
on p.id = com.post_id
order by com.post_id ASC;

--ejercico 8 

select u.*, p.fecha
from usuarios as u 
inner join posts as p 
on u.id = p.usuario_id 
where extract(month from p.fecha) = 06;

--otro metodo
selesct *
from usuarios 
join posts 
on usuarios.id = post.usuario_id 
where posts.fecha between '2020-06-01' and '2020-06-30';
