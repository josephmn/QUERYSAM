



select status,slsperid,SITEID,user2,invcnbr,BalDue,inbatnbr,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,TotCost,*
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from soshipheader where shipperid = 'FLI0002780'

-- PASO IMPRMIR FACTURA
Select SHIPPERID,INVCNBR,user1,nextFunctionClass,NextFunctionId,siteid,Crtd_User,*
--UPDATE NEWSH SET nextFunctionClass='0100',NextFunctionId='4099999',adminHold=0
from newsh where SHIPPERID ='FLI0002780' -- INVCNBR in('F160064684')  and user1 in('S000000581') and siteid ='PIUPT'


UPDATE newsh SET CURYEFFDATE  ='2016-05-31',ETADATE ='2016-05-31',INVCDATE ='2016-05-31',ORDDATE ='2016-05-31'
WHERE  SHIPPERID ='FLI0002022'


-- PASO ASIGNAR TRANSPORTISTA
Select SHIPPERID,INVCNBR,user1,nextFunctionClass,NextFunctionId,*
--UPDATE NEWSH SET nextFunctionClass='4060',NextFunctionId='4068001',adminHold=0
from newsh where  user1 in('S000001575') and siteid ='LIMPT'

---------------------------------------------------------------------------------
Select SHIPPERID,INVCNBR,user1,user2,nextFunctionClass,NextFunctionId,siteid,Crtd_User,*
--UPDATE NEWSH SET nextFunctionClass='0100',NextFunctionId='4099999',adminHold=0
from newsh where SHIPPERID ='FLI0002780'

SELECT *  FROM NEWSL WHERE SHIPPERID ='FLI0002780'


SELECT NS.*,NL.* FROM NEWSH NS
INNER JOIN NEWSL NL ON NS.SHIPPERID = NL.SHIPPERID WHERE NS.SHIPPERID ='FLI0002780'

select xamzonasflete.codigo,xamzonasflete.desczona,xamzonasflete.observacion 
from xamzonasflete (FASTFIRSTROW)  where siteid like  'LIMCEN'  and desczona like  '%'   order by desczona



--------------TABLA DE FLETE DESTINO PARA LIQUIDAR DESPACHO
SELECT *  FROM xamzonasflete ORDER BY CODIGO DESC
INSERT INTO xamzonasflete (CODIGO,SITEID,DESCZONA,TARIFA,TRANSP,OBSERVACION)
VALUES ('000109','LIMCEN','Lima Prov',0,128,'Lima')
-------------------------------------------------------------------------------

--TABLA PARA DESPACHO DE EMBARQUE MODULO FACTURADOR
 SELECT *  FROM xDespachoShippers1 WHERE SHIPPERID ='FLI0002780'
 
 sp_helptext  Dbnav_xAMDespEmbD_1  
 
select*  from  xAMDespEmbD_1    where  SHIPPERID ='FLI0002780'