
-- PROCESO PARA REVERTIR NOTA DE CREDITO Y/O OTROS

-- SE VERIFICA DOCUMENTO EMITIDO EN CXC/CLIENTES/ACTIVIDAD/ SE VERIFICA DOCUMENTO

-- SE VERIFICA AR BASADO EN LOTE Y DOCUMENTO OBSERVADO
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='014562' -- LOTE 
--set @refnbr ='b030006558' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,rlsed,taxid00,applbatnbr,* from ardoc where batnbr= @batnbr-- and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran
where batnbr= @batnbr-- and refnbr like @refnbr
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr --and adjdrefnbr =@refnbr
go

-- SE VERIFICA EMBARQUE ( SE FILTRA POR INVCNBR)
select status,slsperid,invcnbr,BalDue,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,TotCost,*
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from soshipheader  where shipperid ='NCHU000008' 
select *
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from soshipline  where shipperid  LIKE   '%X'

-- SE ELIMINA EMBARQUE 
--DELETE FROM  soshipheader  where shipperid ='NCHU000008' 
--DELETE FROM  soshipline  where shipperid ='NCHU000008' 


-- SE VERIFICA INVENTARIO (ENTRADA,SALIDA)
select * from BATCH WHERE BATNBR ='014397' AND MODULE ='IN'
SELECT  * FROM INTRAN WHERE BATNBR ='014397'
select * from GLTRAN WHERE BATNBR ='014397' AND MODULE ='IN'

-- SE ELIMINA DOCUMENTO QUE SE HA OBSERVADO
--delete from intran where batnbr ='014397'and refnbr = 'C370000495'     
--delete from gltran where batnbr ='014397'and refnbr = 'C370000495'  and module ='IN'    


-- SE VERIFICA REPORTE DE STOCK 

--SP_HELPTEXT xAMNewItemSiteT
SELECT* FROM  xAMNewItemSite WHERE INVTID_SOL='20267' and siteid_sol ='HUAPT'
select * from intran where perpost ='201512' and crtd_user IN ('SAINGCHA','SYSADMIN') --AND CRTD_DATETIME ='2015-12-26'
AND INVTID ='20267' AND SITEID ='HUAPT'


-- SE VERIFICAR STOCK BASADO EN CODIGO DEL PRODUCTO
SELECT QTYONHAND,QTYAVAIL,* FROM ITEMSITE WHERE INVTID= '20267' and siteid ='HUAPT'

-- SE ACTUALIZA STOCK YA UNA VEZ QUE SE VERIFICO AR , IN , EMBARQUE 
--update ITEMSITE SET QTYONHAND =11896 WHERE INVTID='20267' AND SITEID ='HUAPT'



-------------OTROS


ARCust_Cpny_Balance 'ALTOMAYO','20486503255'
sp_helptext  ARCust_Cpny_Balance
arbal_custid '20486503255', 'ALTOMAYO'
ARDoc_CpnyID_Rlsed '20486503255', 'ALTOMAYO' 
sp_helptext ARDoc_CpnyID_Rlsed
Select * from ARDoc, Currncy  
Where ARDoc.CuryId = Currncy.CuryId and  
ARDoc.CustId = '20486503255' and  
ArDoc.CpnyID = 'ALTOMAYO' and   
ARDoc.Rlsed = 1  
Order by CustId, DocDate DESC   










