-- logearse al servidor 192.168.10.9
-- sa sql2007
-- base de datos BD_Altomayo

--DEPENDIENDO DE LA ZONA HACEMOS LO SIGUEINTE
-- POR EJEMPLO SI ES AREQUIPA 
-- EJECUTAMOS --select *from dbo.MAE_DISTR de la cual sabremos que codigo le corresponde a Arequipa ch_CodDistr='07'
-- con el codigo completamos el siguiente query select *from MAE_CLI where  ch_CodDistr='07'  
-- y al ejecutarlo sabremos que valor debe ir en el campo ch_CodRuta en este caso seria asi ch_CodRuta like 'F14%'

select *from MAE_CLI where  ch_CodDistr='02'  
select *from MAE_CLI where  ch_CodDistr='02'  and ch_CodRuta like 'F03%'

-- con esto nos permitira eliminar los registros  segun el filtro en el query anterior 
delete from MAE_CLI where   ch_CodDistr='02'  and ch_CodRuta like 'F03%'


--luego en este ultimo paso debemos unicamente cambiar la fila sigiente   and (  c.user5 like 'F14%' ref casi al ultimo por el valor correspondiente 
--(cada ) zona tiene un F.. unico
          
 INSERT INTO MAE_CLI                       
  select 'ch_CodDistr'= case left(c.user5,1)                      
     when 'L' then '01'   -- Lima                    
     when 'P' then '03'   -- Piura                    
     when 'T' then '04'   -- Trujillo                    
     ELSE  ( case left(c.user5,2)                      
      when '03' then '02' -- Chiclayo                    
      when '09' then '02' -- Chiclayo                    
      when '14' then '02' -- Chiclayo                    
      when '18' then '05' -- Huancayo                    
      else ( case left(c.user5,3)                      
       when 'F01'  then (CASE  WHEN c.fax IN ('LIBO','LIME','LIMA') THEN '01' ---('LFV1','LFV2','LFV3','LFV4','LFV5','LFV6','LFV7') THEN '01' -- lIMA                    
         ELSE '01'      
    END)  --SURCO                    
       when 'F03' THEN '02'  -- Chiclayo                    
       when 'F10' THEN '03'  -- Piura                    
       when 'F02' thEN '04'  -- Trujillo                    
       when 'F12' THEN '05'  -- Huancayo                    
       when 'F14' THEN '07'  -- Arequipa                    
       when 'F06' THEN '99'  -- Limcen                    
       when 'F07' THEN '99'  -- Limcen                    
       when 'F08' THEN '99'  -- Limcen                    
       when 'F09' THEN '99'  -- Limcen                    
       when 'F11' THEN '99'  -- Limcen               
    when 'F15' THEN '08'  -- Chincha               
       when 'F16' THEN '09'  -- Cusco                 
       else '99' end )                     
      end )                     
     end,                    
  'ch_CodClien'=LEFT(c.custid,11), 'ch_CodCanal'= right(rtrim(s.s4future01),2),                    
         'vc_NomClien' = LEFT(c.Name,50), 'ch_CodRuta'= LEFT(c.user5,7), 'int_OrdVisi'=1,                     
  'ch_CodVen'= case when LEFT((SELECT d.slsperid FROM [192.168.10.51].AM2016APP.dbo.XAMMAE_RUTA d where Zonarutaid=LEFT(c.user5,7)),6) IS NULL THEN left(c.slsperid,6) ELSE LEFT((SELECT e.slsperid FROM [192.168.10.51].AM2016APP.dbo.XAMMAE_RUTA e where Zonarutaid=LEFT(c.user5,7)),6) END , --left(slsperid,6)                    
  'ch_DiaVisi'='1', 'ch_ConPago'= 'C' ,--case when c.terms='01' then 'C' else ' end,                    
  'vc_Ruc'=LEFT(c.TAXLOCID,11), 'vc_Giro'='',                    
  'vc_Direccion'= LEFT(rtrim(c.addr1) + ' ' + left(rtrim(c.addr2),20),50) ,'nu_ConCredi'=0,'nu_LinCredi'=c.crlmt,                     
  'ch_HabEncue'='0', 'ch_Encuesta'='0', 'ch_ForPago'='03', 'ch_FFVV_01'='01', 'ch_FFVV_02'='', 'ch_FFVV_03'='', 'ch_FFVV_04'='','ch_LstPrecio'=right(rtrim(s.s4future01),4)                    
  FROM  [192.168.10.51].AM2016APP.dbo.customer c inner join [192.168.10.51].AM2016APP.dbo.soaddress s                   
  on c.custid = s.custid                   
  where  RTRIM(c.user5) NOT IN ('LSINACT','LSINRUT') AND c.status='A' and s.shiptoid = 'DEFAULT'   
  --cambiar unicamente este valor      c.user5 like 'F14%' por la F.. correspondientes             
  and (  c.user5 like 'F03%'

)                                    
   -- or  left(c.user5,2) in ('01','02','05','07','08','10','11','12','13','15','16','17','18','19','03','09','14','04','20','21','22')                     
    -- or  left(c.user5,1) in ('L','P','T','F')                    
               
                
and LEFT(c.custid,11) not in ( select distinct ch_CodClien from mae_cli ) 
--and  c.custid in('15423285','08927605')


