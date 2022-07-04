

sp_helptext rpt_aistenciaweb
ALTER view [dbo].[rpt_aistenciaWeb]
as
--select *from TB_aistenciaWeb1

select B.EMP_COD,E.RAZON, LP.LOC_NOM , a.per_cod,upper(dbo.trim(a.PER_NOM)+' '+dbo.trim(a.PER_APE_PAT)+' '+dbo.trim(a.PER_APE_MAT)) as nombre,  
--Convert(char(10), b.fecha, 112) as fecha,
b.fecha as fecha,
b.fecha as fechareal,  
 convert(varchar, b.HORA_ENT, 108)HORA_ENT,convert(varchar, b.HORA_SAL, 108) HORA_SAL,b.horas,b.est_asis,UPPER(dbo.trim(convert(varchar(200),b.comentario))) as MARCA 
--INTO  TB_aistenciaWeb1
from [192.168.10.236].AMRRHH_BETA.dbo.personal a inner join [192.168.10.236].AMRRHH_BETA.dbo.ASISTENCIA_TEMP b  
on a.per_cod = b.per_cod   
inner join [192.168.10.236].AMRRHH_BETA.dbo.EMPRESA E  on B.EMP_COD = E.EMP_COD
inner join [192.168.10.236].AMRRHH_BETA.dbo.LOCAL_PERSONAL L on b.per_cod = L.per_cod
inner join [192.168.10.236].AMRRHH_BETA.dbo.LOCAL LP on L.LOC_COD = LP.LOC_COD
where per_est = 'A' and year(b.fecha)in('2016') --DATEPART(yy,convert(char(10), b.fecha , 103)) = '2014'























