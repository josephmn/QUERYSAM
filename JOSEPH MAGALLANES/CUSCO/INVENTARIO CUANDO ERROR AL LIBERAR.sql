
-- exec recargar_kardex

--I250051		4.050000
--I250067		0.371596
--I250169		0.017700
--I250108		3.969127
--I250284		10.625834
--I291902		12.213650
--I261901		40.632400
--I300001		0.027100
--I300002		0.038777979
--I219111		0.022163265


--I250103
--I250171
--I250181
--SELECT UnitPrice, * FROM INTran WHERE InvtID = 'I212288' AND TranType = 'AJ' AND SiteID = 'CFCUSCO1'
--I300001
--I300006



--I250504


declare @ALMACEN char(10), @COD_PROD char(10),  @qtyonhand FLOAT, @totcost FLOAT

set @ALMACEN = 'CIXINSUMOS' set @COD_PROD =  '25425' 

SET @qtyonhand = 10000 SET   @totcost = 0.007

select siteid, INVTID, qtyonhand, totcost, AllocQty, QtyAvail, QtyCustOrd, round(qtyonhand,2),LastCost, * 
from itemsite
where siteid=@ALMACEN and  invtid  in (  @COD_PROD)

select siteid, INVTID, qtyonhand,WhseLoc,* 
from location
where siteid=@ALMACEN and  invtid  in ( @COD_PROD) and whseloc='BUENESTADO'

select STOCK,*from xamitemsite where  siteid=@ALMACEN and  invtid  in (  @COD_PROD)


--select * from xamitemsite where InvtID = 'I250327'

--INSERT INTO xamitemsite (SiteId, InvtID, Stock, Costo, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)
--select SiteId, 'I250327', Stock, Costo, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10 from xamitemsite where InvtID = 'I210158' and SiteId = 'CFCUSCO1'

update ItemSite set LastCost = @totcost where siteid=@ALMACEN and  invtid   in ( @COD_PROD)

update itemsite set  qtyonhand = @qtyonhand ,QtyAvail =  @qtyonhand,totcost =@totcost * @qtyonhand  , AvgCost= @totcost
where siteid=@ALMACEN and  invtid   in ( @COD_PROD)

update location set qtyonhand = @qtyonhand --qtyonhand = qtyonhand+ @qtyonhand
where siteid=@ALMACEN and  invtid   in (  @COD_PROD)
and whseloc='BUENESTADO'

update xamitemsite SET stock =@qtyonhand , 
Costo = @qtyonhand * @totcost 
from xamitemsite where  siteid=@ALMACEN and  invtid  in (  @COD_PROD)

--SELECT InvtID, SiteID, * FROM ItemSite WHERE SiteID = 'CFCUSCO2'
--SELECT InvtID, SiteID, * FROM ItemSite WHERE SiteID = 'CFCUSCO3'


--INSERT INTO xamitemsite (SiteId, InvtID, Stock, Costo, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)

--SELECT SiteId, InvtID, Stock, Costo, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10 
--FROM [ALTOMAYO-TEMP].[AMCAF2018APP].DBO.xAMItemSite WHERE SiteId = 'CFCUSCO3' AND InvtID = 'I250093'




--CFCENTRAL

/*

insert into itemsite 
(ABCCode, AllocQty, AvgCost, BMIAvgCost, BMIDirStdCst, BMIFOvhStdCst, BMILastCost, BMIPDirStdCst, BMIPFOvhStdCst, BMIPStdCst, BMIPVOvhStdCst, BMIStdCost, 
BMITotCost, BMIVOvhStdCst, Buyer, COGSAcct, COGSSub, CountStatus, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CycleID, DfltPOUnit, DfltSOUnit, DirStdCst, 
EOQ, FOvhStdCst, InvtAcct, InvtID, InvtSub, LastBookQty, LastCost, LastCountDate, LastPurchaseDate, LastPurchasePrice, LastStdCost, LastVarAmt, LastVarPct, 
LastVarQty, LastVendor, LeadTime, LUpd_DateTime, LUpd_Prog, LUpd_User, MaxOnHand, MfgLeadTime, MoveClass, NoteID, PDirStdCst, PFOvhStdCst, PrimVendID, ProdMgrID, 
PStdCostDate, PStdCst, PVOvhStdCst, QtyAlloc, QtyAvail, QtyCustOrd, QtyInTransit, QtyNotAvail, QtyOnBO, QtyOnDP, QtyOnHand, QtyOnKitAssyOrders, QtyOnPO, 
QtyOnTransferOrders, QtyShipNotInv, QtyWOFirmDemand, QtyWOFirmSupply, QtyWORlsedDemand, QtyWORlsedSupply, ReordInterval, ReordPt, ReordPtCalc, ReordQty, 
ReordQtyCalc, ReplMthd, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, 
S4Future12, SafetyStk, SafetyStkCalc, SalesAcct, SalesSub, SecondVendID, Selected, ShipNotInvAcct, ShipNotInvSub, SiteID, StdCost, StdCostDate, StkItem, TotCost, 
Turns, UsageRate, User1, User2, User3, User4, User5, User6, User7, User8, VOvhStdCst, YTDUsage)

select ABCCode, AllocQty, 0, BMIAvgCost, BMIDirStdCst, BMIFOvhStdCst, BMILastCost, BMIPDirStdCst, BMIPFOvhStdCst, BMIPStdCst, BMIPVOvhStdCst, BMIStdCost, 
BMITotCost, BMIVOvhStdCst, Buyer, COGSAcct, COGSSub, CountStatus, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CycleID, DfltPOUnit, DfltSOUnit, DirStdCst, 
EOQ, FOvhStdCst, InvtAcct, 'I212231', InvtSub, LastBookQty, 0, LastCountDate, LastPurchaseDate, LastPurchasePrice, LastStdCost, LastVarAmt, LastVarPct, 
LastVarQty, LastVendor, LeadTime, LUpd_DateTime, LUpd_Prog, LUpd_User, MaxOnHand, MfgLeadTime, MoveClass, NoteID, PDirStdCst, PFOvhStdCst, PrimVendID, ProdMgrID, 
PStdCostDate, PStdCst, PVOvhStdCst, QtyAlloc, 0, QtyCustOrd, QtyInTransit, QtyNotAvail, QtyOnBO, QtyOnDP, 0, QtyOnKitAssyOrders, QtyOnPO, 
QtyOnTransferOrders, QtyShipNotInv, QtyWOFirmDemand, QtyWOFirmSupply, QtyWORlsedDemand, QtyWORlsedSupply, ReordInterval, ReordPt, ReordPtCalc, ReordQty, 
ReordQtyCalc, ReplMthd, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, 
S4Future12, SafetyStk, SafetyStkCalc, SalesAcct, SalesSub, SecondVendID, Selected, ShipNotInvAcct, ShipNotInvSub, 'CFCENTRAL', StdCost, StdCostDate, StkItem, round((0*250),2),
Turns, UsageRate, User1, User2, User3, User4, User5, User6, User7, User8, VOvhStdCst, YTDUsage from itemsite where siteid = 'CFCUSCO2' and invtid = 'I212247'


SELECT * FROM AMCAF2019APP..itemsite WHERE InvtID = 'I900511'


INSERT INTO Location 
([CountStatus], [Crtd_DateTime], [Crtd_Prog], [Crtd_User], [InvtID], [LUpd_DateTime], [LUpd_Prog], [LUpd_User], [NoteID], [QtyAlloc], [QtyOnHand], [QtyShipNotInv], 
[QtyWORlsedDemand], [S4Future01], [S4Future02], [S4Future03], [S4Future04], [S4Future05], [S4Future06], [S4Future07], [S4Future08], [S4Future09], [S4Future10], 
[S4Future11], [S4Future12], [Selected], [SiteID], [User1], [User2], [User3], [User4], [User5], [User6], [User7], [User8], [WhseLoc])

SELECT [CountStatus], [Crtd_DateTime], [Crtd_Prog], [Crtd_User], 'I250043', [LUpd_DateTime], [LUpd_Prog], [LUpd_User], [NoteID], [QtyAlloc], 0 [QtyOnHand], [QtyShipNotInv], 
[QtyWORlsedDemand], [S4Future01], [S4Future02], [S4Future03], [S4Future04], [S4Future05], [S4Future06], [S4Future07], [S4Future08], [S4Future09], [S4Future10], 
[S4Future11], [S4Future12], [Selected], 'CFCUSCO3', [User1], [User2], [User3], [User4], [User5], [User6], [User7], [User8], [WhseLoc] 
FROM Location WHERE SiteID = 'CFCUSCO2' AND InvtID = 'I250043'


insert into xamitemsite (SiteId, InvtID, Stock, Costo, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)

SELECT 'CFCUSCO2', 'I250209', '0', '0', user01, user02, user03, user04, user05, user06, user07, user08, user09, user10 FROM xamitemsite WHERE InvtID = 'I250209' AND SITEID = 'CFCUSCO2'





SELECT * FROM Batch WHERE BatNbr = '027801'

SELECT InvtID, Qty, * FROM INTran WHERE BatNbr = '027801' AND InvtID IN (
'I250227',
'I250115',
'I250111',
'I250047',
'I250013',
'I250007',
'I250001',
'I212288'
)


SELECT SiteID, InvtID, QtyOnHand, * FROM ItemSite WHERE SiteID = 'CFCENTRAL' AND InvtID IN (
'I250227',
'I250115',
'I250111',
'I250047',
'I250013',
'I250007',
'I250001',
'I212288'
)

--SELECT * FROM ItemSite WHERE SiteID = 'CFCENTRAL'
SELECT * FROM Location WHERE SiteID = 'CFCENTRAL' AND InvtID = 'I250209'
SELECT * FROM Location WHERE SiteID = 'CFCENTRAL' AND InvtID = 'I250115'

SELECT SiteID, InvtID, QtyOnHand, * FROM ItemSite WHERE SiteID = 'CFCENTRAL'


SELECT * FROM POTran WHERE InvtId  ='I250111'  AND SiteId  ='cfcentral'

select * from  PurchOrd 
select * from  PurOrdDet where SiteId  ='CFCENTRAL' AND InvtID   ='I250111' 










--SELECT * FROM Inventory WHERE INVTID IN (
--'I250115',
--'I250111'
--)

SELECT SiteID, InvtID, QtyOnHand, * 
-- UPDATE T SET LUpd_Prog = '10400SQL'
FROM Location T WHERE SiteID = 'CFCENTRAL' AND InvtID IN (
'I250227',
'I250115',
'I250111',
'I250047',
'I250013',
'I250007',
'I250001',
'I212288'
) --AND LUpd_Prog = '10990'


SELECT SiteID, InvtID, Stock, * FROM xamitemsite WHERE SiteID = 'CFCENTRAL' AND InvtID IN (
'I250227',
'I250115',
'I250111',
'I250047',
'I250013',
'I250007',
'I250001',
'I212288'
)



Procesando: Batch: 027801
Cantidad existencia de artículo 'I250115' almacén 'CFCENTRAL' localiz almac 'BUENESTADO' será negativa.  Lote no será liberado.

Procesando: Batch: 027801
Cantidad existencia o costo total de artículo 'I250111' en almacén 'CFCENTRAL' se hará negativo.  Lote no será liberado.

'I250227',
'I250115',
'I250111',
'I250047',
'I250013',
'I250007',
'I250001',
'I212288'

*/




--select perpost, Status,*  from batch where batnbr ='012478' and module  ='po'
--select *  from poreceipt where batnbr ='012478'
--select perpost,*  FROM POTRAN where batnbr ='012478'
--select * from INTran where RcptNbr in (select rcptnbr from poreceipt where batnbr ='012478') AND TranType = 'RC'
--select *  FROM gltran  where refnbr in (select rcptnbr from poreceipt where batnbr ='012478')  and module ='PO'



--select perpost, Status,*  from batch where batnbr ='012584' and module  ='po'
--select *  from poreceipt where batnbr ='012584'
--select perpost,*  FROM POTRAN where batnbr ='012584'
--select * from INTran where RcptNbr in (select rcptnbr from poreceipt where batnbr ='012584') AND TranType = 'RC'
--select *  
---- update gltran set acct = '261101'
--FROM gltran  where refnbr in (select rcptnbr from poreceipt where batnbr ='012584')  and module ='PO' --and Acct = '914103'


/*
insert into INTran 
(Acct, AcctDist, ARLineID, ARLineRef, BatNbr, BMICuryID, BMIEffDate, BMIExtCost, BMIMultDiv, BMIRate, BMIRtTp, BMITranAmt, BMIUnitPrice, 
CmmnPct, CnvFact, COGSAcct, COGSSub, CostType, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, DrCr, Excpt, ExtCost, ExtRefNbr, FiscYr, ID, 
InsuffQty, InvtAcct, InvtID, InvtMult, InvtSub, JrnlType, KitID, LineID, LineNbr, LineRef, LotSerCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, 
NoteID, OvrhdAmt, OvrhdFlag, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, ProjectID, Qty, QtyUnCosted, RcptDate, RcptNbr, ReasonCd, 
RefNbr, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, 
S4Future11, S4Future12, ShortQty, SiteID, SlsperID, SpecificCostID, Sub, TaskID, ToSiteID, ToWhseLoc, TranAmt, TranDate, TranDesc, TranType, 
UnitDesc, UnitMultDiv, UnitPrice, User1, User2, User3, User4, User5, User6, User7, User8, WhseLoc)

select 
gl.Acct, 0, 0, '',(select BatNbr from POTRAN where RcptNbr = RefNbr), '', '1900-01-01', 0, 'M', '1','',0,0,0,1,'','','', gl.CpnyID, AppliedDate,
gl.Crtd_Prog, gl.Crtd_User, 'D', 0, (CASE CrAmt when 0 then CuryDrAmt else CuryCrAmt end), '',FiscYr,'',0, gl.Acct, gl.TranDesc, 1,'000000000000',
'PO','',1,0,'00001',0, gl.LUpd_DateTime, gl.LUpd_Prog, gl.LUpd_User, 0,0,0,'','','',gl.PerEnt, gl.PerPost, '', po.RcptQty, 0, RcptDate, RefNbr,'', RefNbr,1,'','',0,0,0,0,
'1900-01-01','1900-01-01',0,1,'','',0, SiteId, '','','000000000000','','','',(CASE CrAmt when 0 then CuryDrAmt else CuryCrAmt end), gl.TranDate,
(select CAST (Descr AS char(30)) from Inventory where invtid = ltrim(rtrim(gl.trandesc))), 'RC',po.UnitDescr, 'M', po.UnitCost, '', '', po.RcptQty, 0,'','','1900-01-01','1900-01-01',
'BUENESTADO'
from gltran gl 
left join POTRAN po on gl.RefNbr = po.RcptNbr 
where refnbr in (select rcptnbr from poreceipt where batnbr ='012584')  and module ='PO' and GL.Acct = '261101'



--select * from GLTran where BatNbr = '012584'
--select * from POTRAN where BatNbr = '012584'



SELECT * FROM Location WHERE SiteID = 'CIXSUMIN'

SELECT * 
-- DELETE 
FROM ItemSite WHERE SiteID = 'CIXSUMIN'

INSERT INTO ItemSite ([ABCCode],[AllocQty],[AvgCost],[BMIAvgCost],[BMIDirStdCst],[BMIFOvhStdCst],[BMILastCost],[BMIPDirStdCst],[BMIPFOvhStdCst],[BMIPStdCst],
[BMIPVOvhStdCst],[BMIStdCost],[BMITotCost],[BMIVOvhStdCst],[Buyer],[COGSAcct],[COGSSub],[CountStatus],[CpnyID],[Crtd_DateTime],[Crtd_Prog],[Crtd_User],[CycleID],
[DfltPOUnit],[DfltSOUnit],[DirStdCst],[EOQ],[FOvhStdCst],[InvtAcct],[InvtID],[InvtSub],[LastBookQty],[LastCost],[LastCountDate],[LastPurchaseDate],[LastPurchasePrice],
[LastStdCost],[LastVarAmt],[LastVarPct],[LastVarQty],[LastVendor],[LeadTime],[LUpd_DateTime],[LUpd_Prog],[LUpd_User],[MaxOnHand],[MfgLeadTime],[MoveClass],[NoteID],
[PDirStdCst],[PFOvhStdCst],[PrimVendID],[ProdMgrID],[PStdCostDate],[PStdCst],[PVOvhStdCst],[QtyAlloc],[QtyAvail],[QtyCustOrd],[QtyInTransit],[QtyNotAvail],[QtyOnBO],
[QtyOnDP],[QtyOnHand],[QtyOnKitAssyOrders],[QtyOnPO],[QtyOnTransferOrders],[QtyShipNotInv],[QtyWOFirmDemand],[QtyWOFirmSupply],[QtyWORlsedDemand],[QtyWORlsedSupply],
[ReordInterval],[ReordPt],[ReordPtCalc],[ReordQty],[ReordQtyCalc],[ReplMthd],[S4Future01],[S4Future02],[S4Future03],[S4Future04],[S4Future05],[S4Future06],
[S4Future07],[S4Future08],[S4Future09],[S4Future10],[S4Future11],[S4Future12],[SafetyStk],[SafetyStkCalc],[SalesAcct],[SalesSub],[SecondVendID],[Selected],
[ShipNotInvAcct],[ShipNotInvSub],[SiteID],[StdCost],[StdCostDate],[StkItem],[TotCost],[Turns],[UsageRate],[User1],[User2],[User3],[User4],[User5],[User6],
[User7],[User8],[VOvhStdCst],[YTDUsage])
select  
ABCCode,0,0,0,0,0,0,0,0,0,0,0,0,0,Buyer,COGSAcct,COGSSub,CountStatus,'ALTOMAYO','2018-10-19 00:00:00',Crtd_Prog,Crtd_User,CycleID,DfltPOUnit,DfltSOUnit,
0,0,0,InvtAcct, InvtID, InvtSub, 0, 0, '1900-01-01', '2018-10-19', 0,0,0,0,0,'','999','1900-01-01', '04250', 'SYSADMIN', 0,0,'',0,0,0,'','','1900-01-01',
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','',0,0,0,0,'1900-01-01','1900-01-01',0,0,'','',0,0,DfltSalesAcct,DfltSalesSub, '',0,'','','CIXSUMIN',
0,'1900-01-01',1,0,0,0,'','',0,0,'','','1900-01-01','1900-01-01',0,0
from Inventory where InvtID like 'M%' AND InvtID not in (SELECT InvtID FROM ItemSite where SiteID = 'CIXSUMIN')



INSERT INTO xamitemsite (SiteId, InvtID, Stock, Costo, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)

select 'CIXSUMIN', InvtID, 0, 0,'','',0,0,'','',0,0,'1900-01-01','1900-01-01' from Inventory where InvtID like 'M%' 
and InvtID not in (select InvtID from xamitemsite where SiteId = 'CIXSUMIN')


--select * from xAMItemSite where SiteId = 'CIXSUMIN'



--exec sp_generar_inserts 'ardoc' ,@From = 'from ardoc' --, @top = '10'

*/