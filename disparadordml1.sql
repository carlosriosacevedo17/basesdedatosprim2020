drop database if exists auditoria;
create database auditoria;

use auditoria;
drop table if exists pago;

create table pago(id_pago int not null auto_increment,cantidad decimal(9,2) not null,
banco nvarchar(100) not null,fecha_pago date not null,primary key(id_pago));

insert into pago(cantidad,banco,fecha_pago) values(800,'BBVA','2020-02-01'),(900,'BBVA','2020-02-02'),
      (1000,'BANORTE','2020-02-03'),(250,'SANTANDER','2020-02-10');

--VAMOS A CREAR UNA TABLA AUDITORIA SOBRE LA TABLA DE PAGO
create table pago_auditoria(id_p int not null auto_increment,id_pago int not null,
cantidad decimal(9,2) not null,banco nvarchar(100) not null,fecha_pago date not null,
usuario nvarchar(100) not null,dia date not null,hora time not null,
operacion varchar(50) not null, primary key(id_p));

--Se va a programar un disparador asociado a la tabla pago 
delimiter $$
  drop trigger if exists tpagos $$
  create trigger tpagos after update on pago for each row
  begin
   insert pago_auditoria(id_pago,cantidad,banco,fecha_pago,usuario,dia,hora,operacion) values
   (old.id_pago,old.cantidad,old.banco,old.fecha_pago,USER(),CURRENT_DATE(),CURRENT_TIME(),'UPDATE');
  end $$
delimiter ;

--VAMOS A CAMBIAR UN REGISTRO DEL MONTO DEL BANCO SANTANDER
UPDATE PAGO SET CANTIDAD=1250 WHERE BANCO='SANTANDER';
SELECT * FROM pago inner join pago_auditoria on pago.id_pago=pago_auditoria.id_pago;

insert into auditoria.pago(cantidad,banco,fecha_pago) select cantidad,banco,f_deposito from
seminario.pagos_bancarios;
UPDATE PAGO SET CANTIDAD=200 WHERE ID_PAGO>100 AND ID_PAGO<200;
SELECT * FROM pago inner join pago_auditoria on pago.id_pago=pago_auditoria.id_pago;

--Se va a programar un disparador asociado a la tabla pago al borrar
delimiter $$
  drop trigger if exists tpagos1 $$
  create trigger tpagos1 after delete on pago for each row
  begin
   insert pago_auditoria(id_pago,cantidad,banco,fecha_pago,usuario,dia,hora,operacion) values
   (old.id_pago,old.cantidad,old.banco,old.fecha_pago,USER(),CURRENT_DATE(),CURRENT_TIME(),'DELETE');
  end $$
delimiter ;

DELETE FROM PAGO WHERE ID_PAGO>100 AND ID_PAGO<200;
SELECT * FROM pago inner join pago_auditoria on pago.id_pago=pago_auditoria.id_pago;
SELECT * FROM pago_auditoria;






