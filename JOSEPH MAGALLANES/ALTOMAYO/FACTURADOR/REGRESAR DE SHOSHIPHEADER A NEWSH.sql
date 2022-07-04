
SELECT * FROM GLTRAN WHERE REFNBR = 'F010006042' AND MODULE = 'AR'

SELECT ShipperID, InvcNbr, SOS.CustID, * 
 

FROM SOShipHeader SOS
INNER JOIN ARDOC DOC ON DOC.RefNbr = SOS.InvcNbr

WHERE SOS.ShipperID  IN ('FLI0001640','FLI0001641','FLI0001643')


SELECT CustId, * 
--UPDATE T SET CustId = '20524310857'
FROM ARDOC T WHERE T.RefNbr = 'F010006043'

SELECT CustId, * FROM ARDOC WHERE RefNbr = 'F010006041'


SELECT CustId, * FROM ARDOC WHERE RefNbr = 'F010006043'


SELECT USER6, * FROM ARDOC WHERE RefNbr IN
(
'F010006040',     
'F010006041',     
'F010006043'
)



select  user1,User2,User3, InvcNbr ,User1,* from SOShipHeader where ShipperID  ='FLI0001640'
select  user1,User2,User3, InvcNbr ,User1,* from SOShipHeader where ShipperID  ='FLI0001641'

select  user1,User2,User3, InvcNbr ,User1,* from SOShipHeader where ShipperID  ='FLI0001642'

select  user1,User2,User3, InvcNbr ,User1,* from SOShipHeader where ShipperID  ='FLI0001643'

-- corroboramos que no estea en la tabla temporal
-- paso 1
select  user1,User2,User3, InvcNbr ,User1,* from newSH where ShipperID  ='FLI0001640'
select  user1,User2,User3, InvcNbr ,User1,* from newSH where ShipperID  ='FLI0001641'
select  user1,User2,User3, InvcNbr ,User1,* from newSH where ShipperID  ='FLI0001643'


select  user1,User2,User1,* from newSL where ShipperID  ='FLI0001640'

-- verificamos que ya estea en tabla historica
-- paso 2
select  user1,User2,InvcNbr ,User1,User3, * from SOShipHeader where ShipperID  ='FLI0001642'
select InvtID, QtyShip, ShipperID, * from SOShipLine where ShipperID = 'FLI0001640'


-- verificamos tablas 
select * from PHeDespacho1 where nrodespacho ='S000008356'
select * from PHeDespacho where nrodespacho ='S000008356'

---------------------------------------------------------------------------
------------- INSERT PARA REPROCESAR --------------------------------------
---------------------------------------------------------------------------

-- insertamos de la tabla PHeDespacho a PHeDespacho1 con R para reprocesar.
--
select * from PHeDespacho1 where nrodespacho ='S000008356'
insert into PHeDespacho1 (nrodespacho, tipo, nroguia, almacen, user1, user2, user3, user4, user5, user6, user7, user8, user9, user10, user11, user12, user13, user14, user15, user16)

select nrodespacho, tipo, nroguia, almacen, user1, user2, user3, user4, user5, user6, user7, user8, user9, user10, 'R', user12, user13, user14, user15, user16
from PHeDespacho where nrodespacho ='S000008356'

delete PHeDespacho where nrodespacho ='S000008356'

-- cambiamos el estado (D) para poder ver el despacho y volver a procesar.
select *
-- UPDATE PHeDespacho1 SET user11 = 'D'
from PHeDespacho1 where nrodespacho ='S000008356'

--select distinct NextFunctionClass,NextFunctionID   from newsh




select * from  xDespachoShippers1 where nrodespacho  ='S000008356'

INSERT INTO xDespachoShippers1 (Shipperid, CostoMinimo, Custid, NroDespacho, Tipomov, Transportista, PlacaCamion, MarcaCamion, LicenciaChofer, NoConstInscp, MotivoTraslado, DescrTraslado, NombreChofer, FechaDespacho, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)
select * from  xDespachoShippers where nrodespacho  ='S000008356'



select * from xAMDespEmbD where NroDespachoD  ='S000008351'


update PHeDespacho1 set user11  ='R' where nrodespacho  ='S000002317'
update xAMDespEmbD set NroDespachoD  ='S000107945' where NroDespachoD  ='S000007945' and InvcNbr  ='F010005313'

--select * from xAMDespEmbD where NroDespachoD  ='S000007945' and InvcNbr  ='F010005313'

update PHeDespacho set user11 ='L' where  nrodespacho ='S000007945'

select * from xDespachoShippers_all

---REPROCESO
--PASO 1 DE SOSHIP A NEWSH
insert into newSH (AdminHold, ARAcct, ARBatNbr, ARSub, AuthNbr, BalDue, BillAddr1, BillAddr2, BillAddrSpecial, BillAttn, BillCity, BillCountry, BillName, BillPhone, BillState, BillZip, BlktOrdNbr, BMICost, BMICuryID, BMIEffDate, BMIMultDiv, BMIRate, BMIRtTp, BookCntr, BoxCntr, BuildActQty, BuildCmpltDate, BuildInvtID, BuildLotSerCntr, BuildQty, BuildTotalCost, BuyerID, BuyerName, CancelBO, Cancelled, CancelOrder, CertID, CertNoteID, CmmnPct, ContractNbr, CpnyID, CreditApprDays, CreditApprLimit, CreditChk, CreditHold, CreditHoldDate, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryBalDue, CuryBuildTotCost, CuryEffDate, CuryID, CuryMultDiv, CuryPremFrtAmt, CuryRate, CuryRateType, CuryTotFrtCost, CuryTotFrtInvc, CuryTotInvc, CuryTotLineDisc, CuryTotMerch, CuryTotMisc, CuryTotPmt, CuryTotTax, CuryTotTxbl, CuryWholeOrdDisc, CustGLClassID, CustID, CustOrdNbr, DateCancelled, Dept, DiscAcct, DiscPct, DiscSub, Div, DropShip, EDI810, EDI856, EDIASNProcNbr, EDIInvcProcNbr, ETADate, FOBID, FrtAcct, FrtCollect, FrtSub, FrtTermsID, GeoCode, INBatNbr, InvcDate, InvcNbr, InvcPrint, LanguageID, LastAppendDate, LastAppendTime, LineCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, MarkFor, MiscChrgCntr, NextFunctionClass, NextFunctionID, NoteID, OKToAppend, OrdDate, OrdNbr, OverridePerPost, PackDate, PerClosed, PerPost, PickDate, PmtCntr, PremFrt, PremFrtAmt, Priority, ProjectID, RelDate, ReleaseValue, RequireStepAssy, RequireStepInsp, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, SellingSiteID, ShipAddr1, ShipAddr2, ShipAddrID, ShipAddrSpecial, ShipAttn, ShipCity, ShipCmplt, ShipCountry, ShipCustID, ShipDateAct, ShipDatePlan, ShipGeoCode, ShipName, ShipperID, ShipPhone, ShippingConfirmed, ShippingManifested, ShipRegisterID, ShipSiteID, ShipState, ShiptoID, ShiptoType, ShipVendID, ShipViaID, ShipZip, SiteID, SlsperID, SOTypeID, Status, TaxID00, TaxID01, TaxID02, TaxID03, TermsID, TotBoxes, TotCommCost, TotCost, TotFrtCost, TotFrtInvc, TotInvc, TotLineDisc, TotMerch, TotMisc, TotPallets, TotPmt, TotShipWght, TotTax, TotTxbl, TrackingNbr, TransitTime, User1, User10, User2, User3, User4, User5, User6, User7, User8, User9, WeekendDelivery, WholeOrdDisc, WorkflowID, WorkflowStatus, Zone)
select AdminHold, ARAcct, ARBatNbr, ARSub, AuthNbr, BalDue, BillAddr1, BillAddr2, BillAddrSpecial, BillAttn, BillCity, BillCountry, BillName, BillPhone, BillState, BillZip, BlktOrdNbr, BMICost, BMICuryID, BMIEffDate, BMIMultDiv, BMIRate, BMIRtTp, BookCntr, BoxCntr, BuildActQty, BuildCmpltDate, BuildInvtID, BuildLotSerCntr, BuildQty, BuildTotalCost, BuyerID, BuyerName, CancelBO, Cancelled, CancelOrder, CertID, CertNoteID, CmmnPct, ContractNbr, CpnyID, CreditApprDays, CreditApprLimit, CreditChk, CreditHold, CreditHoldDate, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryBalDue, CuryBuildTotCost, CuryEffDate, CuryID, CuryMultDiv, CuryPremFrtAmt, CuryRate, CuryRateType, CuryTotFrtCost, CuryTotFrtInvc, CuryTotInvc, CuryTotLineDisc, CuryTotMerch, CuryTotMisc, CuryTotPmt, CuryTotTax, CuryTotTxbl, CuryWholeOrdDisc, CustGLClassID, CustID, CustOrdNbr, DateCancelled, Dept, DiscAcct, DiscPct, DiscSub, Div, DropShip, EDI810, EDI856, EDIASNProcNbr, EDIInvcProcNbr, ETADate, FOBID, FrtAcct, FrtCollect, FrtSub, FrtTermsID, GeoCode, INBatNbr, InvcDate, InvcNbr, InvcPrint, LanguageID, LastAppendDate, LastAppendTime, LineCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, MarkFor, MiscChrgCntr, NextFunctionClass, NextFunctionID, NoteID, OKToAppend, OrdDate, OrdNbr, OverridePerPost, PackDate, PerClosed, PerPost, PickDate, PmtCntr, PremFrt, PremFrtAmt, Priority, ProjectID, RelDate, ReleaseValue, RequireStepAssy, RequireStepInsp, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, SellingSiteID, ShipAddr1, ShipAddr2, ShipAddrID, ShipAddrSpecial, ShipAttn, ShipCity, ShipCmplt, ShipCountry, ShipCustID, ShipDateAct, ShipDatePlan, ShipGeoCode, ShipName, ShipperID, ShipPhone, ShippingConfirmed, ShippingManifested, ShipRegisterID, ShipSiteID, ShipState, ShiptoID, ShiptoType, ShipVendID, ShipViaID, ShipZip, SiteID, SlsperID, SOTypeID, Status, TaxID00, TaxID01, TaxID02, TaxID03, TermsID, TotBoxes, TotCommCost, TotCost, TotFrtCost, TotFrtInvc, TotInvc, TotLineDisc, TotMerch, TotMisc, TotPallets, TotPmt, TotShipWght, TotTax, TotTxbl, TrackingNbr, TransitTime, User1, User10, User2, User3, User4, User5, User6, User7, User8, User9, WeekendDelivery, WholeOrdDisc, WorkflowID, WorkflowStatus, Zone
from SOShipHeader where ShipperID in ('FLI0001852') --,'FLI0003728') --,'FLI0001643')
--and InvcNbr in ('F010008029','F010008030')


insert into newsl(AlternateID, AltIDType, BMICost, BMICuryID, BMIEffDate, BMIExtPriceInvc, BMIMultDiv, BMIRate, BMIRtTp, BMISlsPrice, ChainDisc, CmmnPct, CnvFact, COGSAcct, COGSSub, CommCost, Cost, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCommCost, CuryCost, CuryListPrice, CurySlsPrice, CuryTaxAmt00, CuryTaxAmt01, CuryTaxAmt02, CuryTaxAmt03, CuryTotCommCost, CuryTotCost, CuryTotInvc, CuryTotMerch, CuryTxblAmt00, CuryTxblAmt01, CuryTxblAmt02, CuryTxblAmt03, Descr, DescrLang, DiscAcct, DiscPct, DiscSub, Disp, InspID, InspNoteID, InvAcct, InvSub, InvtID, ItemGLClassID, LineRef, ListPrice, LotSerCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, ManualCost, ManualPrice, NoteID, OrdLineRef, OrdNbr, OrigINBatNbr, OrigInvcNbr, OrigInvtID, OrigShipperID, OrigShipperLineRef, ProjectID, QtyPick, QtyShip, RebateID, RebatePer, RebateRefNbr, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Sample, Service, ShipperID, ShipWght, SiteID, SlsAcct, SlsperID, SlsPrice, SlsPriceID, SlsSub, SplitLots, Status, TaskID, Taxable, TaxAmt00, TaxAmt01, TaxAmt02, TaxAmt03, TaxCat, TaxID00, TaxID01, TaxID02, TaxID03, TaxIDDflt, TotCommCost, TotCost, TotInvc, TotMerch, TxblAmt00, TxblAmt01, TxblAmt02, TxblAmt03, UnitDesc, UnitMultDiv, User1, User10, User2, User3, User4, User5, User6, User7, User8, User9)
select AlternateID, AltIDType, BMICost, BMICuryID, BMIEffDate, BMIExtPriceInvc, BMIMultDiv, BMIRate, BMIRtTp, BMISlsPrice, ChainDisc, CmmnPct, CnvFact, COGSAcct, COGSSub, CommCost, Cost, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCommCost, CuryCost, CuryListPrice, CurySlsPrice, CuryTaxAmt00, CuryTaxAmt01, CuryTaxAmt02, CuryTaxAmt03, CuryTotCommCost, CuryTotCost, CuryTotInvc, CuryTotMerch, CuryTxblAmt00, CuryTxblAmt01, CuryTxblAmt02, CuryTxblAmt03, Descr, DescrLang, DiscAcct, DiscPct, DiscSub, Disp, InspID, InspNoteID, InvAcct, InvSub, InvtID, ItemGLClassID, LineRef, ListPrice, LotSerCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, ManualCost, ManualPrice, NoteID, OrdLineRef, OrdNbr, OrigINBatNbr, OrigInvcNbr, OrigInvtID, OrigShipperID, OrigShipperLineRef, ProjectID, QtyPick, QtyShip, RebateID, RebatePer, RebateRefNbr, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Sample, Service, ShipperID, ShipWght, SiteID, SlsAcct, SlsperID, SlsPrice, SlsPriceID, SlsSub, SplitLots, Status, TaskID, Taxable, TaxAmt00, TaxAmt01, TaxAmt02, TaxAmt03, TaxCat, TaxID00, TaxID01, TaxID02, TaxID03, TaxIDDflt, TotCommCost, TotCost, TotInvc, TotMerch, TxblAmt00, TxblAmt01, TxblAmt02, TxblAmt03, UnitDesc, UnitMultDiv, User1, User10, User2, User3, User4, User5, User6, User7, User8, User9
from SOShipLine where ShipperID  in ('FLI0001852') --,'FLI0003728')


delete from SOShipHeader where ShipperID in ('FLI0001852') --,'FLI0001643')
delete from SOShipLine where ShipperID in ('FLI0001852') --,'FLI0001643')


--PASO 2 TABLAS DE FACTURACION HISTORICAS A TEMP (DE 0 A 1 )

insert into PHeDespacho1 (nrodespacho, tipo, nroguia, almacen, user1, user2, user3, user4, user5, user6, user7, user8, user9, user10, user11, user12, user13, user14, user15, user16)
select nrodespacho, tipo, nroguia, almacen, user1, user2, user3, user4, user5, user6, user7, user8, user9, user10, 'R', user12, user13, user14, user15, user16
from PHeDespacho where nrodespacho ='S000011517'

select * from PHeDespacho1 where nrodespacho = 'S000011517'
select * from PHeDespacho where nrodespacho = 'S000011517'

-- delete from PHeDespacho where nrodespacho ='S000011517'

insert into xDespachoShippers1 (Shipperid, CostoMinimo, Custid, NroDespacho, Tipomov, Transportista, PlacaCamion, MarcaCamion, LicenciaChofer, NoConstInscp, MotivoTraslado, DescrTraslado, NombreChofer, FechaDespacho, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10)
select Shipperid, CostoMinimo, Custid, NroDespacho, Tipomov, Transportista, PlacaCamion, MarcaCamion, LicenciaChofer, NoConstInscp, MotivoTraslado, DescrTraslado, NombreChofer, FechaDespacho, user01, user02, user03, user04, user05, user06, user07, user08, user09, user10
-- delete 
from xDespachoShippers where nrodespacho  ='S000011517' AND Shipperid not in ('FLI0001852')

-- delete from xDespachoShippers where nrodespacho ='S000009389'

select * 
-- delete
from  xDespachoShippers1 where nrodespacho  ='S000009389'

select * from  xDespachoShippers where nrodespacho  ='S000009389'


--- paso de liquidar despacho

--pasi liq
select user1,nextFunctionClass,NextFunctionId, AdminHold, *
--UPDATE newsh SET nextFunctionClass='4060',NextFunctionId='4068002',adminHold=0
from newsh where shipperid in ('FLI0003729','FLI0003728') --,'FLI0001643')

select * 
-- delete
from SOShipLot1 where ShipperID = 'FLI0003729'
select * 
-- delete
from SOShipLot1 where ShipperID = 'FLI0003728'

-- para que reimpriman en el reporte de imprimir voucher
--insert into SOShipLot1 (BoxRef, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, DropShip, InvtId, 
--LineRef, LotSerNbr, LotSerRef, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, QtyPick, QtyShip, 
--RMADisposition, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, 
--S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, ShipperID, User1, User10, User2, User3, 
--User4, User5, User6, User7, User8, User9, WhseLoc)
--select BoxRef, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, DropShip, InvtId, LineRef, LotSerNbr, 
--LotSerRef, LUpd_DateTime, LUpd_Prog, LUpd_User, NoteID, QtyPick, QtyShip, RMADisposition, S4Future01, 
--S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, 
--S4Future10, S4Future11, S4Future12, ShipperID, User1, User10, User2, User3, User4, User5, User6, 
--User7, User8, User9, WhseLoc from SOShipLot where ShipperID = 'FLI0003728' 

select * 
-- UPDATE T SET USER02 = 'SYSADMIN'
from AMVouchers T where almacen = 'LIMPT' AND SerieGR = '032'

select InvcNbr, ShipperID, User1, * from newsh f where f.InvcNbr in ('F010008029','F010008030')
select InvcNbr, * from newsh where ShipperID = ''

select * from SOShipLine where ShipperID = 'FLI0003729'

FLI0003729
FLI0003728

F010008029
F010008030   


G032103410
G032103411
                   
select user2, ShipperID, InvcNbr, * 
-- update t set user2 = 'G032103410'
from newSH t where ShipperID in ('FLI0003729','FLI0003728')
