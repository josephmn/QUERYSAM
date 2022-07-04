use [am2015app]
GO
alter  VIEW XVR_Sales_Report   
AS  
SELECT  SH.ShipperID, SH.InvcNbr, SH.CustID, SH.InvcDate, SH.ShipCity, SH.SlsPerid , SH.ShipState ,   
      (SH.TotInvc - SH.TotTax - SH.S4Future03) AS ValorVta,  
 --'Afecto' =  sum(Case When St.TotTax <> 0 Then (SH.TotInvc - SH.TotTax) Else 0 End),  
 --'No_Afecto' = sum(Case When St.TotTax  = 0 Then SH.TotInvc Else 0 End),  
 'Afecto' = isnull ((SELECT sum (TotInvc) FROM SOSHIPLINE where SHIPPERID = SH.ShipperID AND taxcat = 'AFECTO'),0),  
 'No_Afecto' = Isnull ((SELECT sum (TotInvc) FROM SOSHIPLINE where SHIPPERID = SH.ShipperID and taxcat = 'INAFECTO'),0),  
 IGV = --sum(case When SH.TaxID00 = ST.TaxID and  SH.TaxID00='IGV1' Then (ST.TotTax) else 0 end ),  
Sum(    
--SH.TaxID00 = ST.TaxID and   
 Case When SH.TaxID00='IGV1' Then ST.TotTax Else  
   Case When SH.TaxID01 = 'IGV1' Then T1.TotTax Else  
    Case When SH.TaxID02 = 'IGV1' Then T2.TotTax Else  
     Case When SH.TaxID03 = 'IGV1' Then T3.TotTax Else 0  
     End  
    End  
   End  
 End   
 ),  
 Otros_tax =    
--sum( isnull(T1.TotTax,0) + isnull(T2.TotTax,0) + isnull(T3.TotTax,0)),  
Sum(  
  
 Case When  SH.TaxID00 = 'IGV' Then ST.TotTax Else  
   Case When  SH.TaxID01 = 'IGV' Then T1.TotTax Else  
    Case When SH.TaxID02 = 'IGV' Then T2.TotTax Else  
     Case When  SH.TaxID03 = 'IGV' Then T3.TotTax Else 0  
     End  
    End  
   End  
 End   
 ),  
 SH.TotTax AS All_Tax_Total, (SH.TotInvc - SH.S4Future03) TotInvc , SH.PerClosed, SH.PerPost,    
 SH.Status, SH.CpnyID, SH.ARBatNbr, SH.CustOrdNbr, SH.OrdNbr,   
 AR.doctype, SH.SOTypeID, SOT.Behavior,   
 TipoDoc = Sh.User8,   
 sh.cancelled,  
 FactRel = Isnull(FR.InvcNbr ,''), ST.TaxRate  
FROM         SOShipHeader SH   
LEFT OUTER JOIN  
SOShipTax ST ON SH.ShipperID = ST.ShipperID AND SH.CpnyID = ST.CpnyID  and SH.taxid00 = ST.taxid   
LEFT OUTER join soshiptax T1 on SH.shipperid = T1.shipperid and  SH.taxid01 = T1.taxid   
LEFT OUTER join soshiptax T2 on SH.shipperid = T2.shipperid and  SH.taxid02 = T2.taxid   
LEFT OUTER join soshiptax T3 on SH.shipperid = T3.shipperid and  SH.taxid03 = T3.taxid   
INNER JOIN  
--INNER JOIN  
--                      SOShipTax ST ON SH.ShipperID = ST.ShipperID AND SH.CpnyID = ST.CpnyID INNER JOIN  
                      SOType SOT ON SH.CpnyID = SOT.CpnyID AND SH.SOTypeID = SOT.SOTypeID LEFT OUTER JOIN  
                      ARDoc AR ON SH.arbatnbr = AR.batnbr  and SH.CustID = AR.CustId AND AR.RefNbr = SH.InvcNbr AND AR.CpnyID = SH.CpnyID LEFT OUTER JOIN  
                      PLCMInvcnbr_top1 FR ON FR.CpnyID = SH.CpnyID AND FR.ShipperID = SH.ShipperID  
  
where sot.behavior not in ('Q', 'BL', 'WO', 'SHIP', 'TR') and sh.cancelled=0 and sh.invcnbr<>'' and SH.status='C' and   
        AR.Doctype <>'PA'  AND AR.Doctype <>'VT' --agregado popr danny por tema de aplicaciones de pago en bloque  
--and SH.InvcNbr='C160002339'  
Group by SH.ShipperID, SH.InvcNbr, SH.CustID, SH.InvcDate, SH.ShipCity, SH.SlsPerid, SH.ShipState ,  
  SH.TotTax, SH.TotInvc, SH.PerClosed, SH.PerPost, SH.SOTypeID,   
  SH.Status, SH.CpnyID, SH.ARBatNbr, SH.CustOrdNbr, SH.OrdNbr,   
  AR.doctype, SOT.Behavior, Sh.User8, sh.cancelled,  
  FR.InvcNbr, ST.TaxRate,SH.S4Future03  
  
UNION  
  
Select '',a.RefNbr, a.CustId, DocDate, SO.city, a.SlsPerid , SO.State ,   
 sum(case when a.TaxId00 = 'IGV1' then a.TxblTot00 when a.TaxId01 = 'IGV' then a.TxblTot01 when a.TaxId02 = 'IGV' then a.TxblTot02 when a.TaxId03 = 'IGV' then a.TxblTot03 Else 0 End)  
 + Round((origdocamt-(Case when a.TaxId00 in ('IGV1') then a.TxblTot00 when a.TaxId01 in ('IGV') then a.TxblTot01 when a.TaxId02 in ('IGV') then a.TxblTot02 when a.TaxId03 in ('IGV') then a.TxblTot03 else 0 end ) - (a.TaxTot00 + a.TaxTot01 + a.TaxTot02 + 
  
  
  
  
  
  
  
  
a.TaxTot03)-isnull((select isnull(tranAmt,0) from artran where refnbr = a.refnbr and acct ='401130'),0)),2)  
 as ValorVta,   
 'Afecto' =   
 sum(case when a.TaxId00 = 'IGV1' then a.TxblTot00 when a.TaxId00 = 'IGV' then a.TxblTot00  when a.TaxId01 = 'IGV' then a.TxblTot01 when a.TaxId02 = 'IGV' then a.TxblTot02 when a.TaxId03 = 'IGV' then a.TxblTot03 Else 0 End)  -isnull((select isnull(tranAmt
  
  
,0) from artran where refnbr = a.refnbr and acct ='401130'),0),  
        'No_Afecto' =  
  Round((origdocamt-(Case when a.TaxId00 in ('IGV1') then a.TxblTot00  when a.TaxId00 = 'IGV' then a.TxblTot00 when a.TaxId01 in ('IGV') then a.TxblTot01 when a.TaxId02 in ('IGV') then a.TxblTot02 when a.TaxId03 in ('IGV') then a.TxblTot03 else 0 end ) - 
  
  
  
  
  
  
  
  
(a.TaxTot00 + a.TaxTot01 + a.TaxTot02 + a.TaxTot03)-isnull((select isnull(tranAmt,0) from artran where refnbr = a.refnbr and acct ='401130'),0)),2),  
 'IGV' =sum  
 (Case when a.TaxId00 = 'IGV1' then a.TaxTot00 when a.TaxId01 = 'IGV' then a.TaxTot01 when a.TaxId02 = 'IGV' then a.TaxTot02 when a.TaxId03 = 'IGV' then a.TaxTot03 Else 0 end),  
 'Otros_Tax' = sum(Case when a.TaxId00 <> 'IGV1' then a.TaxTot00 when a.TaxId01 <> 'IGV' then a.TaxTot01 when a.TaxId02 <> 'IGV' then a.TaxTot02 when a.TaxId03 <> 'IGV' then a.TaxTot03 Else 0 end),  
 sum(Case when a.TaxId00 = 'IGV1' then a.TaxTot00 when a.TaxId01 = 'IGV' then a.TaxTot01 when a.TaxId02 = 'IGV' then a.TaxTot02 when a.TaxId03 = 'IGV' then a.TaxTot03 Else 0 end) + sum(Case when a.TaxId00 <> 'IGV1' then a.TaxTot00 when a.TaxId01 <> 'IGV' 
  
  
  
  
  
  
  
  
then a.TaxTot01 when a.TaxId02 <> 'IGV' then a.TaxTot02 when a.TaxId03 <> 'IGV' then a.TaxTot03 Else 0 end)  
 as Total_Imp,  
 'OrigDocAmt'= a.OrigDocAmt -isnull((select isnull(tranAmt,0) from artran where refnbr = a.refnbr and acct ='401130'),0), a.PerPost, a.PerPost,'',a.CpnyId,BatNbr,'','',a.DocType,'','',a.User6 as TipoDoc, cancelled=0,  
 FactRel = Isnull(FR.InvcNbr ,''), a.user3 as TaxRate  
From Ardoc a  
LEFT JOIN PLCMInvcnbr_top1 FR on FR.CpnyID=a.CpnyID and FR.CustID=a.CustID and FR.DocType=a.DocType and FR.RefNbr=a.refnbr   
INNER JOIN SoAddress SO on SO.CustId = a.CustId and SO.ShipToID = a.user5  
  
Where rlsed=1 and left(a.refnbr,1) <> 'P'  and  
--a.refnbr not in ( select invcnbr from soshipheader where status='C' and cancelled in (0,1) and custid=a.custid ) and  
 a.refnbr not in ( select invcnbr from soshipheader where status='C' and cancelled in (0,1)  ) and  
 a.user6<>'' and  
             a.Doctype <>'PA' AND a.Doctype <>'VT' --agregado popr danny por tema de aplicaciones de pago en bloque Y REVERSIONES  
 AND a.batnbr not in (select batnbr from batch where module in ('AR') and user6 <> ''  )  
  
Group by a.RefNbr, a.CustId, DocDate, SO.city, a.SlsPerid , SO.State , a.Taxtot00, a.Taxtot01, a.Taxtot02, a.Taxtot03, a.TaxId00, a.TaxId01, a.TaxId02, a.TaxId03,  
  a.TxblTot00, a.TxblTot01, a.TxblTot02, a.TxblTot03, a.OrigDocAmt, a.PerPost, a.PerPost,a.CpnyId, a.BatNbr,a.DocType, a.User6,  
  FR.InvcNbr, a.user3  
  
UNION  
  
SELECT  SH.ShipperID, SH.InvcNbr, '00000000000', SH.InvcDate,  SH.ShipCity, SH.SlsPerid , SH.ShipState ,  
 0 AS ValorVta,  
 'Afecto' =  0,  
 'No_Afecto' = 0,  
 'IGV' = 0,  
 'Otros_tax' = 0,  
 0 AS All_Tax_Total,   
 TotInvc=0,   
 SH.PerClosed,   
 SH.PerPost,    
 SH.Status,   
 SH.CpnyID,   
 SH.ARBatNbr,   
 SH.CustOrdNbr,   
 SH.OrdNbr,   
 AR.doctype,   
 SH.SOTypeID,   
 SOT.Behavior,   
 TipoDoc = Sh.User8,   
 sh.cancelled,  
 FactRel = Isnull(FR.InvcNbr ,''), ST.TaxRate  
FROM         SOShipHeader SH INNER JOIN  
                      SOShipTax ST ON SH.ShipperID = ST.ShipperID AND SH.CpnyID = ST.CpnyID INNER JOIN  
                      SOType SOT ON SH.CpnyID = SOT.CpnyID AND SH.SOTypeID = SOT.SOTypeID LEFT OUTER JOIN  
                      ARDoc AR ON SH.CustID = AR.CustId AND AR.RefNbr = SH.InvcNbr AND AR.CpnyID = SH.CpnyID LEFT OUTER JOIN  
                      PLCMInvcnbr_top1 FR ON FR.CpnyID = SH.CpnyID AND FR.ShipperID = SH.ShipperID  
  
where sot.behavior not in ('Q', 'BL', 'WO', 'SHIP', 'TR') and cancelled=1 and sh.invcnbr<>'' and SH.status='C'   
  
Group by SH.ShipperID, SH.InvcNbr, SH.CustID, SH.InvcDate,  SH.ShipCity, SH.SlsPerid , SH.ShipState ,  
  SH.TotTax, SH.TotInvc, SH.PerClosed, SH.PerPost, SH.SOTypeID,   
  SH.Status, SH.CpnyID, SH.ARBatNbr, SH.CustOrdNbr, SH.OrdNbr, AR.doctype, SOT.Behavior, Sh.User8,   
  sh.cancelled,FR.InvcNbr, ST.TaxRate  
UNION  
  
Select a.banksub as shipperid,a.RefNbr, a.CustId, DocDate, A.BATNBR, a.SlsPerid , A.BANKID ,   
 sum(case when a.TaxId00 = 'IGV1' then a.TxblTot00 when a.TaxId01 = 'IGV' then a.TxblTot01 when a.TaxId02 = 'IGV' then a.TxblTot02 when a.TaxId03 = 'IGV' then a.TxblTot03 Else 0 End)  
 + Round((origdocamt-(Case when a.TaxId00 in ('IGV1') then a.TxblTot00 when a.TaxId01 in ('IGV') then a.TxblTot01 when a.TaxId02 in ('IGV') then a.TxblTot02 when a.TaxId03 in ('IGV') then a.TxblTot03 else 0 end ) - (a.TaxTot00 + a.TaxTot01 + a.TaxTot02 + 
  
  
  
  
  
  
  
  
a.TaxTot03)),2)  
 as ValorVta,   
 sum(case when a.TaxId00 = 'IGV1' then a.TxblTot00 when a.TaxId01 = 'IGV' then a.TxblTot01 when a.TaxId02 = 'IGV' then a.TxblTot02 when a.TaxId03 = 'IGV' then a.TxblTot03 Else 0 End)  
 + Round((origdocamt-(Case when a.TaxId00 in ('IGV1') then a.TxblTot00 when a.TaxId01 in ('IGV') then a.TxblTot01 when a.TaxId02 in ('IGV') then a.TxblTot02 when a.TaxId03 in ('IGV') then a.TxblTot03 else 0 end ) - (a.TaxTot00 + a.TaxTot01 + a.TaxTot02 + 
  
  
  
  
  
  
  
  
a.TaxTot03)),2)  
 as Afecto,   
-- 'Afecto' =   
-- sum(case when a.TaxId00 = 'IGV' then a.TxblTot00 when a.TaxId01 = 'IGV' then a.TxblTot01 when a.TaxId02 = 'IGV' then a.TxblTot02 when a.TaxId03 = 'IGV' then a.TxblTot03 Else 0 End),  
 'No_Afecto' = 0,  
--        'No_Afecto' =  
--  Round((origdocamt-(Case when a.TaxId00 in ('IGV') then a.TxblTot00 when a.TaxId01 in ('IGV') then a.TxblTot01 when a.TaxId02 in ('IGV') then a.TxblTot02 when a.TaxId03 in ('IGV')   
--then a.TxblTot03 else 0 end ) - (a.TaxTot00 + a.TaxTot01 + a.TaxTot02 + a.TaxTot03)),2),  
 'IGV' =sum  
 (Case when a.TaxId00 = 'IGV1' then a.TaxTot00 when a.TaxId01 = 'IGV' then a.TaxTot01 when a.TaxId02 = 'IGV' then a.TaxTot02 when a.TaxId03 = 'IGV' then a.TaxTot03 Else 0 end),  
 'Otros_Tax' = sum(Case when a.TaxId00 <> 'IGV1' then a.TaxTot00 when a.TaxId01 <> 'IGV' then a.TaxTot01 when a.TaxId02 <> 'IGV' then a.TaxTot02 when a.TaxId03 <> 'IGV' then a.TaxTot03 Else 0 end),  
 sum(Case when a.TaxId00 = 'IGV1' then a.TaxTot00 when a.TaxId01 = 'IGV' then a.TaxTot01 when a.TaxId02 = 'IGV' then a.TaxTot02 when a.TaxId03 = 'IGV' then a.TaxTot03 Else 0 end) + sum(Case when a.TaxId00 <> 'IGV1' then a.TaxTot00 when a.TaxId01 <> 'IGV' 
  
  
  
  
  
  
  
  
then a.TaxTot01 when a.TaxId02 <> 'IGV' then a.TaxTot02 when a.TaxId03 <> 'IGV' then a.TaxTot03 Else 0 end)  
 as Total_Imp,  
 a.OrigDocAmt, a.PerPost, a.PerPost,'',a.CpnyId,BatNbr,'','',a.DocType,'','',a.User6 as TipoDoc, cancelled=0,  
 FactRel = Isnull(FR.InvcNbr ,''), a.user3 as TaxRate  
From ARDoc_CAF a  
LEFT JOIN PLCMInvcnbr_top1 FR on FR.CpnyID=a.CpnyID and FR.CustID=a.CustID and FR.DocType=a.DocType and FR.RefNbr=a.refnbr   
 --INNER JOIN SoAddress SO on SO.CustId = a.CustId and SO.ShipToID = a.user5  
  
Where rlsed=1 and left(a.refnbr,1) <> 'P'  and  
 a.refnbr not in (select invcnbr from soshipheader where status='C' and cancelled=0 and custid=a.custid ) and  
 a.user6<>'' and  
             a.Doctype <>'PA' AND a.Doctype <>'VT' --agregado popr danny por tema de aplicaciones de pago en bloque Y REVERSIONES  
  
Group by a.banksub, a.RefNbr, a.CustId, DocDate,A.BATNBR, a.SlsPerid , A.BANKID , a.Taxtot00, a.Taxtot01, a.Taxtot02, a.Taxtot03, a.TaxId00, a.TaxId01, a.TaxId02, a.TaxId03,  
  a.TxblTot00, a.TxblTot01, a.TxblTot02, a.TxblTot03, a.OrigDocAmt, a.PerPost, a.PerPost,a.CpnyId, a.BatNbr,a.DocType, a.User6,  
  FR.InvcNbr, a.user3  
  
  
  
  
  
  
  
  
  
  
  
  
  