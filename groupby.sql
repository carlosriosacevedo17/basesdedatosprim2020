DROP DATABASE IF EXISTS AGRUPACIONES;
CREATE DATABASE AGRUPACIONES;

USE AGRUPACIONES;
CREATE TABLE ALUMNO(MATRICULA INT NOT NULL,NOMBRE NVARCHAR(50) NOT NULL,
CARRERA NVARCHAR(10) NOT NULL, PRIMARY KEY(MATRICULA));

CREATE TABLE CALIFICACION(ID_C INT NOT NULL AUTO_INCREMENT,
MATERIA NVARCHAR(50) NOT NULL, CAL INT NOT NULL,MATRICULA INT NOT NULL,
FOREIGN KEY(MATRICULA) REFERENCES ALUMNO(MATRICULA),
PRIMARY KEY(ID_C));

INSERT INTO ALUMNO(MATRICULA,NOMBRE,CARRERA) VALUES(100,'JUAN','ITI'),
(101,'PEDRO','ITI'),(102,'MANUEL','ITI'),(103,'ANA','ICC'),
(104,'JIMENA','ICC'),(105,'LAURA','LCC');

INSERT INTO CALIFICACION(MATERIA,CAL,MATRICULA) VALUES('B.D',10,100),
('I.S',8,101),('B.D',9,102),('I.S',10,102),('B.D',9,103),('I.S',7,103),
('DHPC',6,100),('FHS',8,102),('FHS',7,103),('DHPC',9,102),('I.S',10,104),
('B.D',7,101),('DHPC',6,101),('FHS',10,100);