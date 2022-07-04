



sp_helptext Llena_SO40170_test 

insert into SO40170_test  
SELECT APContact = IsNull((SELECT top 1 Name FROM CustContact WHERE CustID = h.CustID and Type = 'A'), ''),   
   APPhone = IsNull((SELECT top 1 Phone FROM CustContact WHERE CustID = h.CustID and Type = 'A'), ''),   
   ARAcct, ARBal = 0,   
   ARSub, AuthNbr, BillAddr1, BillAddr2, BillAddrSpecial, BillAttn,   
   BillCity, BillCountry, BillName, BillState, BillZip, BlktOrdNbr, BuildInvtID,   
   BuildQty, BuyerID, BuyerName, Cancelled, h.CertID, CertNoteID, CmmnPct,   
   ContractNbr, h.CpnyID, CreditApprDays, CreditApprLimit, h.CreditChk, CreditHold,   
   CreditHoldDate, h.Crtd_DateTime, h.Crtd_Prog, h.Crtd_User, CuryEffDate, h.CuryID,   
   CuryMultDiv, CuryPremFrtAmt, CuryRate, CuryRateType, CuryTotInvc,   
   CuryTotLineDisc, CuryTotMerch, CuryTotMisc,   
   CuryTotPmt, CuryTotTax, CuryTotTxbl, CuryWholeOrdDisc, CustGLClassID, h.CustID, CustOrdNbr,   
   DateCancelled, Dept, DiscPct, Div, EDI810, EDI856, h.FOBID, FrtCollect,   
   FrtTermsID, h.GeoCode, h.LanguageID, LineCntr, h.LUpd_DateTime, h.LUpd_Prog, h.LUpd_User,   
   MarkFor, MiscChrgCntr, NextFunctionClass, NextFunctionID, h.NoteID, OrdDate, OrdNbr,   
   PmtCntr, Priority, ProjectID, Released = 0,  
   h.S4Future01, h.S4Future02, h.S4Future03, h.S4Future04, h.S4Future05, h.S4Future06,  
   h.S4Future07, h.S4Future08, h.S4Future09, h.S4Future10, h.S4Future11, h.S4Future12,  
   ShipAddr1, ShipAddr2, ShipAddrID, ShipAddrSpecial,   
   ShipAttn, ShipCity, ShipCmplt, ShipCountry, ShipCustID, ShipGeoCode, ShipName,   
   ShipperID, ShipSiteID, ShipState, ShiptoID, ShiptoType, ShipVendID,   
   ShipViaID, ShipZip, h.SiteID, SlsperID, h.SOTypeID, SpecOrd = 0, h.Status, TaxID00, TaxID01,   
   TaxID02, TaxID03, TermsID, TotCommCost, TotCost, TotInvc, TotLineDisc, TotMerch,   
--   TotMisc, a.TotOpenOrd, TotPmt, TotShipWght, TotTax, TotTxbl, Type = 'S',   
   TotMisc, 0 TotOpenOrd, TotPmt, TotShipWght, TotTax, TotTxbl, Type = 'S',   
   h.User1, h.User10, h.User2, h.User3, h.User4, h.User5, h.User6, h.User7, h.User8, h.User9,   
   WeekendDelivery, WholeOrdDisc, WorkflowID, WorkflowStatus,null as tstamp  
  FROM  newsh h   
    LEFT JOIN CustomerEDI c ON h.CustID = c.CustID   
--    LEFT JOIN AR_Balances a On h.CustID = a.CustID and h.CpnyID = a.CpnyID  
    LEFT JOIN sostep s on h.cpnyid = s.cpnyid and h.sotypeid = s.sotypeid   
   and h.Nextfunctionid = s.functionid and h.nextfunctionclass = s.functionclass   
  WHERE  h.Status = 'O'   
    AND  CreditHold = 1   
  

------/////////////////////////////////////

sp_helptext  Custome_name 
-- Custome_name '20100030838' 

sp_helptext SOType_Descr
--SOType_Descr 'FLI', 'ALTOMAYO' 

sp_helptext ADG_Site_Name
--ADG_Site_Name 'LIMCEN' 

sp_helptext Terms_Descr
--Terms_Descr '' 

FLI0003511

select  *from customer where custid ='20100030838'


SP_HELPTEXT ADG_SalesPerson_Name 
'547' 

----------------------------------------------------------------------------------------
sp_helptext Llena_SO40170_test 


select  *from  SO40170_test   where shipperid='bli0000442'

sp_helptext SO40170_test


select * from newsh where shipperid='FLI0002730'


SELECT APContact = IsNull((SELECT top 1 Name FROM CustContact WHERE CustID = h.CustID and Type = 'A'), ''),   
   APPhone = IsNull((SELECT top 1 Phone FROM CustContact WHERE CustID = h.CustID and Type = 'A'), ''),   
   ARAcct, ARBal = 0,   
   ARSub, AuthNbr, BillAddr1, BillAddr2, BillAddrSpecial, BillAttn,   
   BillCity, BillCountry, BillName, BillState, BillZip, BlktOrdNbr, BuildInvtID,   
   BuildQty, BuyerID, BuyerName, Cancelled, h.CertID, CertNoteID, CmmnPct,   
   ContractNbr, h.CpnyID, CreditApprDays, CreditApprLimit, h.CreditChk, CreditHold,   
   CreditHoldDate, h.Crtd_DateTime, h.Crtd_Prog, h.Crtd_User, CuryEffDate, h.CuryID,   
   CuryMultDiv, CuryPremFrtAmt, CuryRate, CuryRateType, CuryTotInvc,   
   CuryTotLineDisc, CuryTotMerch, CuryTotMisc,   
   CuryTotPmt, CuryTotTax, CuryTotTxbl, CuryWholeOrdDisc, CustGLClassID, h.CustID, CustOrdNbr,   
   DateCancelled, Dept, DiscPct, Div, EDI810, EDI856, h.FOBID, FrtCollect,   
   FrtTermsID, h.GeoCode, h.LanguageID, LineCntr, h.LUpd_DateTime, h.LUpd_Prog, h.LUpd_User,   
   MarkFor, MiscChrgCntr, NextFunctionClass, NextFunctionID, h.NoteID, OrdDate, OrdNbr,   
   PmtCntr, Priority, ProjectID, Released = 0,  
   h.S4Future01, h.S4Future02, h.S4Future03, h.S4Future04, h.S4Future05, h.S4Future06,  
   h.S4Future07, h.S4Future08, h.S4Future09, h.S4Future10, h.S4Future11, h.S4Future12,  
   ShipAddr1, ShipAddr2, ShipAddrID, ShipAddrSpecial,   
   ShipAttn, ShipCity, ShipCmplt, ShipCountry, ShipCustID, ShipGeoCode, ShipName,   
   ShipperID, ShipSiteID, ShipState, ShiptoID, ShiptoType, ShipVendID,   
   ShipViaID, ShipZip, h.SiteID, SlsperID, h.SOTypeID, SpecOrd = 0, h.Status, TaxID00, TaxID01,   
   TaxID02, TaxID03, TermsID, TotCommCost, TotCost, TotInvc, TotLineDisc, TotMerch,   
--   TotMisc, a.TotOpenOrd, TotPmt, TotShipWght, TotTax, TotTxbl, Type = 'S',   
   TotMisc, 0 TotOpenOrd, TotPmt, TotShipWght, TotTax, TotTxbl,-- Type = 'S',   
   h.User1, h.User10, h.User2, h.User3, h.User4, h.User5, h.User6, h.User7, h.User8, h.User9,   
   WeekendDelivery, WholeOrdDisc, WorkflowID, WorkflowStatus,null as tstamp  
  FROM  newsh h   
    LEFT JOIN CustomerEDI c ON h.CustID = c.CustID   
--    LEFT JOIN AR_Balances a On h.CustID = a.CustID and h.CpnyID = a.CpnyID  
    LEFT JOIN sostep s on h.cpnyid = s.cpnyid and h.sotypeid = s.sotypeid   
   and h.Nextfunctionid = s.functionid and h.nextfunctionclass = s.functionclass   
  WHERE  h.Status = 'O'   
    AND  CreditHold = 1   
  and  h.shipperid='bli0000443'

20600215982

select * from  CustomerEDI

select * from customer where custid ='45123196'    

select custid,* from customer where priceclassid='0024'

sp_helptext CustomerEDI
------------------------------------------------------------------------
sp_helptext Llena_SO40170_test 



sp_helptext  ADG_SalesPerson_Name 











