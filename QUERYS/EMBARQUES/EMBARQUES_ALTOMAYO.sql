
}

--2
/*

72707896

S000004369
F160071404     

select shipperid,custid,siteid,status,slsperid,invcnbr,BalDue,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,TotCost,*
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from soshipheader  where invcnbr in('F160071404')      --   where shipperid in('FLI0001667')



select invtid,QtyShip,ShipWght,*
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from soshipline  where shipperid =  'FLI0005193' and invtid ='21002'


ShipperID
FLI0004007   
ShipWght
200  

select invtid,ShipperID,ShipWght,*
from soshipline  where shipperid =  'FLI0004007' and invtid ='21002'


select * from inventory where invtid  ='21002'





select *
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from soshipline  where shipperid =  'NCHU000008'




select status,slsperid,invcnbr,BalDue,inbatnbr,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,TotCost,*
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from soshipheader where user1 = 'S000004369'


select 









select status,slsperid,invcnbr,BalDue,inbatnbr,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,TotCost,*
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from soshipheader where shipperid = 'FLI0002022'

select status,slsperid,invcnbr,BalDue,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,TotCost,*
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from soshipheader  where shipperid ='BDH0001011' 


select *
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from soshipline  where shipperid =  'FLI0004007'




DELETE FROM  soshipheader  where shipperid ='NCHU000008' 
DELETE FROM  soshipline  where shipperid ='NCHU000008' 

select status,slsperid,invcnbr,BalDue,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,TotCost,*
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from NEWSH where shipperid ='BDH0001011'
SELECT * FROM  soshipline WHERE shipperid ='BDH0001011'

select *  from soshipline where shipperid ='BCH0025966'




select status,slsperid,invcnbr,BalDue,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,TotCost,*
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from NEWSH where shipperid ='FMK0000007'


select TotCost,TotInvc  ,TotMerch,TxblAmt00,CuryTotCost,CuryTotInvc      ,CuryTotMerch,CuryTxblAmt00,CurySlsPrice,CuryTaxAmt00,Cost,TaxAmt00,SlsPrice,*
--update soshipline set TotInvc= CuryTotInvc * 3.156,TotMerch= CuryTotMerch * 3.156 ,TxblAmt00= CuryTxblAmt00 * 3.156 ,TotCost= CuryTotCost * 3.156 ,TaxAmt00= CuryTaxAmt00 * 3.156 ,SlsPrice= CurySlsPrice * 3.156 
v


delete from soshipheader where shipperid ='NCHU000005'
delete  from soshipline where shipperid ='NCHU000005'


select * from ardoc where refnbr = 'C370000494'     




select TotCost,TotInvc  ,TotMerch,TxblAmt00,CuryTotCost,CuryTotInvc      ,CuryTotMerch,CuryTxblAmt00,CurySlsPrice,CuryTaxAmt00,Cost,TaxAmt00,SlsPrice,*
--update soshipline set TotInvc= CuryTotInvc * 3.156,TotMerch= CuryTotMerch * 3.156 ,TxblAmt00= CuryTxblAmt00 * 3.156 ,TotCost= CuryTotCost * 3.156 ,TaxAmt00= CuryTaxAmt00 * 3.156 ,SlsPrice= CurySlsPrice * 3.156 
from soshipline where shipperid ='fli0003598'


select*  from ardoc where refnbr = 'C370000494'


             
select  * from newsh where shipperid ='FLI0000831'

             
select  * from newsh where shipperid ='FLI0000826'


SELECT *  FROM ARDOC WHERE REFNBR =''



select distinct status from soshipheader

update newsh set 

sp_helptext man_ActualizaVendedor




--3


Dbnav_xAMDespEmbD  'LIMCEN',  'S000003964'



------------------------------
select * from xAMDespEmbH Where SiteIDH =  'LIMCEN'  and NroDespachoH =   'E000001691' 
select * from xAMDespEmbH Where SiteIDH =  'LIMCEN' 

SELECT DISTINCT STATUS FROM xAMDespEmbH

select * from AMVouchers Where SerieGR =  '032' 

update soshipheader set user2 ='N032001886' where shipperid in('ncli000159')   and user2=''
update amvouchers set correlativoni  ='001886' where  SerieGR =  '032'  and correlativoni ='001885'



 select * from  phedespacho  Where NroDespacho =  'E000001691'  and Almacen =  'LIMCEN' 

 select * from  phedespacho  Where almacen  ='LIMCEN'

 Select *  
 FROM           
 dbo.xAMDespEmbD   where slsperid ='026' order by invcdate desc




 And  
 (NroDespachoD =  @Parm2)   
 Order By  
 InvcNbr,InvcDate,SlsperID,CustID


select

Dbnav_xAMDespEmbD  'LIMCEN',  'E000001691'

SP_HELPTEXT Dbnav_xAMDespEmbD

 select * from xAMDespEmbH where NroDespachoH  ='S000003964'
  select * from phedespacho where NroDespacho  ='S000003964'
NroDespachoH
S000001792                    

SQL:BatchStarting	select * from xAMDespEmbH Where SiteIDH =  'LIMCEN'  and NroDespachoH =   'E000001691' 	Solomon IV4018200		master					15408	61	2015-10-27 17:16:05.910			
SQL:BatchCompleted	select * from xAMDespEmbH Where SiteIDH =  'LIMCEN'  and NroDespachoH =   'E000001691' 	Solomon IV4018200		master	0	25	0	2	15408	61	2015-10-27 17:16:05.910	2015-10-27 17:16:05.910		
SQL:BatchStarting	select * from AMVouchers Where SerieGR =  '032' 	Solomon IV4018200		master					15408	61	2015-10-27 17:16:05.910			
SQL:BatchCompleted	select * from AMVouchers Where SerieGR =  '032' 	Solomon IV4018200		master	15	3	0	0	15408	61	2015-10-27 17:16:05.910	2015-10-27 17:16:05.923		
SQL:BatchStarting	update AMVouchers set User02 = '' where User02 =  'SYSADMIN' 	Solomon IV4018200		master					15408	61	2015-10-27 17:16:05.923			
SQL:BatchCompleted	update AMVouchers set User02 = '' where User02 =  'SYSADMIN' 	Solomon IV4018200		master	0	3	0	0	15408	61	2015-10-27 17:16:05.923	2015-10-27 17:16:05.923		
SQL:BatchStarting	update AMVouchers set User02 =  'SYSADMIN'  where SerieGR =  'E000001691' 	Solomon IV4018200		master					15408	61	2015-10-27 17:16:05.923			
SQL:BatchCompleted	update AMVouchers set User02 =  'SYSADMIN'  where SerieGR =  'E000001691' 	Solomon IV4018200		master	0	2	0	0	15408	61	2015-10-27 17:16:05.923	2015-10-27 17:16:05.923		
SQL:BatchStarting	update AMVouchers set User02 = '' where User02 =  'SYSADMIN' 	Solomon IV4018200		master					15408	61	2015-10-27 17:16:05.923			
SQL:BatchCompleted	update AMVouchers set User02 = '' where User02 =  'SYSADMIN' 	Solomon IV4018200		master	0	3	0	0	15408	61	2015-10-27 17:16:05.923	2015-10-27 17:16:05.923		
SQL:BatchStarting	update AMVouchers set User02 =  'SYSADMIN'  where SerieGR =  '032' 	Solomon IV4018200		master					15408	61	2015-10-27 17:16:05.923			
SQL:BatchCompleted	update AMVouchers set User02 =  'SYSADMIN'  where SerieGR =  '032' 	Solomon IV4018200		master	0	3	0	13	15408	61	2015-10-27 17:16:05.923	2015-10-27 17:16:05.923		
SQL:BatchStarting	update phedespacho set NroGuia = '' where NroGuia =  'SYSADMIN' 	Solomon IV4018200		master					15408	61	2015-10-27 17:16:05.923			
SQL:BatchCompleted	update phedespacho set NroGuia = '' where NroGuia =  'SYSADMIN' 	Solomon IV4018200		master	16	294	0	5	15408	61	2015-10-27 17:16:05.923	2015-10-27 17:16:05.940		
SQL:BatchStarting	update phedespacho set NroGuia =  'SYSADMIN'  Where NroDespacho =  'E000001691'  and Almacen =  'LIMCEN' 	Solomon IV4018200		master					15408	61	2015-10-27 17:16:05.940			
SQL:BatchCompleted	update phedespacho set NroGuia =  'SYSADMIN'  Where NroDespacho =  'E000001691'  and Almacen =  'LIMCEN' 	Solomon IV4018200		master	0	3	0	11	15408	61	2015-10-27 17:16:05.940	2015-10-27 17:16:05.957		
RPC:Completed	exec sp_cursorclose @cursor=180150019	Solomon IV4018200		master	0	1	0	0	15408	97	2015-10-27 17:16:05.957	2015-10-27 17:16:05.957	0X00000000020000001C00730070005F0063007500720073006F00720063006C006F00730065002400000003000600381069006E0074000E0040006300750072	
RPC:Completed	declare @p1 int
set @p1=180150023
declare @p3 int
set @p3=1
declare @p5 int
set @p5=1
exec sp_cursoropen @cursor=@p1 output,@stmt='Dbnav_xAMDespEmbD  ''LIMCEN'',  ''E000001691'' ',@scrollopt=@p3 output,@ccopt=4,@rows=@p5 output
select @p1, @p3, @p5	Solomon IV4018200		master	0	51	0	2	15408	97	2015-10-27 17:16:05.957	2015-10-27 17:16:05.957	0X00000000060000001A00730070005F0063007500720073006F0072006F00700065006E002400000003000600381169006E0074000E00400063007500720073006F00720007DFBC0A4D00000081000800233074006500780074000A004000730074006D0074002B00000044626E61765F78414D44657370456D6244202027	
RPC:Completed	exec sp_cursorfetch @cursor=180150023,@fetchtype=1,@rownumber=1,@nrows=25	Solomon IV4018200		master	0	20	0	0	15408	97	2015-10-27 17:16:05.957	2015-10-27 17:16:05.957	0X00000000050000001C00730070005F0063007500720073006F007200660065007400630068002400000003000600381069006E0074000E00400063007500720073006F00720007DFBC0A2A00000003000600381069006E00740014004000660065007400630068007400790070006500010000002A000000030006003810	
RPC:Completed	declare @p3 int
set @p3=1
declare @p4 int
set @p4=1
exec sp_cursorfetch @cursor=180150023,@fetchtype=256,@rownumber=@p3 output,@nrows=@p4 output
select @p3, @p4	Solomon IV4018200		master	0	0	0	0	15408	97	2015-10-27 17:16:05.970	2015-10-27 17:16:05.970	0X00000000050000001C00730070005F0063007500720073006F007200660065007400630068002400000003000600381069006E0074000E00400063007500720073006F00720007DFBC0A2A00000003000600381069006E00740014004000660065007400630068007400790070006500000100002A000000030006003811	





select * from batch WHERE BATNBR ='014397' AND MODULE ='IN'
SELECT  * FROM INTRAN WHERE BATNBR ='014397'
select * from GLTRAN WHERE BATNBR ='014397' AND MODULE ='IN'

--
--delete from intran where batnbr ='014397'and refnbr = 'C370000495'     
--delete from gltran where batnbr ='014397'and refnbr = 'C370000495'  and module ='IN'    


----------------------------------------------------------------
SELECT QTYONHAND,QTYAVAIL,* FROM ITEMSITE WHERE INVTID= '20267' and siteid ='HUAPT'

update ITEMSITE SET QTYONHAND =11896 WHERE INVTID='20267' AND SITEID ='HUAPT'

SP_HELPTEXT xamnewitemsitet 

SELECT* FROM xamnewitemsitet WHERE   InvtID_Sol ='20267' AND SITEID_SOL ='HUAPT'


---
  
CREATE view xAMNewItemSiteT  
as  
SELECT   xAMNewItemSite.SiteID_Sol,  
   xAMNewItemSite.InvtID_Sol ,  
   xAMNewItemSite.QtyOnHand , --Liberado  
         xAMNewItemSite.QtyPorDesp ,   
   xAMNewItemSite.QtyEnDesp ,   
   xAMNewItemSite.QtyInPorLib ,   
         xAMNewItemSite.QtyInTransit ,   
   --xAMNewItemSite.QtyAvail ,   
   'QtyEnNextel' = IsNull(xAMProdNexSite.QtyEnNextel,0),--case when  xAMProdNexSite.QtyEnNextel is null then 0 else xAMProdNexSite.QtyEnNextel end ,   
         'QtyNewExist'  = xAMNewItemSite.QtyOnHand - xAMNewItemSite.QtyEnDesp - xAMNewItemSite.QtyInPorLib ,  
         'QtyNewDisp'  = xAMNewItemSite.QtyOnHand - xAMNewItemSite.QtyPorDesp - xAMNewItemSite.QtyEnDesp - xAMNewItemSite.QtyInPorLib - IsNull(xAMProdNexSite.QtyEnNextel,0)  
  
  
FROM     xAMNewItemSite LEFT OUTER JOIN  
         xAMProdNexSite ON xAMNewItemSite.SiteID_Sol = xAMProdNexSite.SiteID AND xAMNewItemSite.InvtID_Sol = xAMProdNexSite.InvtID  
WHERE INVTID_SOL='20267' and siteid_sol ='HUAPT'
---------------
SELECT* FROM  xAMNewItemSite WHERE INVTID_SOL='20267' and siteid_sol ='HUAPT'
select * from intran where perpost ='201512' and crtd_user IN ('SAINGCHA','SYSADMIN') --AND CRTD_DATETIME ='2015-12-26'
AND INVTID ='20267' AND SITEID ='HUAPT'
----------------
SP_HELPTEXT  xAMNewItemSite

SELECT* FROM  xAMProdNexSite





*/

---- LIQUIDACION DE DESPACHO ( CAMBIO D POR R PARA MODIFICACION   )
/*
SELECT * FROM CUSTOMER WHERE CUSTID  IN  ('20512020667','20524310857')



Dbnav_xAMDespEmbD_1 'LIMCEN',  'S000003964'

 SP_HELPTEXT Dbnav_xAMDespEmbD_1 
 
 SELECT * FROM   dbo.xAMDespEmbD_1     WHERE NRODESPACHOD ='S000003964'
  SELECT * FROM   dbo.xAMDespEmbD_1     WHERE NRODESPACHOD ='S000003954'
  
  
  SELECT * FROM  phedespacho1 WHERE NroDespacho ='S000003964'
  
 UPDATE xAMDespEmbD_1 SET CANCELLED  = 0 WHERE NRODESPACHOD ='S000003964'
 
  UPDATE phedespacho1 SET USER11 ='R' where NroDespacho ='S000003964'
  */
  
  
  
  SP_HELPTEXT VORDEN_PEDIDOS 
  FLI0005193
  
  
   CREATE VIEW VORDEN_PEDIDOS    
  AS    
  --Funcion  : Lista pedidos y cantidad que se atendio    
  --Sistema  : Solomon IV    
  --Usuario  : Gasla Baudat Laisson Gadel    
  --Ultima Mod : 06/09/2016    
  select SUBSTRING(  LEFT(CONVERT(VARCHAR, H.FechaOrdVenta, 120), 10),1,4) + SUBSTRING(LEFT(CONVERT(VARCHAR, H.FechaOrdVenta, 120), 10),6,2)Perpost,    
   H.NroOrdVenta,H.FechaOrdVenta,H.HoraAprobOrd,H.SOTypeID,H.SITEID ,H.CustOrdNbr,Z.shipperid AS  EmbRelacionado,    
       
   C.Custid,C.name,S.addr1,D.InvtID,I.Descr,D.user01,    
  D.MonQtyOrd,(D.MonQtyOrd -D.S4Future03)Atendido ,isnull((select QTYAVAIL from xamhiststockdiario where SITEID =H.SITEID AND INVTID = D.INVTID  AND  TRANDATE  =  DATEADD(d,-1,H.FechaOrdVenta) ),0)   StockAnt  ,  
  MonPrecio ,MonTotal ,s.SlsPerID ,isnull((select SUM(MonTotal )from SOOrdVentaD where NroOrdVenta = h.NroOrdVenta and MonQtySaldo=0),0) TotalOV,H.Status   
   from SOOrdVentaH H    
  INNER JOIN SOOrdVentaD D ON H.NroOrdVenta = d.NroOrdVenta    
  INNER JOIN INVENTORY I ON D.InvtID = I.InvtID    
      
  INNER JOIN CUSTOMER C ON H.CUSTID = C.CUSTID    
  INNER JOIN SoAddress S ON C.CUSTID =S.CUSTID and H.shiptoid = S.shiptoid    
  LEFT JOIN soshipheader Z ON H.NroOrdVenta = Z.S4Future12    
  WHERE  h.Status in ('A','P','X')  and  left(h.NroOrdventa,2)<>'OV' and  left(h.user17,2) <> 1 
  
  
  
  SELECT * FROM  SOOrdVentaH WHERE NroOrdVenta  ='FLI0005193'
  SELECT * FROM  SOOrdVentaD WHERE NroOrdVenta  ='FLI0005193'
  
  
  UPDATE SOOrdVentaD SET MonTotal  = 888.00 WHERE NroOrdVenta  ='FLI0005193'
  
  
  use [AM2017SYS]
  go
  
  
  select * from Screen 
  insert into Screen (modULE,NAME,NUMBER,SCREENTYPE) values ('OM','Indicadores de Gestion','INCBR00','R' )
  
  SELECT * FROM InventoryADG  WHERE InvtID   ='21039'