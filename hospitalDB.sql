--script de la base de datos HopspitalDB
drop database if exists hospitalDB;
create database hospitaldb;
use hospitaldb;
create table hospital(codigo_h int not null,
nombre nvarchar(100) not null,
primary key(codigo_h));

create table sala(codigo_s int not null,
nombre nvarchar(100) not null,
num_camas int not null,
codigo_h int not null,
foreign key(codigo_h) references hospital(codigo_h),
primary key(codigo_s));

insert into hospital(codigo_h,nombre) values(100,'ANGELES');
insert into hospital(codigo_h,nombre) values(200,'PUEBLA'),
(300,'BETANIA'),(400,'HUP'),(500,'GUADALUPE');

insert into sala(codigo_s,nombre,num_camas,codigo_h)
values(1,'URGENCIAS',20,100),(2,'PEDIATRIA',5,100),
(3,'TRAUMATOLOGIA',10,200),(4,'ESPERA',2,200),(5,'ORTOPEDIA',20,300),
(6,'RAYOS X',1,400),(7,'TERAPIA INTENSIVA',10,400),(8,'ONCOLOGIA',20,400),
(9,'NUTRICION',2,500);

