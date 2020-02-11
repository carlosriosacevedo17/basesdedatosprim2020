drop database if exists agrupacion;

create database agrupacion;
use agrupacion;

create table alumno(matricula int not null,
nombre nvarchar(50) not null, carrera nvarchar(50) not null,
primary key(matricula));

create table calificacion(id_c int not null,materia nvarchar(40) not null,
cal int not null, matricula int not null,
foreign key(matricula) references alumno(matricula) on delete cascade,
primary key(id_c));

insert into alumno(matricula,nombre,carrera)
values(100,'JUAN','ICC'),(101,'PEDRO','ICC'),(102,'ANA','ITI'),
(103,'MANUEL','ITI'),(104,'JIMENA','LCC');

insert into calificacion(id_c,materia,cal,matricula)
values(1,'B.D',10,100),(2,'I.S',9,100),(3,'B.D',10,101),(4,'I.S',9,101),
(5,'B.D',8,102),(6,'I.S',10,102),(7,'B.D',7,103),(8,'I.S',6,104),
(9,'B.D',10,104);