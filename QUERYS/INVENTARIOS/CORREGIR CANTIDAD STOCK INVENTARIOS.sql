
/**/

exec recargar_kardex 

sp_helptext recargar_kardex


------------profiler-------------------
 select distinct b.batnbr from batch B 
 inner join intran I on B.batnbr = I.batnbr
 where B.module ='IN' and I.TranType ='AJ'
 and b.rlsed =0 and b.Crtd_User='SYSADMIN'  

-----------validar formula en solomon
select * from CF_ResItem where NumTienda =  '44'  and  FechaNegocio =  '11/03/2015'  and  user07 =  '0'  and origen ='M'

---verificar componentes de solomon
Select * from Component where  --KitId =  'I210104' 


--'OBTENER EL ULTIMO NRO DE ITEM DE ESE DIA (ITEM)- debido a casos que se use mas de una vez al dia el programa
select Item = isnull(convert (char (10), (select max(convert(numeric,item))
 from CF_ResItemCompD  where NumTienda =  '44' 
 and  FechaNegocio =  '11/03/2015'  and  user07 =  '0' )),0)


 --' Solo manufacturados (M) Y  QUE NO SE HAYA GENERADO AUN SUS COMPONENTES --
select * from CF_ResItem where NumTienda =  '43'  and  FechaNegocio =  '09/05/2016' 
 and origen ='M' and  ExportadoEns = AND USER03=0 and  user07 =  '0' 

set dateformat dmy

-- validar stock disponible ---
select * from CF_StkEnsamb where NumTienda =  '43'  and  FechaNegocio =  '01/09/2016'   
and CodProd in (select invtid from inventory where StkItem=1) and cantidad > cantdisp

-UPDATE cf_newitemsite SET QTYONHAND =11 , QTYAVAIL  = 11 WHERE SITEID_SOL ='CFCUSCO1' AND INVTID_SOL='I210908'

select * from CF_StkEnsamb where NumTienda =  '44'  and  FechaNegocio =  '07/06/2016' and  CodProd  ='I250037'  
sp_helptext CF_StkEnsamb



select perpost,s4future07,status,* from batch where batnbr  ='028083' and module = 'in'
select perent,perpost,trandate,* from intran where batnbr  ='028083' 
select perent,perpost,trandate,* from gltran where batnbr  ='028083' and module = 'in'



update  BATCH  SET status  ='C' WHERE BATNBR ='028083' AND module  ='IN'


028083

--update CF_StkEnsamb set cantdisp =0.345  where NumTienda =  '44'  and  FechaNegocio =  '11/03/2015'  
--and CodProd in (select invtid from inventory where StkItem = 1 ) and cantidad >cantdisp and codprod ='i250175'

sp_helptext  CF_StkEnsamb

select * from cf_newitemsite where siteid_sol= 'CFCUSCO2' AND INVTID_SOL = 'I295060'


 0.00339
 
UPDATE  batch SET STATUS  ='B' where batnbr  ='028083' and module  ='IN'
update batch set CrTot = 0.00339 , CtrlTot = 0.00339 , CuryCrTot  = 0.00339  , CuryCtrlTot = 0.00339  ,CuryDepositAmt  = 0.00339  , CuryDrTot = 0.00339 where batnbr  ='028083' and module  ='IN'


CrTot
0
CtrlTot
0
CuryCrTot
0
CuryCtrlTot
0
CuryDepositAmt
0
CuryDrTot
0

--UPDATE cf_newitemsite SET QTYONHAND =0.345 , QTYAVAIL  = 0.345 WHERE SITEID_SOL ='CFCUSCO2' AND INVTID_SOL='i250175'

''

SP_HELPTEXT  cf_newitemsite

SELECT QTYONHAND,QTYAVAIL,* FROM ITEMSITE WHERE INVTID= 'I250055' and siteid  ='CFCUSCO2'

select* from intran where  rcptnbr ='i210104' and perpost ='201511' and rcptdate ='2015-11-30'


--- actualizo la cantidad para migrar ---
--update ITEMSITE SET QTYONHAND =12, QTYAVAIL =12 WHERE INVTID ='I250227' and siteid  ='CFCUSCO1'
*/


SELECT QTYONHAND,QTYAVAIL,*  FROM ITEMSITE WHERE INVTID = 'I250179' and siteid  ='CFCUSCO1' 



I250179                       
--- ACTIUALIZO LA CANTIDAD COMPROMETIDA
 select *  from  CF_ResItemCompD where codprod ='i250037'
 update CF_ResItemCompD set cantidad  = 0 where codprod ='I250037'

-- UPDATE ITEMSITE SET AvgCost = AvgCost * 3 ,TotCost  = TotCost * 3 WHERE  INVTID ='I250179' and siteid  ='CFCUSCO1'

 UPDATE ITEMSITE SET AvgCost = AvgCost + 1 ,TotCost  = TotCost 1 WHERE  INVTID ='i250055' and siteid  ='CFCUSCO2'
 
-122.608163
	TotCost
-300.39
 select *  from  Component where cmpnentid ='i250037' 

use [amcaf2015sys]
go

select * from screen where number like '%10020%'


---------------------------------------------------------------------------
CREATE VIEW dbo.CF_StkEnsamb  
AS  
SELECT  CF_CantNecesaria.NumTienda ,  
  CF_CantNecesaria.FechaNegocio,   
  CF_CantNecesaria.siteID,   
  CF_CantNecesaria.WhseLoc,   
          CF_CantNecesaria.CodProd,   
  CF_CantNecesaria.Cantidad,   
  isnull(CF_NewItemSite.QtyAvail,0.0) as CantDisp,  
  isnull(CF_NewItemSite.AvgCost,0.0) as AvgCost,  
  isnull(CF_NewItemSite.TotCost,0.0) as TotCost,  
  convert(timestamp,') as tstmap  
FROM      CF_CantNecesaria inner join Inventory on CF_CantNecesaria.CodProd = Inventory. InvtId   
  LEFT OUTER JOIN CF_NewItemSite     
  ON CF_CantNecesaria.siteID = CF_NewItemSite.SiteID_Sol AND CF_CantNecesaria.CodProd = CF_NewItemSite.InvtID_Sol  
where  
Source <> 'M'   
--CF_CantNecesaria.siteID ='CFJOCPLA' AND CF_CantNecesaria.FechaNegocio ='2012-07-13' AND (  
--  
-- ( (Source ='M' and user4 >0 and CF_NewItemSite.QtyAvail <0 ) or (Source ='P')   
--or (Source ='M'  and CF_NewItemSite.QtyAvail >=0 and CF_CantNecesaria.Cantidad >0)  
--))

sp_helptext  CF_CantNecesaria 

SELECT CN.NumTienda, CN.FechaNegocio, CN.siteID, CN.WhseLoc, CN.CodProd, SUM(CN.Cantidad) AS Cantidad--,COUNT_BIG(*) AS Count  
FROM  (  
 SELECT Tipo,NumTienda,FechaNegocio,siteID,WhseLoc,CodProd,Cantidad FROM dbo.CF_CantNecesariaKits  
 UNION  
 SELECT Tipo,NumTienda,FechaNegocio,siteID,WhseLoc,CodProd,Cantidad FROM dbo.CF_CantNecesariaNoKits  
 UNION  
 SELECT Tipo,NumTienda,FechaNegocio,siteID,WhseLoc,CodProd,Cantidad FROM dbo.CF_CantNecesariaING  
 ) AS CN  
GROUP BY CN.NumTienda, CN.FechaNegocio, CN.siteID, CN.WhseLoc, CN.CodProd  



 sp_helptext CF_CantNecesariaKits
 
 sp_helptext cf_cantidadpt
 
 sp_helptext CF_ResItemCompD
            sum(isnull(CF_ResItemCompD.Cantidad,0)) as Cantidad--,COUNT_BIG(*) AS Count  
 
 
 select identificador, nombrelocal, fecha, fechanegocio, movimiento, idmovimiento, MovAsociado, Numero, Correlativo,Corre_Asociado,Fecha_Asociado, cant, Observacion, Lote ,LoteAsociado  
from kardexINV
where identificador  = '43' and numero  ='00000334'
delete from kardexINV where identificador  = '43' and numero  ='00000334'


sp_helptext  Vs_SolomonKardex

select *  from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex where movimiento in('AJUSTE DE INVENTARIO','ENTRADA DE INSUMO')     and identificador  ='43' and numero  ='00000334' 


update 


sp_helptext  'Vs_SolomonKardex'
ext
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE view Vs_SolomonKardex    
as    
select *,isnull((select rtrim(batnbr)+' '+ (case when status in('P','U') then 'LIB' else 'NOLIB' end ) from batch where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(idmovimiento))+'J') ),'') Lote,''LoteAsociado    
from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex where movimiento in('AJUSTE DE INVENTARIO','ENTRADA DE INSUMO')    
union all    
select *,isnull((select rtrim(batnbr)+' '+ (case when status in('P','U') then 'LIB' else 'NOLIB' end )  from batch where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(idmovimiento))+'T') ) ,''),''LoteAsociado    
from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex where movimiento in('SALIDA POR TRANSFERENCIA')    
union all    
select *,isnull((select rtrim(s4future11)+' '+ (case when status in('P','U','R') then 'LIB' else 'NOLIB' end ) from trnsfrdoc where batnbr in (select batnbr from batch where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(MovAsociado))+'T') ) ),''),  

delete from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex  where movimiento in('AJUSTE DE INVENTARIO','ENTRADA DE INSUMO')     and identificador  ='43' and numero  ='00000334'   
  
isnull(( select batnbr + (case when status in('P','U') then 'LIB' else 'NOLIB' end ) from batch where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(MovAsociado))+'T') ) ,'')LoteAsociado    
from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex where movimiento in('ENTRADA POR TRANSFERENCIA')    
union all    
select *,isnull((select top 1 rtrim(batnbr)+' '+ (case when status in('R','C') then 'LIB' else 'NOLIB' end )  from poreceipt where POnbr in (select PONbr from PurchOrd where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(MovAsociado))) ) ),''),    
isnull( (select PONbr from PurchOrd where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(MovAsociado))) ) ,'')    
from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex where movimiento in('RECEPCION DE COMPRA')   and idmovimiento not in ( 'CFCUZCO2000000000092','CFCUZCO2000000000435')  
union all    
select *,ISNULL( (select top 1 status from (  
select  (case WHEN status in ('P','U') then 'LIB' ELSE 'NOLIB' END)  status from batch where batnbr in (    
select distinct ExportadoEns  from CF_ResItem  where numtienda collate Modern_Spanish_CI_AS =IDENTIFICADOR and fechanegocio=V.fechanegocio     
union all    
select distinct ExportadoSal from CF_ResItem  where numtienda collate Modern_Spanish_CI_AS =IDENTIFICADOR and fechanegocio=V.fechanegocio     
) and module ='IN' ) x order by status asc) ,'NOGEN')  
  
,''LoteAsociado    
from [SGRPAM].SGRPAM2016.DBO.Vs_SolomonKardex V where movimiento in('DOCUMENTO DE VENTA') 





from Vs_SolomonKardex  


sp_helptext  'SGRPAM2016.DBO.Vs_SolomonKardex'