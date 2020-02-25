use seminario;

drop table if exists pagosbancarios1;
create table pagosbancarios1(id_pago int not null auto_increment,
f_deposito date not null,
cantidad decimal(9,2) not null,
banco nvarchar(50) not null,
primary key(id_pago));

drop table if exists copiapagos;
create table copiapagos(id_c int not null auto_increment,
id_pago int not null,f_deposito date not null,
cantidad decimal(9,2) not null,
banco nvarchar(50) not null,
usuario nvarchar(50) not null,
fecha date not null,
hora time not null,
operacion nvarchar(50) not null,
primary key(id_c));

delimiter $$

drop trigger if exists tpagos $$

create trigger tpagos after insert on pagosbancarios1 FOR EACH ROW
begin
    insert into copiapagos(id_pago,f_deposito,cantidad,banco,
    usuario,fecha,hora,operacion)
    values(new.id_pago,new.f_deposito,new.cantidad,new.banco,
    USER(),CURRENT_DATE(),CURRENT_TIME(),'INSERT');
end $$

delimiter ;

--soy Juan Pérez
INSERT INTO PAGOSBANCARIOS1(f_deposito,cantidad,banco)
            VALUES('2020-02-25',700,'BBVA');
INSERT INTO PAGOSBANCARIOS1(f_deposito,cantidad,banco)
            VALUES('2020-03-25',700,'BBVA');
INSERT INTO PAGOSBANCARIOS1(f_deposito,cantidad,banco)
            VALUES('2020-04-25',700,'BBVA');
INSERT INTO PAGOSBANCARIOS1(f_deposito,cantidad,banco)
            VALUES('2020-05-25',700,'BBVA');
INSERT INTO PAGOSBANCARIOS1(f_deposito,cantidad,banco)
            VALUES('2020-06-25',700,'BBVA');
--VERIFICO LA INSERCIÓN
SELECT * FROM PAGOSBANCARIOS1;
SELECT * FROM COPIAPAGOS;

delimiter $$

drop trigger if exists tpagosu $$

create trigger tpagosu after update on pagosbancarios1 FOR EACH ROW
begin
    insert into copiapagos(id_pago,f_deposito,cantidad,banco,
    usuario,fecha,hora,operacion)
    values(old.id_pago,old.f_deposito,old.cantidad,old.banco,
    USER(),CURRENT_DATE(),CURRENT_TIME(),'UPDATE');
end $$

delimiter ;

--soy juan
update pagosbancarios1 set cantidad=350;

SELECT * FROM COPIAPAGOS;

--ya me puse loco y vamos a volcar
insert into pagosbancarios1 
select id_pago,f_deposito,cantidad,banco from
pagos_bancarios where id_pago>10;
--soy juan
update pagosbancarios1 set cantidad=350;
SELECT * FROM COPIAPAGOS;


