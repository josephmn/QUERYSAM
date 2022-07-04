
SELECT ARBatNbr, INBatNbr, InvcDate, Cancelled, * FROM SOShipHeader WHERE Invcnbr = 'F020000414'
SELECT ARBatNbr, INBatNbr, InvcDate, Cancelled, * FROM SOShipHeader WHERE Invcnbr = 'F020000415'
SELECT ARBatNbr, INBatNbr, InvcDate, Cancelled, * FROM SOShipHeader WHERE Invcnbr = 'F020000416'



-- INSERTAMOS EN EL PLCMInvcnbr
INSERT INTO PLCMInvcnbr (CpnyID, Custid, DocType, InvcNbr, LineNbr, RefNbr, ShipperID, User1, User2, User3, User4, User5, User6, User7, User8)
SELECT CpnyID, Custid, DocType, InvcNbr, LineNbr, RefNbr, 'CFLI000099', User1, User2, User3, User4, User5, User6, User7, User8 FROM 
PLCMInvcnbr WHERE ShipperID = 'CFLI000098'


--- REVISAMOS SI EXISTE UN SHIPPERID PARA INGRESA A CM
SELECT ARBatNbr, INBatNbr, InvcNbr, InvcDate, PerPost, Cancelled, ShipperID, User1, User2, * FROM SOShipHeader WHERE ShipperID LIKE 'CFLI%'


--- INSERT INTO A LAS TABLAS SHIPPER

INSERT INTO SOShipHeader
(AdminHold, ARAcct, ARBatNbr, ARSub, AuthNbr, BalDue, BillAddr1, BillAddr2, BillAddrSpecial, BillAttn, BillCity, BillCountry, BillName, BillPhone, 
BillState, BillZip, BlktOrdNbr, BMICost, BMICuryID, BMIEffDate, BMIMultDiv, BMIRate, BMIRtTp, BookCntr, BoxCntr, BuildActQty, BuildCmpltDate, 
BuildInvtID, BuildLotSerCntr, BuildQty, BuildTotalCost, BuyerID, BuyerName, CancelBO, Cancelled, CancelOrder, CertID, CertNoteID, CmmnPct, 
ContractNbr, CpnyID, CreditApprDays, CreditApprLimit, CreditChk, CreditHold, CreditHoldDate, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryBalDue, 
CuryBuildTotCost, CuryEffDate, CuryID, CuryMultDiv, CuryPremFrtAmt, CuryRate, CuryRateType, CuryTotFrtCost, CuryTotFrtInvc, CuryTotInvc, 
CuryTotLineDisc, CuryTotMerch, CuryTotMisc, CuryTotPmt, CuryTotTax, CuryTotTxbl, CuryWholeOrdDisc, CustGLClassID, CustID, CustOrdNbr, 
DateCancelled, Dept, DiscAcct, DiscPct, DiscSub, Div, DropShip, EDI810, EDI856, EDIASNProcNbr, EDIInvcProcNbr, ETADate, FOBID, FrtAcct, 
FrtCollect, FrtSub, FrtTermsID, GeoCode, INBatNbr, InvcDate, InvcNbr, InvcPrint, LanguageID, LastAppendDate, LastAppendTime, LineCntr, 
LUpd_DateTime, LUpd_Prog, LUpd_User, MarkFor, MiscChrgCntr, NextFunctionClass, NextFunctionID, NoteID, OKToAppend, OrdDate, OrdNbr, 
OverridePerPost, PackDate, PerClosed, PerPost, PickDate, PmtCntr, PremFrt, PremFrtAmt, Priority, ProjectID, RelDate, ReleaseValue, 
RequireStepAssy, RequireStepInsp, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, 
S4Future09, S4Future10, S4Future11, S4Future12, SellingSiteID, ShipAddr1, ShipAddr2, ShipAddrID, ShipAddrSpecial, ShipAttn, ShipCity, 
ShipCmplt, ShipCountry, ShipCustID, ShipDateAct, ShipDatePlan, ShipGeoCode, ShipName, ShipperID, ShipPhone, ShippingConfirmed, 
ShippingManifested, ShipRegisterID, ShipSiteID, ShipState, ShiptoID, ShiptoType, ShipVendID, ShipViaID, ShipZip, SiteID, SlsperID, 
SOTypeID, Status, TaxID00, TaxID01, TaxID02, TaxID03, TermsID, TotBoxes, TotCommCost, TotCost, TotFrtCost, TotFrtInvc, TotInvc, 
TotLineDisc, TotMerch, TotMisc, TotPallets, TotPmt, TotShipWght, TotTax, TotTxbl, TrackingNbr, TransitTime, User1, User10, User2, 
User3, User4, User5, User6, User7, User8, User9, WeekendDelivery, WholeOrdDisc, WorkflowID, WorkflowStatus, Zone)

SELECT AdminHold, ARAcct, '', ARSub, AuthNbr, BalDue, BillAddr1, BillAddr2, BillAddrSpecial, BillAttn, BillCity, BillCountry, BillName, BillPhone, 
BillState, BillZip, BlktOrdNbr, BMICost, BMICuryID, BMIEffDate, BMIMultDiv, BMIRate, BMIRtTp, BookCntr, BoxCntr, BuildActQty, BuildCmpltDate, 
BuildInvtID, BuildLotSerCntr, BuildQty, BuildTotalCost, BuyerID, BuyerName, CancelBO, Cancelled, CancelOrder, CertID, CertNoteID, CmmnPct, 
ContractNbr, CpnyID, CreditApprDays, CreditApprLimit, CreditChk, CreditHold, CreditHoldDate, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryBalDue, 
CuryBuildTotCost, CuryEffDate, CuryID, CuryMultDiv, CuryPremFrtAmt, CuryRate, CuryRateType, CuryTotFrtCost, CuryTotFrtInvc, CuryTotInvc, 
CuryTotLineDisc, CuryTotMerch, CuryTotMisc, CuryTotPmt, CuryTotTax, CuryTotTxbl, CuryWholeOrdDisc, CustGLClassID, CustID, CustOrdNbr, 
DateCancelled, Dept, DiscAcct, DiscPct, DiscSub, Div, DropShip, EDI810, EDI856, EDIASNProcNbr, EDIInvcProcNbr, ETADate, FOBID, FrtAcct, 
FrtCollect, FrtSub, FrtTermsID, GeoCode, '', InvcDate, 'F020000415', InvcPrint, LanguageID, LastAppendDate, LastAppendTime, LineCntr, 
LUpd_DateTime, LUpd_Prog, LUpd_User, MarkFor, MiscChrgCntr, NextFunctionClass, NextFunctionID, NoteID, OKToAppend, OrdDate, OrdNbr, 
OverridePerPost, PackDate, PerClosed, PerPost, PickDate, PmtCntr, PremFrt, PremFrtAmt, Priority, ProjectID, RelDate, ReleaseValue, 
RequireStepAssy, RequireStepInsp, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, 
S4Future09, S4Future10, S4Future11, S4Future12, SellingSiteID, ShipAddr1, ShipAddr2, ShipAddrID, ShipAddrSpecial, ShipAttn, ShipCity, 
ShipCmplt, ShipCountry, ShipCustID, ShipDateAct, ShipDatePlan, ShipGeoCode, ShipName, 'CFLI000099', ShipPhone, ShippingConfirmed, 
ShippingManifested, ShipRegisterID, ShipSiteID, ShipState, ShiptoID, ShiptoType, ShipVendID, ShipViaID, ShipZip, SiteID, SlsperID, 
SOTypeID, Status, TaxID00, TaxID01, TaxID02, TaxID03, TermsID, TotBoxes, TotCommCost, TotCost, TotFrtCost, TotFrtInvc, TotInvc, 
TotLineDisc, TotMerch, TotMisc, TotPallets, TotPmt, TotShipWght, TotTax, TotTxbl, TrackingNbr, TransitTime, '', User10, '', 
User3, User4, User5, User6, User7, User8, User9, WeekendDelivery, WholeOrdDisc, WorkflowID, WorkflowStatus, Zone FROM SOShipHeader WHERE ShipperID = 'CFLI000098'



INSERT INTO SOShipLine
(AlternateID, AltIDType, BMICost, BMICuryID, BMIEffDate, BMIExtPriceInvc, BMIMultDiv, BMIRate, BMIRtTp, BMISlsPrice, ChainDisc, CmmnPct, 
CnvFact, COGSAcct, COGSSub, CommCost, Cost, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCommCost, CuryCost, CuryListPrice, CurySlsPrice, 
CuryTaxAmt00, CuryTaxAmt01, CuryTaxAmt02, CuryTaxAmt03, CuryTotCommCost, CuryTotCost, CuryTotInvc, CuryTotMerch, CuryTxblAmt00, CuryTxblAmt01, 
CuryTxblAmt02, CuryTxblAmt03, Descr, DescrLang, DiscAcct, DiscPct, DiscSub, Disp, InspID, InspNoteID, InvAcct, InvSub, InvtID, ItemGLClassID, 
LineRef, ListPrice, LotSerCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, ManualCost, ManualPrice, NoteID, OrdLineRef, OrdNbr, OrigINBatNbr, 
OrigInvcNbr, OrigInvtID, OrigShipperID, OrigShipperLineRef, ProjectID, QtyPick, QtyShip, RebateID, RebatePer, RebateRefNbr, S4Future01, 
S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Sample, 
Service, ShipperID, ShipWght, SiteID, SlsAcct, SlsperID, SlsPrice, SlsPriceID, SlsSub, SplitLots, Status, TaskID, Taxable, TaxAmt00, TaxAmt01, 
TaxAmt02, TaxAmt03, TaxCat, TaxID00, TaxID01, TaxID02, TaxID03, TaxIDDflt, TotCommCost, TotCost, TotInvc, TotMerch, TxblAmt00, TxblAmt01, 
TxblAmt02, TxblAmt03, UnitDesc, UnitMultDiv, User1, User10, User2, User3, User4, User5, User6, User7, User8, User9)

SELECT AlternateID, AltIDType, BMICost, BMICuryID, BMIEffDate, BMIExtPriceInvc, BMIMultDiv, BMIRate, BMIRtTp, BMISlsPrice, ChainDisc, CmmnPct, 
CnvFact, COGSAcct, COGSSub, CommCost, Cost, CpnyID, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCommCost, CuryCost, CuryListPrice, CurySlsPrice, 
CuryTaxAmt00, CuryTaxAmt01, CuryTaxAmt02, CuryTaxAmt03, CuryTotCommCost, CuryTotCost, CuryTotInvc, CuryTotMerch, CuryTxblAmt00, CuryTxblAmt01, 
CuryTxblAmt02, CuryTxblAmt03, Descr, DescrLang, DiscAcct, DiscPct, DiscSub, Disp, InspID, InspNoteID, InvAcct, InvSub, InvtID, ItemGLClassID, 
LineRef, ListPrice, LotSerCntr, LUpd_DateTime, LUpd_Prog, LUpd_User, ManualCost, ManualPrice, NoteID, OrdLineRef, OrdNbr, OrigINBatNbr, 
OrigInvcNbr, OrigInvtID, OrigShipperID, OrigShipperLineRef, ProjectID, QtyPick, QtyShip, RebateID, RebatePer, RebateRefNbr, S4Future01, 
S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, Sample, 
Service, 'CFLI000099', ShipWght, SiteID, SlsAcct, SlsperID, SlsPrice, SlsPriceID, SlsSub, SplitLots, Status, TaskID, Taxable, TaxAmt00, TaxAmt01, 
TaxAmt02, TaxAmt03, TaxCat, TaxID00, TaxID01, TaxID02, TaxID03, TaxIDDflt, TotCommCost, TotCost, TotInvc, TotMerch, TxblAmt00, TxblAmt01, 
TxblAmt02, TxblAmt03, UnitDesc, UnitMultDiv, User1, User10, User2, User3, User4, User5, User6, User7, User8, User9 FROM SOShipLine WHERE ShipperID = 'CFLI000098'



---- ACTUALIZAMOS LOS CAMPOS PARA PODER LIBERAR

SELECT ARBatNbr, INBatNbr, InvcDate, Cancelled, perpost, curyid, Status, shipperid, ShipRegisterID, * 
-- UPDATE SOShipHeader SET CANCELLED = 1, ShipRegisterID = '', InvcDate = '' ------> colocar aqui la fecha para enviar el comprobante
FROM SOShipHeader WHERE Invcnbr = 'F020000415'




--- REVISAR EN EL LIBERAR DIARIO DE VENTAS

 select top  15 * from soshipheader WHERE perpost =  '201910'  and convert(char(10),invcdate ,120) =  ''  
 and curyid ='DOL' and Status = 'C' And    left(shipperid,1)<>'N' And     ShipRegisterID = '' and cancelled =0 and NextFunctionClass ='' order by user1 asc 


