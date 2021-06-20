\c postgres

DROP DATABASE blog;
CREATE DATABASE blog;

\c blog
--las tablas deben ser en plural porque son varios valores y hacerlo en ingles
CREATE TABLE usuarios (
    id serial PRIMARY KEY,
    email varchar(50)
);

CREATE TABLE posts (
    id serial PRIMARY KEY,
    usuario_id INT,
    titulo VARCHAR(50),
    fecha DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE comentarios(
    id serial primary key,
    usuario_id INT,
    post_id INT,
    texto text,
    fecha DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

\copy usuarios from 'usuarios.csv' csv header;
\copy posts from 'posts.csv' csv header;
\copy comentarios from 'comentarios.csv' csv header;

select * from usuarios;
select * from posts;
select * from comentarios;

--ejercicio 4
select email, p.id, titulo
from usuarios u
inner join posts p
on u.id = p.usuario_id
where u.id = 5;

-- ejercicio 5
select u.email, com.id, com.texto
from comentarios as com
inner join usuarios as u
on u.id = com.usuario_id 
where u.email != 'usuario06@hotmail.com';


-- los alias que se ocupan, es mejor usar una letra referencial en vez de A o B
--ejercicios 6
select *
from usuarios u 
left join posts  p 
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

--otro metodo para el ejercicio 8
select *
from usuarios 
join posts 
on usuarios.id = posts.usuario_id 
where posts.fecha between '2020-06-01' and '2020-06-30';
