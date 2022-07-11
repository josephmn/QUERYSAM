
INSERT INTO Site 
(Addr1, Addr2, Attn, City, COGSAcct, COGSSub, Country, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, DfltInvtAcct, DfltInvtSub, DicsAcct, DiscSub, Fax, FrtAcct, 
FrtSub, GeoCode, LUpd_DateTime, LUpd_Prog, LUpd_User, Name, NoteID, Phone, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, 
S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Salut, SiteId, SlsAcct, SlsSub, State, User1, User2, User3, User4, User5, User6, User7, User8, VisibleForWC, Zip)

SELECT
Addr1, Addr2, Attn, City, COGSAcct, COGSSub, Country, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, DfltInvtAcct, DfltInvtSub, DicsAcct, DiscSub, Fax, FrtAcct, 
FrtSub, GeoCode, LUpd_DateTime, LUpd_Prog, LUpd_User, 'CIX OBSERVADOS', NoteID, Phone, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, 
S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Salut, 'CIXOBS', SlsAcct, SlsSub, State, User1, User2, User3, User4, User5, User6, User7, User8, VisibleForWC, Zip
-- DELETE
FROM Site where SiteId = 'CIXPT'


INSERT INTO LocTable 
(ABCCode, AssemblyValid, BinType, CountStatus, Crtd_DateTime, Crtd_Prog, Crtd_User, CycleID, Descr, InclQtyAvail, InvtID, InvtIDValid, LastBookQty, LastCountDate, 
LastVarAmt, LastVarPct, LastVarQty, LUpd_DateTime, LUpd_Prog, LUpd_User, MoveClass, NoteID, PickPriority, PutAwayPriority, ReceiptsValid, S4Future01, S4Future02, 
S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, SalesValid, Selected, SiteID, User1, User2, 
User3, User4, User5, User6, User7, User8, WhseLoc)

SELECT ABCCode, AssemblyValid, BinType, CountStatus, Crtd_DateTime, Crtd_Prog, Crtd_User, CycleID, Descr, InclQtyAvail, InvtID, InvtIDValid, LastBookQty, LastCountDate, 
LastVarAmt, LastVarPct, LastVarQty, LUpd_DateTime, LUpd_Prog, LUpd_User, MoveClass, NoteID, PickPriority, PutAwayPriority, ReceiptsValid, S4Future01, S4Future02, 
S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, SalesValid, Selected, 'LIMEXP', User1, User2, 
User3, User4, User5, User6, User7, User8, WhseLoc 
-- DELETE
FROM LocTable where SiteID = 'LIMCEN'


INSERT ItemSite 
(ABCCode, AllocQty, AvgCost, BMIAvgCost, BMIDirStdCst, BMIFOvhStdCst, BMILastCost, BMIPDirStdCst, BMIPFOvhStdCst, BMIPStdCst, BMIPVOvhStdCst, BMIStdCost, BMITotCost, 
BMIVOvhStdCst, Buyer, COGSAcct, COGSSub, CountStatus, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CycleID, DfltPOUnit, DfltSOUnit, DirStdCst, EOQ, FOvhStdCst, InvtAcct, 
InvtID, InvtSub, LastBookQty, LastCost, LastCountDate, LastPurchaseDate, LastPurchasePrice, LastStdCost, LastVarAmt, LastVarPct, LastVarQty, LastVendor, LeadTime, 
LUpd_DateTime, LUpd_Prog, LUpd_User, MaxOnHand, MfgLeadTime, MoveClass, NoteID, PDirStdCst, PFOvhStdCst, PrimVendID, ProdMgrID, PStdCostDate, PStdCst, PVOvhStdCst, 
QtyAlloc, QtyAvail, QtyCustOrd, QtyInTransit, QtyNotAvail, QtyOnBO, QtyOnDP, QtyOnHand, QtyOnKitAssyOrders, QtyOnPO, QtyOnTransferOrders, QtyShipNotInv, QtyWOFirmDemand, 
QtyWOFirmSupply, QtyWORlsedDemand, QtyWORlsedSupply, ReordInterval, ReordPt, ReordPtCalc, ReordQty, ReordQtyCalc, ReplMthd, S4Future01, S4Future02, S4Future03, S4Future04, 
S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, SafetyStk, SafetyStkCalc, SalesAcct, SalesSub, SecondVendID, Selected, 
ShipNotInvAcct, ShipNotInvSub, SiteID, StdCost, StdCostDate, StkItem, TotCost, Turns, UsageRate, User1, User2, User3, User4, User5, User6, User7, User8, VOvhStdCst, YTDUsage)

select ABCCode, AllocQty, 0, BMIAvgCost, BMIDirStdCst, BMIFOvhStdCst, BMILastCost, BMIPDirStdCst, BMIPFOvhStdCst, BMIPStdCst, BMIPVOvhStdCst, BMIStdCost, BMITotCost, 
BMIVOvhStdCst, Buyer, COGSAcct, COGSSub, CountStatus, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CycleID, DfltPOUnit, DfltSOUnit, DirStdCst, EOQ, FOvhStdCst, InvtAcct, 
InvtID, InvtSub, LastBookQty, 0, LastCountDate, LastPurchaseDate, LastPurchasePrice, LastStdCost, LastVarAmt, LastVarPct, LastVarQty, LastVendor, LeadTime, 
LUpd_DateTime, LUpd_Prog, LUpd_User, MaxOnHand, MfgLeadTime, MoveClass, NoteID, PDirStdCst, PFOvhStdCst, PrimVendID, ProdMgrID, PStdCostDate, PStdCst, PVOvhStdCst, 
QtyAlloc, 0, 0, 0, 0, 0, 0, 0, QtyOnKitAssyOrders, QtyOnPO, QtyOnTransferOrders, QtyShipNotInv, QtyWOFirmDemand, 
QtyWOFirmSupply, QtyWORlsedDemand, QtyWORlsedSupply, ReordInterval, ReordPt, ReordPtCalc, ReordQty, ReordQtyCalc, ReplMthd, S4Future01, S4Future02, S4Future03, S4Future04, 
S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, SafetyStk, SafetyStkCalc, SalesAcct, SalesSub, SecondVendID, Selected, 
ShipNotInvAcct, ShipNotInvSub, 'LIMEXP', StdCost, StdCostDate, StkItem, 0, Turns, UsageRate, User1, User2, User3, User4, User5, User6, User7, User8, VOvhStdCst, YTDUsage 
from ItemSite where SiteID = 'LIMCEN' --AND InvtID NOT IN (SELECT InvtID FROM ItemSite WHERE SiteID <> 'MARKETING')


--SELECT * FROM ItemSite WHERE SiteID = 'LIMEXP'


insert into xAMNewItemSite 
(SiteID_Sol, SiteID_Nex, InvtID_Sol, InvtID_Nex, QtyOnHand, QtyPorDesp, QtyEnDesp, QtyInPorLib, QtyInTransit, QtyAvail, QtyEnNex, QtyNewDisp)

SELECT 'CIXOBS', SiteID_Nex, InvtID_Sol, InvtID_Nex, 0, 0, 0, 0, 0, 0, QtyEnNex, QtyNewDisp 
FROM xAMNewItemSite WHERE SiteID_Sol = 'CIXPT' AND InvtID_Sol NOT LIKE 'G%'


INSERT INTO Location 
(CountStatus, Crtd_DateTime, Crtd_Prog, Crtd_User, InvtID, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, QtyAlloc, QtyOnHand, QtyShipNotInv, 
QtyWORlsedDemand, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, 
S4Future11, S4Future12, Selected, SiteID, User1, User2, User3, User4, User5, User6, User7, User8, WhseLoc)

SELECT CountStatus, Crtd_DateTime, Crtd_Prog, 'SYSADMIN', InvtID, LUpd_DateTime, LUpd_Prog, 'SYSADMIN', 0, 0, 0, 0, 
0, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, 
S4Future11, S4Future12, Selected, 'LIMEXP', User1, User2, User3, User4, User5, User6, User7, User8, WhseLoc FROM Location WHERE SiteID = 'LIMCEN'



insert into xamitemsite 
(SiteId, InvtID, Stock, Costo, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)
select 'CIXOBS', InvtID, 0, 0, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10 
from xamitemsite where SiteId = 'CIXPT'
AND InvtID NOT IN (SELECT InvtID FROM xamitemsite WHERE SiteId = 'CUSCO')

--SELECT InvtID, COUNT(*) CONTEO FROM xamitemsite WHERE SiteId = 'CUSCO' GROUP BY InvtID HAVING COUNT(*) > 1


SELECT InvtID, SiteID, QtyOnHand, LUpd_Prog, Crtd_Prog FROM Location --WHERE SiteID = 'CIXPT' --AND InvtID LIKE '21785%'

--SELECT InvtID, Descr, LUpd_Prog, Crtd_Prog FROM Inventory WHERE INVTID LIKE '21%'

--10400SQL	10250   

---INSERTAR CODIGO DE PRODUCTOS RECIEN CREADOS

INSERT INTO Location 
(CountStatus, Crtd_DateTime, Crtd_Prog, Crtd_User, InvtID, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, QtyAlloc, QtyOnHand, QtyShipNotInv, 
QtyWORlsedDemand, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, 
S4Future11, S4Future12, Selected, SiteID, User1, User2, User3, User4, User5, User6, User7, User8, WhseLoc)

SELECT 'A', '2018-10-19', '10400SQL', 'SYSADMIN', InvtID, '2018-10-19', '10250', 'SYSADMIN', 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '1900-01-01', '1900-01-01', 0, 0, '', '', 0,
'CIXSUMIN', '', '', 0, 0, '', '', '1900-01-01', '1900-01-01', 'BUENESTADO'
FROM Inventory WHERE INVTID LIKE 'M%'



insert into xAMNewItemSite 
(SiteID_Sol, SiteID_Nex, InvtID_Sol, InvtID_Nex, QtyOnHand, QtyPorDesp, QtyEnDesp, QtyInPorLib, QtyInTransit, QtyAvail, QtyEnNex, QtyNewDisp)

SELECT 'CIXSUMIN', '02', InvtID, '000'+InvtID, 0, 0, 0, 0, 0, 0, 0, 0
FROM Inventory WHERE INVTID LIKE 'M%'

INSERT INTO xamitemsite ()


SELECT * FROM Location WHERE InvtID = 'M261001'

SELECT * 
-- DELETE 
FROM xAMNewItemSite WHERE InvtID_Sol = 'M261001' AND SiteID_Nex = ''


