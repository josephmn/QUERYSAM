

sp_helptext  xam_incent_vend_semana



sp_helptext  LlenarComisonVendedores

LlenarComisonVendedores

create proc LlenarComisonVendedores  
as  
  
delete from tb_xam_Incent_Cuotas  
  
insert into tb_xam_Incent_Cuotas  
select *from xam_Incent_Cuotas  
  
  
delete from tb_xam_Incent_Vend_Semana  
  
insert into tb_xam_Incent_Vend_Semana  
select *  
  
from (  
select Linea_Negocio,CodCargo,NombreCargo,semana,NomSemana, ZONA, Supervisor,NombSup, marca,DESCR,'1 Cuota' DatoDesc,valorVentaP Dato   
from xam_Incent_Vend_Semana_Det  union all  
select Linea_Negocio,CodCargo,NombreCargo,semana,NomSemana, ZONA, Supervisor,NombSup, marca,DESCR,'2 Cierre' DatoDesc,ValorventaV Dato   
from xam_Incent_Vend_Semana_Det  union all  
select Linea_Negocio,CodCargo,NombreCargo,semana,NomSemana, ZONA, Supervisor,NombSup, marca,DESCR,'3 Avance' DatoDesc,avance Dato   
from xam_Incent_Vend_Semana_Det   union all  
select Linea_Negocio,CodCargo,NombreCargo,semana,NomSemana, ZONA, Supervisor,NombSup, marca,DESCR,'4 Incentivo' DatoDesc,MontoInctMarca Dato   
from xam_Incent_Vend_Semana_Det   
) x  
  
  sp_je xam_Incent_Vend_Semana_Det
  
  
  select * from cab_movi  where ch_fecinici  ='2016-11-09'
  
  select * from cab_movi  where ch_fecinici  ='2016-11-10'
  