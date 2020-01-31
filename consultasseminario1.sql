/*
   30/01/2020
   martes
   scripts básicos de select sobre la base de datos seminario
*/
/*use seminario;
select r.matricula,r.nombre,s.nombre_estado from 
datos_particulares as r,catalogo_estados as s
where
r.id_estado=s.id_estado and s.nombre_estado='TLAXCALA';*/
/*use seminario;
select r.matricula,r.nombre,s.nombre_estado,
year(r.f_registro)-year(r.f_nacimiento) as edad_actual from 
datos_particulares as r,catalogo_estados as s
where
r.id_estado=s.id_estado
order by edad_actual desc;*/

use seminario;
select r.matricula,r.nombre,s.nombre_estado,
year(r.f_registro)-year(r.f_nacimiento) as edad_actual from 
datos_particulares as r,catalogo_estados as s
where
r.id_estado=s.id_estado and (year(r.f_registro)-year(r.f_nacimiento))<18
order by edad_actual desc;