


-------------------RPT_AISTENCIAWEB

sp_helptext rpt_aistenciaweb


CREATE view [dbo].[rpt_aistenciaWeb]      
as      
--select *from TB_aistenciaWeb1      
      
select B.EMP_COD,E.RAZON, LP.LOC_NOM , a.per_cod,upper(dbo.trim(a.PER_NOM)+' '+dbo.trim(a.PER_APE_PAT)+' '+dbo.trim(a.PER_APE_MAT)) as nombre,        
--Convert(char(10), b.fecha, 112) as fecha,      
year(b.fecha) anio,       
b.fecha as fecha,b.fecha as fechareal,  DATEPART ( week , b.fecha ) semana,  ( case   
when DATEPART(weekday, b.fecha) = 1 then 'domingo'   
when DATEPART(weekday, b.fecha) = 2 then 'Lunes'  
when DATEPART(weekday, b.fecha) = 3 then 'Martes'  
when DATEPART(weekday, b.fecha) = 4 then 'Miercoles'  
when DATEPART(weekday, b.fecha) = 5 then 'Jueves'  
when DATEPART(weekday, b.fecha) = 6 then 'Viernes'  
when DATEPART(weekday, b.fecha) = 7 then 'sabado'  
end) DiaTexto,   
 convert(varchar, b.HORA_ENT, 108)HORA_ENT,convert(varchar, b.HORA_SAL, 108) HORA_SAL, convert(varchar, b.HORA_ENT_REF, 108)HORA_ENT_REF,convert(varchar, b.HORA_SAL_REF, 108) HORA_SAL_REF,  
 b.horas,b.est_asis,UPPER(dbo.trim(convert(varchar(200),b.comentario))) as MARCA ,      
  convert(varchar,CAST(b.HORA_SAL-b.HORA_ENT AS DateTime), 108)Dif_ForHora,'01:00:00' HoraRefrigerio,        
  ( case when UPPER(dbo.trim(convert(varchar(200),b.comentario)))  ='FALTA'  THEN '00:00:00' when convert(varchar, b.HORA_ENT, 108) = convert(varchar, b.HORA_SAL, 108)  THEN '00:00:00' ELSE      
  convert(varchar,DATEADD(minute,-60, convert(varchar,CAST(b.HORA_SAL-b.HORA_ENT AS DateTime), 108)), 108) END ) HoraEfectiva,      
  ( case when UPPER(dbo.trim(convert(varchar(200),b.comentario)))  ='FALTA'   THEN 0 when convert(varchar, b.HORA_ENT, 108) = convert(varchar, b.HORA_SAL, 108)  THEN 0  ELSE      
 DATEDIFF( ss,b.HORA_ENT , DATEADD(second,-3600,b.HORA_SAL)) END ) HoraEfectivaSegundo,      
  ( case when UPPER(dbo.trim(convert(varchar(200),b.comentario)))  ='FALTA' or datepart(dw, b.fecha)  = 7  THEN '00:00:00' when DATEPART(weekday, b.fecha) = 1 then '00:00:00' ELSE '09:36:00'  END )  HoraEmpresa,       
   ( case when UPPER(dbo.trim(convert(varchar(200),b.comentario)))  ='FALTA' or datepart(dw, b.fecha)  = 7  THEN '' when DATEPART(weekday, b.fecha) = 1 then '' ELSE 34560  END ) HorasEmpresaSeg           
--INTO  TB_aistenciaWeb1      
from [192.168.10.236].AMRRHH_BETA.dbo.personal a inner join [192.168.10.236].AMRRHH_BETA.dbo.ASISTENCIA_TEMP b        
on a.per_cod = b.per_cod         
inner join [192.168.10.236].AMRRHH_BETA.dbo.EMPRESA E  on B.EMP_COD = E.EMP_COD      
inner join [192.168.10.236].AMRRHH_BETA.dbo.LOCAL_PERSONAL L on b.per_cod = L.per_cod      
inner join [192.168.10.236].AMRRHH_BETA.dbo.LOCAL LP on L.LOC_COD = LP.LOC_COD      
where per_est = 'A' and year(b.fecha)in( '2014','2015','2016')   and b.per_cod  ='45616076' AND 
b.FECHA BETWEEN '2016-07-01' AND '2016-07-31'
  
