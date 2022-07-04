
--when NextFunctionClass='0100' and NextFunctionID='4099999 ' then 'Imprimir Factura' 

--- QUITAR EN SOSHIPPHEADER

select S4Future12, s4future02, ShipperID, USER2, InvcNbr, s4future02, InvcDate, CustID, NextFunctionClass, NextFunctionID, * 
-- update h set s4future02 = '', NextFunctionClass = '0100', NextFunctionID = '4099999'
from newSH h where ShipperID = 'FLI0003718'

select InvtID, DESCR, USER7, qtyship,* 
-- delete
from newSL WHERE  ShipperID = 'FLI0003718' AND USER7 <> '' 


--- BOTON REFRESAR PANTALLA IMPRIMIR FACTURAS
select * 
-- delete 
from soshiplinesplit1 where ShipperID = 'FLI0003718' AND LUpd_User = 'SYSADMIN'

SELECT * 
-- DELETE
FROM soshiplot1 WHERE ShipperID = 'FLI0003718' AND LUpd_User = 'SYSADMIN'



-- CONSULTA PARA BONIFICACION

SELECT Sum(qtyship) FROM newsl WHERE shipperid =  'FCH0009747'  And InvtID =  '21162'  and  user7 ='' 
SELECT QtyAvail FROM xAMNewLocation WHERE Invtid_Sol =  '21162'  And  SiteID_Sol =  'CIXPT'  And WhSeloc_Sol =  'BUENESTADO' 
SELECT QtyEnNextel FROM xAMProdNexLoc WHERE Invtid =  '21162'  AND SiteID =  'CIXPT'  And WhSeloc =  'BUENESTADO' 
SELECT * FROM xAMPromocionD_Vista WHERE CodProm =  '0041'  And INV_InvtIDB =  '21162' 
SELECT TOP 1 CONVERT(int,LineRef)  AS LineRef FROM newsl WHERE ShipperID =  'FCH0009747'  Order By LineRef Desc

select * from xAM_ListPrecioPorClienteSol where CustID =  '20480050984'  and InvtID =  '21162'  and SlsUnit=  'UND' 



SELECT Sum(qtyship) FROM newsl WHERE shipperid =  'FCH0009662'  And InvtID =  '21753'  and  user7 ='' 
SELECT QtyAvail FROM xAMNewLocation WHERE Invtid_Sol =  '21753'  And  SiteID_Sol =  'LIMCEN'  And WhSeloc_Sol =  'BUENESTADO' 
SELECT QtyEnNextel FROM xAMProdNexLoc WHERE Invtid =  '21753'  AND SiteID =  'LIMCEN'  And WhSeloc =  'BUENESTADO' 
SELECT * FROM xAMPromocionD_Vista WHERE CodProm =  '0018'  And INV_InvtIDB =  '21753' 
SELECT TOP 1 CONVERT(int,LineRef)  AS LineRef FROM newsl WHERE ShipperID =  'FLI0002089'  Order By LineRef Desc
SELECT * FROM newsl WHERE User7 <>'' And ShipperID =  'FLI0002089'  And InvtID =  '21753' 
select * from xAM_ListPrecioPorClienteSol where CustID =  '20537321190'  and InvtID =  '21753'  and SlsUnit=  'UND' 




SELECT * FROM newSL WHERE ShipperID = 'FLI0003718'

SELECT * FROM SOShipLot1 WHERE ShipperID = 'FLI0003718'


SELECT * FROM SOShipLot1 WHERE ShipperID = 'FLI0003718'

SELECT * FROM newSL WHERE ShipperID = 'FLI0003718'

----- INSERT AL REGRESAR PASO DE IMPRIMIR FACTURA

--INSERT INTO SOShipLot1 (
--BoxRef,CpnyID,Crtd_DateTime,Crtd_Prog,Crtd_User,DropShip,InvtId,LineRef,LotSerNbr,LotSerRef,LUpd_DateTime,LUpd_Prog,LUpd_User,NoteID,QtyPick,QtyShip,RMADisposition,S4Future01,S4Future02,
--S4Future03,S4Future04,S4Future05,S4Future06,S4Future07,S4Future08,S4Future09,S4Future10,S4Future11,S4Future12,ShipperID,User1,User10,User2,User3,User4,User5,User6,User7,User8,User9,WhseLoc)

--SELECT '','ALTOMAYO', Crtd_DateTime, '40110', Crtd_User, 0, InvtID, LineRef, '', LineRef, LUpd_DateTime, '40110', Crtd_User, 0,0, QtyShip, 'NA', '','',0,0,0,0,
--'1900-01-01 00:00:00','1900-01-01 00:00:00',0,0,'','',ShipperID,'','1900-01-01 00:00:00','','','',0,0,'','','1900-01-01 00:00:00','BUENESTADO' FROM newSL WHERE ShipperID = 'FDH0005692' AND 
--LineRef in (select LineRef from newSL where ShipperID = 'FDH0005692' AND USER7 = '')


--SELECT ClassId, PriceClassID, Crtd_User, Crtd_DateTime, LUpd_User, LUpd_DateTime, * FROM Customer WHERE CustId = '20480050984'










