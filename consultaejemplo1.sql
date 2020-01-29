--Este es un script para iniciar mi base de datos
--Crear la base de datos
drop database if exists hospitaldb;
create database hospitaldb;
--voy a utilizar la base de datos
use hospitaldb;
--voy a crear una tabla de hospital
create table hospital(codigo_h int not null,
nombre nvarchar(50) not null,
calle nvarchar(50),
colonia nvarchar(50),
telefono nvarchar(20),
cp int(5),
primary key(codigo_h));
--creando la tabla de sala
create table sala(codigo_s int not null,
nombre nvarchar(50) not null,
num_camas int not null,
codigo_h int not null,
foreign key(codigo_h) references hospital(codigo_h) on delete cascade,
primary key(codigo_s)); 
--insertando datos en la tabla de hospital
--inserción simple
insert into hospital(codigo_h,nombre,calle,colonia,telefono,cp)
values(100,'Pilares','xxx','xxx','xxx',5);
--inserción múltiple
insert into hospital(codigo_h,nombre,calle,colonia,telefono,cp)
values(200,'Ángeles','yyy','yyy','yyy',10),
(300,'HU','zzz','zzz','zzz',10);
--insertando datos en la tabla de sala
insert into sala(codigo_s,nombre,num_camas,codigo_h)
values(10,'Pediatría',10,100),(20,'Espera',20,100),
(30,'Urgencias',10,100),(40,'Rayos X',2,200),(50,'consultorios',10,200);
--Eliminar el hospital HU de la tabla hospital
--Nota nunca debo ejecutar un delete o update sin un where
--delete from hospital where codigo_h=300;
--vamos a eliminar el hospital los Ángeles
--delete from hospital where codigo_h=200;
--vamos a mostrar datos usando un intersección lógica
select h.codigo_h,h.nombre,h.calle,h.colonia,h.telefono,h.cp,
s.codigo_s,s.nombre,s.num_camas
from hospital as h, sala as s
where h.codigo_h=s.codigo_h;



