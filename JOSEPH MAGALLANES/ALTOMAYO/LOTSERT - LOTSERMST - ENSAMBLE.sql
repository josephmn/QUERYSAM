/*** INVENTARIOS ***/
/*
--LotM.InvtId = '21726' and 
--LotM.SiteID = 'CIXPT' and 

--LotSerMst
select LotSerNbr, Crtd_DateTime, SiteID, InvtID, OrigQty, QtyOnHand, Cost, Crtd_User from LotSerMst where InvtID = '21726' /*and SiteID = 'CIXPT' */AND LotSerNbr = '0201201808'
--select LotSerNbr, Crtd_DateTime, SiteID, InvtID, OrigQty, QtyOnHand, Cost, Crtd_User from LotSerMst where InvtID = '21478' and SiteID = 'CIXPT' and QtyOnHand <> 0

--LotSerT
select BatNbr, LotSerNbr, Crtd_DateTime, SiteID, InvtID, Crtd_User, Qty, UnitCost, SiteID, ToSiteID, TranType, TranDate, InvtMult from LotSerT 
where InvtID = '21726' and SiteID = 'CIXPROD' and LotSerNbr = '0201201808' and BatNbr = '000642'
--select BatNbr, LotSerNbr, Crtd_DateTime, SiteID, InvtID, Crtd_User, Qty, UnitCost, SiteID, ToSiteID, TranType, TranDate, InvtMult from LotSerT where InvtID = '21726' and SiteID = 'CIXPT' and LotSerNbr = '0201201808'

--AssyDoc
select BatNbr, KitID, KitCntr, TranDate, SiteID, Crtd_User from AssyDoc where BatNbr = '000642' --and KitID = '21726'
*/


/**** VERIFICAR SI HAY NEGATIVO ****/ /***-CIXPT -  CIXPT - ACM1PT-****/

SELECT * FROM ZLotSerMaster WHERE InvtID = '21795' and SiteID = 'CIXPT'

/**** VERIFICAR EN SOSHIP ****/

select 'EXEC ASP_PROCESASEMBARQUESH '''+rtrim(ltrim(shipperid))+'''' from LotsertSL where status  ='A' AND InvtID = '21795' and SiteID = 'CIXPT' and LotSerNbr ='0521201801'

--SELECT * FROM LotsertSL WHERE ShipperId = 'FCH0003807'

--para pasar intran a lotsert
 --exec InsertLotSertSL   '004571' 

--1.- SI HAY NEGATIVO CAMBIAR AL LOTE SERIE QUE HAY STOCK ON HAND

--- SI EXISTE NEGATIVO UPDATE EN LOTSERT

select BatNbr, LotSerNbr, Crtd_DateTime, SiteID, InvtID, Crtd_User, Qty, UnitCost, SiteID, ToSiteID, TranType, TranDate, InvtMult 
from LotSerT 
where InvtID = '21795' and SiteID = 'CIXPT' And LotSerNbr = '0521201801' and BatNbr = '004897'

--select LotSerNbr, Qty, InvtID, * from LotSerT
update LotSerT 
set LotSerNbr = '05222018023' --lote nuevo en positivo
where InvtID = '21795' and SiteID = 'CIXPT' And LotSerNbr = '0521201801' and BatNbr = '004897'

--LUEGO CAMBIAR EL LOTE SERIE EN INTRAN

select user1, Qty, * from Intran 
where BatNbr = '004897' and InvtID = '21795' and User1 = '0521201801' --and Qty IN (2,992) --and TranType = 'IN'

--select LotSerNbr, Qty, InvtID, * from LotSerT
update Intran
set user1 = '05222018023' 
where BatNbr = '004897' and InvtID = '21795' and User1 = '0521201801'


--SELECT * 
---- UPDATE A SET LotSerNbr = '05162018000'
--FROM LotSerMst A WHERE SiteID = 'LIMCEN' AND InvtID = '21795' AND LotSerNbr = '0516201800'

--SELECT * FROM LotSerT WHERE SiteID = 'HUAPT' AND InvtID = '21795' AND LotSerNbr = '0516201800'

--SELECT * FROM INTran WHERE InvtID = '21795' AND USER1 = '0516201800'


 /*
SELECT * FROM LOTSERMST WHERE INVTID = '21795' AND SITEID = 'CIXPT'

SELECT * FROM ZLotSerMaster WHERE InvtID = '21795' and SiteID = 'CIXPT'
*/