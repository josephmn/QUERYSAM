
select BatNbr, RefNbr, KitID, KitCntr, SiteId, TranDate, LUpd_User, S4Future11 from AssyDoc 
where KitID = '21758' 
and BatNbr = '000031' 
order By BatNbr, TranDate


select LotSerNbr, BatNbr, RefNbr, InvtID, SiteID, Crtd_User, Qty, UnitCost, SiteID, ToSiteID, TranType, TranDate, InvtMult, Crtd_DateTime
from LotSerT where InvtId = '21758' 
and BatNbr = '000031'
--and LotSerNbr = '0308201803'

Select LotSerNbr, InvtId, SiteID, OrigQty, QtyOnHand, Cost, Crtd_DateTime, Crtd_User from LotSerMst 
where LotSerNbr = '0108201812'

Select user1, InvtID, Qty, BatNbr, RefNbr, SiteID, TranType, TranDesc, Crtd_DateTime, Crtd_User from INTran 
where user1 = '0108201812' 
and InvtID = '21758' 
--and BatNbr = '001936' 
--AND TranType = 'IN'


--SUCULENTA VISTA
--vs_LotexAlmacen


--SELECT * FROM JM_ReqInsumosLL WHERE Correlativo = '3'








/*
Select ShipperID, * from SOShipHeader where ShipperID = 'BCH0000174     '
select ShipperID, InvtId, * from SOShipLine where ShipperID = 'BCH0000174' InvtId = '21009'

select ShipperID, InvtId, * from SOShipLine x where InvtId = '21009'
order by x.ShipperID
*/










































































































