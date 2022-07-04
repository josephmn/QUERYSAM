
SELECT BatNbr, InvtId,  siteid, Qty, InvtMult, TranAmt, TRANTYPE, ReasonCd, TRANDATE, UNITPRICE, ExtCost, ROUND((UNITPRICE * QTY),2) DDDD, (TranAmt - ROUND((UNITPRICE * QTY),2)) GGGG,
( Case When (Intran.TranType In ('IN','CM','RI','AJ')) Then (Case When Left(Intran.Acct,2) In ('71')and Left(Intran.ReasonCd,6) not In ('PORREC') Then Intran.Qty*Intran.InvtMult Else 0 End) WHEN  Intran.TranType In ('AS')     
 then Intran.Qty*Intran.InvtMult  Else 0 End ) as CantConsumo,
( Case When (Intran.TranType In ('IN','CM','RI','AJ')) Then (Case When Left(Intran.Acct,2) In ('71') and Left(Intran.ReasonCd,6) not In ('PORREC')  Then Intran.ExtCost*Intran.InvtMult Else 0 End ) WHEN  Intran.TranType In ('AS')     
 then Intran.ExtCost*Intran.InvtMult Else 0 End ) as TotConsumo, 
 ( Case When Intran.TranType In ('IN','CM','RI') Then Case When Left(Intran.Acct,2) In ('23','70') Then Intran.Qty*Intran.InvtMult Else 0 End Else 0 End ) as CantVendida,
( Case When Intran.TranType In ('IN','CM','RI') Then Case When Left(Intran.Acct,2) In ('23','70') Then Intran.ExtCost*Intran.InvtMult Else 0 End Else 0 End ) as TotVendida
From Intran           
Where           
 Not TranType In ('TR', 'CG', 'CT')           
 And Upper(Rtrim(SiteID))<>'TALLER01'          
 And PerPost>=(Select BegPerNbr From RptRuntime Where ReportNbr ='IN004' And RI_ID In (Select Max(RI_ID) From RptRuntime Where ReportNbr= 'IN004'))          
 And PerPost<=(Select EndPerNbr From RptRuntime Where ReportNbr ='IN004' And RI_ID In (Select Max(RI_ID) From RptRuntime Where ReportNbr= 'IN004')) and InvtID = '20266' and SiteID = 'MARKETING' --AND   ReasonCd <> ''            
ORDER BY TRANDATE ASC


select BatNbr, InvtId,  siteid, Qty, InvtMult, TranAmt, TRANTYPE, ReasonCd, TRANDATE, UNITPRICE, ExtCost, ROUND((UNITPRICE * QTY),2) DDDD
-- UPDATE INTran SET TranAmt = ROUND((UNITPRICE * QTY),2), ExtCost = ROUND((UNITPRICE * QTY),2)
from INTran where InvtID = '20266' and SiteID = 'MARKETING' AND   ReasonCd <> '' --and BatNbr in ('004111')
order by TranDate asc


/*
SELECT * INTO INTRAN20266 FROM (
SELECT * FROM INTRAN WHERE BatNbr = '006511' UNION ALL
SELECT * FROM INTRAN WHERE BatNbr = '006512' UNION ALL
SELECT * FROM INTRAN WHERE BatNbr = '018979' 
) X


SELECT * FROM ItemHist WHERE INVTID = '20266' AND SITEID = 'MARKETING'
SELECT * FROM ItemBMIHist WHERE INVTID = '20266' AND SITEID = 'MARKETING'

--006511    	20266                         	MARKETING 	0	1	-1
--006512    	20266                         	MARKETING 	0	1	2
--018979    	20266                         	MARKETING 	0	1	494.29

SELECT * INTO GLTRAN20266 FROM (
SELECT CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, * 
-- UPDATE GLTran SET CrAmt = 0, CuryCrAmt = 0, DrAmt = 0, CuryDrAmt = 0
FROM GLTran WHERE BatNbr = '006511' AND Module = 'IN' UNION ALL
SELECT CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, * 
-- UPDATE GLTran SET CrAmt = 0, CuryCrAmt = 0, DrAmt = 0, CuryDrAmt = 0
FROM GLTran WHERE BatNbr = '006512' AND Module = 'IN' UNION ALL
SELECT CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, * 
-- UPDATE GLTran SET CrAmt = 0, CuryCrAmt = 0, DrAmt = 0, CuryDrAmt = 0
FROM GLTran WHERE BatNbr = '018979' AND Module = 'IN'
) X
*/
