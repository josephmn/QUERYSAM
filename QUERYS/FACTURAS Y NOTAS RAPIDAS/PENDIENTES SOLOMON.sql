---- PRUEBA DE PROCESOS

use [ca2015app]
go

select* from cf_tiendasite


select* from cf_regvtas where fecha  ='2015-10-14'


select cf.fechanegocio,cf.* from CFM_RegVtas cf where 
cf.Chk_Num  not in (select Chk_Num from CF_RegVtas)
AND MONTH(cf.fecha)= 2 -- and cf.fecha ='2016-03-03'
order by cf.fechanegocio,numtienda desc
go



select FECHANEGOCIO,* from cf_regvtas where nomBempleado ='LAISSON' AND  exportadofn =''

delete from cf_regvtas where nomBempleado ='LAISSON' AND  exportadofn =''
selec


--pendientes AR
select fechanegocio,ExportadoFN,referenciaFN,*  from CF_RegVtas 
where ExportadoFN ='' and MONTH(FECHANEGOCIO) = 10


-- pendintes Aplicaciones --
select fecha,fechanegocio,ExportadoFN,referenciaFN,exportadopa,*  from CF_RegVtas cf
where ExportadoPA ='' 
and user06 =''
and total <> 0 
and MONTH(fechaNEGOCIO) = 2
order by cf.FECHANEGOCIO desc
go


select distinct exportadofn from CF_RegVtas cf
where ExportadoPA ='' 
and user06 =''
and total <> 0 
and MONTH(fechaNEGOCIO)=10
go


-- pendiente targetas --
select * from cf_detpago where exportadotr=''
and month(fechanegocio) = 10 
and tipo <>'EFECTIVO'
order by fechanegocio desc
go


-- pendientes depositos --
select ss.fechanegocio,t.descripcion,ss.* from cfm_detpago2  ss
inner join cf_tiendasite T on ss.numtienda  =t.numtienda
where  exportadotr = '' 
and month(ss.fechanegocio)  in (2)--,4,5,6,7,8,9,10)
order by ss.fechanegocio desc
go


update CFM_DetPago2 set EXPORTADOTR ='NULO'
from CFM_DetPago2 where exportadotr ='' and month(fechanegocio)  in (4,5,6) and nombrvc <>'201510'







-----------------  DESCARTAR TRANSFERENCIAS QUE NO HAN SIDO ACEPTADAS


update CFM_DetPago2 set EXPORTADOTR ='NO VALIDO'
from CFM_DetPago2 where exportadotr ='' and month(fechanegocio) = 1 and fechanegocio between '2015-01-06' and '2015-01-06'


select rtrim(year(fechaNegocio))+ right('00'+rtrim(month(fechaNegocio)),2),*
--update CFM_DetPago2 set NombRVC= rtrim(year(fechaNegocio))+ right('00'+rtrim(month(fechaNegocio)),2)
from CFM_DetPago2 where exportadotr ='' and month(fechanegocio) = 1 and fechanegocio between '2015-01-06' and '2015-01-06'




--update cfm_detpago2 set nombrvc ='201507' where chk_num ='LIM01CEN000000001471'
select * from cf_tiendasite where numtienda ='37'


select *from (
select distinct numtienda,fechanegocio,(select distinct numtienda from CF_DetPago where numtienda = C.numtienda and convert(varchar, fechanegocio, 112)=C.fechanegocio ) a
from CFM_DetPago C
) x where a is  null
order by fechanegocio


use [ca2015app]
go

select* from custom2 where entityid='sysadmin'

delete from custom2 where entityid='sysadmin'












