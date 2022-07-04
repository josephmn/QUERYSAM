SELECT * FROM LOCATION
--UPDATE LOCATION 
--SET qtyonhand = (select qtyonhand from itemsite where invtid = location.invtid and siteid=location.siteid)
where  whseloc='BUENESTADO' AND round(qtyonhand,1) <> round((select qtyonhand from itemsite where invtid = location.invtid and siteid=location.siteid),1)


SELECT * FROM ItemSite WHERE SiteID = 'CFCENTRAL' AND InvtID = 'I250212'

insert into location 
(CountStatus, Crtd_DateTime, Crtd_Prog, Crtd_User, InvtID, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, QtyAlloc, QtyOnHand, QtyShipNotInv, 
QtyWORlsedDemand, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, 
S4Future11, S4Future12, Selected, SiteID, User1, User2, User3, User4, User5, User6, User7, User8, WhseLoc)

select CountStatus, Crtd_DateTime, Crtd_Prog, 'SYSADMIN', InvtID, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, QtyAlloc, QtyOnHand, QtyShipNotInv, 
QtyWORlsedDemand, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, 
S4Future11, S4Future12, Selected, 'CFCENTRAL', User1, User2, User3, User4, User5, User6, User7, User8, WhseLoc from location where siteid = 'CFCUSCO2' and invtid = 'I250033'  

INSERT INTO  ItemSite 
(ABCCode, AllocQty, AvgCost, BMIAvgCost, BMIDirStdCst, BMIFOvhStdCst, BMILastCost, BMIPDirStdCst, BMIPFOvhStdCst, BMIPStdCst, 
BMIPVOvhStdCst, BMIStdCost, BMITotCost, BMIVOvhStdCst, Buyer, COGSAcct, COGSSub, CountStatus, CpnyID, Crtd_DateTime, Crtd_Prog, 
Crtd_User, CycleID, DfltPOUnit, DfltSOUnit, DirStdCst, EOQ, FOvhStdCst, InvtAcct, InvtID, InvtSub, LastBookQty, LastCost, LastCountDate, 
LastPurchaseDate, LastPurchasePrice, LastStdCost, LastVarAmt, LastVarPct, LastVarQty, LastVendor, LeadTime, LUpd_DateTime, LUpd_Prog, 
LUpd_User, MaxOnHand, MfgLeadTime, MoveClass, NoteID, PDirStdCst, PFOvhStdCst, PrimVendID, ProdMgrID, PStdCostDate, PStdCst, PVOvhStdCst, 
QtyAlloc, QtyAvail, QtyCustOrd, QtyInTransit, QtyNotAvail, QtyOnBO, QtyOnDP, QtyOnHand, QtyOnKitAssyOrders, QtyOnPO, QtyOnTransferOrders, 
QtyShipNotInv, QtyWOFirmDemand, QtyWOFirmSupply, QtyWORlsedDemand, QtyWORlsedSupply, ReordInterval, ReordPt, ReordPtCalc, ReordQty, 
ReordQtyCalc, ReplMthd, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, 
S4Future10, S4Future11, S4Future12, SafetyStk, SafetyStkCalc, SalesAcct, SalesSub, SecondVendID, Selected, ShipNotInvAcct, ShipNotInvSub, 
SiteID, StdCost, StdCostDate, StkItem, TotCost, Turns, UsageRate, User1, User2, User3, User4, User5, User6, User7, User8, VOvhStdCst, YTDUsage)
SELECT 
ABCCode, AllocQty, AvgCost, BMIAvgCost, BMIDirStdCst, BMIFOvhStdCst, BMILastCost, BMIPDirStdCst, BMIPFOvhStdCst, BMIPStdCst, 
BMIPVOvhStdCst, BMIStdCost, BMITotCost, BMIVOvhStdCst, Buyer, COGSAcct, COGSSub, CountStatus, CpnyID, Crtd_DateTime, Crtd_Prog, 
Crtd_User, CycleID, DfltPOUnit, DfltSOUnit, DirStdCst, EOQ, FOvhStdCst, InvtAcct, InvtID, InvtSub, LastBookQty, LastCost, LastCountDate, 
LastPurchaseDate, LastPurchasePrice, LastStdCost, LastVarAmt, LastVarPct, LastVarQty, LastVendor, LeadTime, LUpd_DateTime, LUpd_Prog, 
LUpd_User, MaxOnHand, MfgLeadTime, MoveClass, NoteID, PDirStdCst, PFOvhStdCst, PrimVendID, ProdMgrID, PStdCostDate, PStdCst, PVOvhStdCst, 
QtyAlloc, 1500, QtyCustOrd, 0, QtyNotAvail, QtyOnBO, QtyOnDP, 1000, QtyOnKitAssyOrders, QtyOnPO, QtyOnTransferOrders, 
QtyShipNotInv, QtyWOFirmDemand, QtyWOFirmSupply, QtyWORlsedDemand, QtyWORlsedSupply, ReordInterval, ReordPt, ReordPtCalc, ReordQty, 
ReordQtyCalc, ReplMthd, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, 
S4Future10, S4Future11, S4Future12, SafetyStk, SafetyStkCalc, SalesAcct, SalesSub, SecondVendID, Selected, ShipNotInvAcct, ShipNotInvSub, 
'CFCENTRAL', StdCost, StdCostDate, StkItem, 1500*LastCost, Turns, UsageRate, User1, User2, User3, User4, User5, User6, User7, User8, VOvhStdCst, YTDUsage 
FROM ItemSite WHERE SiteID = 'CFCUSCO2' AND InvtID = 'I250034'


--SELECT * FROM xamitemsite WHERE SiteID = 'CFCUSCO2' AND InvtID = 'I250111'

INSERT INTO xamitemsite (SiteId, InvtID, Stock, Costo, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)
SELECT 'CFCENTRAL', InvtID, 1500, 1500*0.2502, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10 FROM xamitemsite WHERE SiteID = 'CFCUSCO2' AND InvtID = 'I250034'




