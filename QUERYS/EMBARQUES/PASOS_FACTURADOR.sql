FLI0002921
FLI0002923

-- PASO IMPRMIR FACTURA
Select SHIPPERID,INVCNBR,user1,nextFunctionClass,NextFunctionId,siteid,Crtd_User,*
--UPDATE NEWSH SET nextFunctionClass='0100',NextFunctionId='4099999',adminHold=0
from newsh where SHIPPERID ='FLI0002872' -- INVCNBR in('F160064684')  and user1 in('S000000581') and siteid ='PIUPT'

CFLI000064

-- PASO IMPRMIR FACTURA
Select SHIPPERID ,INVCNBR,user1,nextFunctionClass,NextFunctionId,siteid,Crtd_User,*
--UPDATE SOShipHeader SET nextFunctionClass='0100',NextFunctionId='4099999',adminHold=0
from SOShipHeader where SHIPPERID  IN ('CFLI000063','CFLI000064','CFLI000065','CFLI000067','CFLI000068')-- INVCNBR in('F160064684')  and user1 in('S000000581') and siteid ='PIUPT'





















UPDATE newsh SET CURYEFFDATE  ='2016-05-31',ETADATE ='2016-05-31',INVCDATE ='2016-05-31',ORDDATE ='2016-05-31'
WHERE  SHIPPERID ='FLI0002022'


-- PASO ASIGNAR TRANSPORTISTA
Select SHIPPERID,INVCNBR,user1,nextFunctionClass,NextFunctionId,*
--UPDATE NEWSH SET nextFunctionClass='4060',NextFunctionId='4068001',adminHold=0
from newsh where  user1 in('S000001575') and siteid ='LIMPT'





--pasi imprimir vouchers
select user1,nextFunctionClass,NextFunctionId,*
--UPDATE NEWSH SET nextFunctionClass='4060',NextFunctionId='4068002',adminHold=0
from newsh where   user1 in('S000001575') and siteid ='LIMPT' 

--UPDATE newsh SET SHIPDATEACCT ='2016-05-27' WHERE USER1 ='S000003164' AND SITEID ='LIMCEN'
/*

sp_helptext man_ActualizaVendedor

declare @refnbr char(10),    
@slsperid char(3),  
@slsperid_old char(3)   
set @refnbr ='F160065437'
set @slsperid ='091'
set @slsperid_old ='537'
update newsh set  slsperid= @slsperid where slsperid=@slsperid_old and INVCNBR = @refnbr    
update soshipheader set  slsperid= @slsperid  where slsperid=@slsperid_old and  INVCNBR = @refnbr    
update ardoc set  slsperid= @slsperid  where slsperid=@slsperid_old and refnbr = @refnbr    
update artran set  slsperid= @slsperid  where slsperid=@slsperid_old and refnbr = @refnbr    