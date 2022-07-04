
-- PROCESO PARA INGRESAR CODIGO Y RUTA 



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
  and  C.custid  IN 
( SELECT  CUSTID FROM  [192.168.10.51].AM2016APP.dbo.customer WHERE SLSPERID ='546' AND BILLZIP ='03SA205')


/*
SELECT CH_CODVEN,* FROM BACKENERO.DBO.MAE_CLI WHERE CH_CODRUTA ='03SA105' AND CH_CODCLIEN ='10164606304'
SELECT CH_CODVEN,* FROM BACKENERO.DBO.MAE_CLI WHERE CH_CODVEN ='200'
UPDATE  MAE_CLI SET CH_CODVEN  ='546' WHERE CH_CODRUTA ='03SA105'




select  * from MAE_CLI where  ch_codven  ='200' AND CH_CODRUTA ='03SA108' AND ch_CodClien = '16526557'
update MAE_CLI set ch_codven ='200' WHERE CH_CODCLIEN in ('16542703') ,'16526399','44285760')

-- VERIFICAR CLIENTES QUE NO ESTAN EN CH_CODCLIEN
SELECT custid FROM  [192.168.10.51].AM2016APP.dbo.customer WHERE SLSPERID ='200' AND BILLZIP ='03SA108'
and custid in (select  ch_codclien from MAE_CLI where  ch_codven  <>'200' ) 


select  * from MAE_CLI where  ch_codven  ='200' AND CH_CODRUTA ='03SA108'  and ch_codclien 
in 
(
SELECT custid FROM  [192.168.10.51].AM2016APP.dbo.customer WHERE SLSPERID ='200' AND BILLZIP ='03SA108'
)



select  ch_codclien,ch_codven from MAE_CLI where  ch_codven  <>'200' and ch_codclien 
in 
(
SELECT custid FROM  [192.168.10.51].AM2016APP.dbo.customer WHERE SLSPERID ='200' AND BILLZIP ='03SA108')


-------------------------------------------------------------------------------------------------
-- SE EXTRAE LOS CLIENTES QUE NO SE ENCUENTRAN EL LA TABLA DE NEXTEL MAE_CLI

AND CUSTID NOT IN (SELECT CH_CODCLIEN FROM  MAE_CLI where  ch_codven  ='546')


SELECT CH_CODCLIEN,CH_CODVEN ,*
--UPDATE  MAE_CLI SET ch_codven ='546' 
FROM MAE_CLI
WHERE CH_CODCLIEN IN 
(
SELECT CUSTID FROM [192.168.10.51].AM2016APP.dbo.customer WHERE SLSPERID ='546'
)



SELECT CUSTID FROM [192.168.10.51].AM2015APP.dbo.customer WHERE SLSPERID ='546'
AND CUSTID NOT IN 
(SELECT CUSTID FROM [192.168.10.51].AM2016APP.dbo.customer WHERE SLSPERID ='546')

SELECT CUSTID FROM [192.168.10.51].AM2016APP.dbo.customer WHERE custid
 not in ()


select  * from  [192.168.10.51].AM2016APP.dbo. XAMMAE_RUTA



