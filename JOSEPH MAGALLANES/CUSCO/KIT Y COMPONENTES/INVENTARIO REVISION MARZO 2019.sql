---------DETALLE 20 ----

SELECT  'IN' Module,vr_10630."perpost",vr_10630.BatNbr ,vr_10630.RefNbr,vr_10630."InvtID", vr_10630."trantype",
ISNULL(  ROUND(  sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then vr_10630.TranAmt * vr_10630.InvtMult else vr_10630.ExtCost * vr_10630.InvtMult end  )),2) ,0) valor ,
sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then vr_10630.QTY * vr_10630.Unitprice * vr_10630.InvtMult else 0 end  )) valor2
       FROM { oj ((("AMCAF2020APP"."dbo"."vr_10630" vr_10630 
	   INNER JOIN "AMCAF2020APP"."dbo"."RptCompany" RptCompany ON vr_10630."CpnyID" = RptCompany."CpnyID" AND vr_10630."RI_ID" = RptCompany."RI_ID")  
	   INNER JOIN "AMCAF2020APP"."dbo"."Inventory" Inventory ON vr_10630."InvtID" = Inventory."InvtID")
	   LEFT OUTER JOIN "AMCAF2020APP"."dbo"."ItemSite" ItemSite ON vr_10630."InvtID" = ItemSite."InvtID" AND vr_10630."SiteID" = ItemSite."SiteID") 
       INNER JOIN "AMCAF2020APP"."dbo"."InventoryADG" InventoryADG ON Inventory."InvtID" = InventoryADG."InvtID"} WHERE (vr_10630.Invtacct = '241101')
       and vr_10630.PerPost   <= '202011' and vr_10630.BatNbr IN ('045569')
	   --AND vr_10630."RefNbr" ='AI00000016'          
group by vr_10630."BatNbr", vr_10630."RefNbr",vr_10630."InvtID",vr_10630."PerPost",vr_10630."TranType", vr_10630."SiteID"

union all  
  
select 'GL',perpost,batnbr,REFNBR,acct,trantype,ROUND( sum(DRAmt)- sum(CrAmt),2) ,ROUND( sum(curyDRAmt)- sum(curyCrAmt)  ,2)
from gltran G where acct = ('241101') and perpost  <='202011' and G.posted ='P' and batnbr IN ('045569')
--AND RefNbr  ='AI00000016' --and trandesc  ='CARNE MOLIDA'  
--and  module ='IN' --
--and batnbr ='047161'  --and
group by perpost,acct,batnbr,REFNBR,trantype
     

SELECT * FROM INTran WHERE BatNbr IN ('001725','001728')
SELECT * 
-- DELETE
FROM GLTran WHERE BatNbr IN ('001725','001728') AND Module = 'IN'



select Acct, BatNbr, RefNbr, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, Posted, * 
-- update GLTran set DrAmt = 0.19, CuryDrAmt = 0.19
-- update GLTran set Acct = '251101'
-- DELETE
from GLTran G where BatNbr = '001363' and Module = 'IN' --and TranDesc = 'HIERBA LUISA KG' --and Acct = '281101' 



select InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost, TranAmt, TranType, Rlsed, LineID, LineRef, Rlsed, * 
from INTran where BatNbr = '001363' and TranType = 'CT' AND InvtAcct = '241101'

SELECT DISTINCT TRANDESC FROM (
select Acct, BatNbr, RefNbr, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, Posted
-- UPDATE A SET CrAmt = case CrAmt when 0 then 0 else 108.52 end, CuryCrAmt = case CuryCrAmt when 0 then 0 else 108.52 end, DrAmt = case DrAmt when 0 then 0 else 108.52 end,	CuryDrAmt = case CuryDrAmt when 0 then 0 else 108.52 end
from GLTran a where BatNbr = '001363' and Module = 'IN' and Acct = '241101'  --and TranDesc = 'HIERBA LUISA KG' 
) Y

select InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost, TranAmt, TranType, Rlsed, LineID, LineRef, Rlsed, * 
-- UPDATE INTRAN SET InvtAcct = '251101'
-- UPDATE INTRAN SET TranAmt = 0.04032, ExtCost = case ExtCost when 0 then 0 else 0.04032 end
-- UPDATE T SET TranAmt = round(TranAmt,2)
from intran T where BatNbr = '001753'  
AND InvtAcct = '261101' 
--AND RefNbr = '0570012329' 
--AND PerPost = '201909' --AND TranType = 'CT' --and invtid = 'I216669'
--and InvtID in ('I250181')
order by T.TranDesc asc

--SELECT Rlsed, Posted, * FROM GLTran WHERE RefNbr = '001703         ' AND PerPost = '201912'


select Acct, BatNbr, RefNbr, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, Posted, * 
-- update GLTran set DrAmt = 0.19, CuryDrAmt = 0.19
-- update GLTran set Acct = '261101'
-- DELETE
from GLTran G where BatNbr = '001753' and Module = 'IN'
--and LINEREF IN ('00021','00022') 
--AND RefNbr = 'AI00001359' 
--and TranType = 'TR' 
--and TranDesc in ('POLO NEGRO ALTOMAYO           ') --BatNbr = '008128' 
and Acct = '261101'
--Module = 'PO' 
ORDER BY G.TranDesc
--RefNbr LIKE '%333%' AND PerPost = '201903' and Module = 'IN' --and TranDesc like '%TAMAL DE ALCACHOFA            %'-- and LineRef = '00035'

SELECT InvtAcct, InvtID, SiteID, * FROM ItemSite WHERE InvtID = 'I900135'




select InvtAcct, InvtID, SiteID, * from ItemSite where InvtID in ('I211005','I211009')
and SiteID = 'CFCUSCO2'
                          
                       
                       
                       

SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost, round((UnitPrice * Qty),2) ABC,  TranAmt, TranType, Rlsed, * 
-- UPDATE INTran SET TranAmt = round((UnitPrice * Qty),2)
FROM INTran WHERE TranDesc = 'Ensamble Cafeteria Nro:' and PerPost = '201902' and TranType IN ('AS') AND InvtAcct = '211101' AND InvtID = '12702191'
and ExtCost <> TranAmt 
--or round(Qty * UnitPrice,2) <> (TranAmt) 


SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost, round((UnitPrice * Qty),2) ABC, TranAmt, TranType, Rlsed, * 
-- UPDATE INTran SET TranAmt = round((UnitPrice * Qty),2)
FROM INTran WHERE TranDesc = 'Ensamble Cafeteria Nro:' and PerPost = '201902' and TranType IN ('CT') AND InvtAcct = '211101' AND InvtID = '12702191'
and round((UnitPrice * Qty),2) <> TranAmt 

        


SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, Rlsed, * 
-- UPDATE C SET TranAmt = ROUND(TranAmt,2) --, ExtCost = ROUND(ExtCost,2)
-- UPDATE C SET INVTACCT = '201101'
-- UPDATE C SET TranAmt = 0.13
-- delete
FROM INTran c WHERE BatNbr IN ('007788') AND PerPost = '202010' AND InvtAcct = '261101' --AND InvtID = 'I250181' 
ORDER BY C.TranDesc ASC


SELECT Acct, BatNbr, RefNbr, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, Posted, *  
-- UPDATE A SET CrAmt = ROUND(CrAmt,2), CuryCrAmt = ROUND(CuryCrAmt,2)
-- UPDATE A SET CuryDrAmt = 1
-- UPDATE A SET ACCT = '201101'
-- UPDATE A SET CrAmt = 0.52, CuryCrAmt = 0.52
-- UPDATE A SET CrAmt = case CrAmt when 0 then 0 else 2.81 end, CuryCrAmt = case CuryCrAmt when 0 then 0 else 2.81 end, DrAmt = case DrAmt when 0 then 0 else 2.81 end,	CuryDrAmt = case CuryDrAmt when 0 then 0 else 2.81 end
FROM GLTran A WHERE BatNbr IN ('007788') AND PerPost = '202010' --AND Acct = '261101' --
AND TranDesc = 'ENVOLTURA DE PAPEL C/ TT CAFET' 
AND Module = 'IN' ORDER BY A.TranDesc ASC


 



 /************************* PARA REVISAR LAS 281101 DE CUSCO ******************************/

--'013538','013695' --54.7
select 'GL' Module,perpost,batnbr,REFNBR,acct,trantype,ROUND( sum(DRAmt)- sum(CrAmt),2) valor ,ROUND( sum(curyDRAmt)- sum(curyCrAmt)  ,2) valor2
from gltran G where acct like  ('281101%') and perpost  = '202001' and G.posted ='P' and batnbr in ('001362','001363')
--AND RefNbr  ='AI00000171' --and trandesc  ='CARNE MOLIDA'  
--and  module ='IN' --and batnbr ='012398'  --and
group by perpost,acct,batnbr,REFNBR,trantype


SELECT Acct, BatNbr, RefNbr, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, Posted, * 
FROM GLTran WHERE BatNbr = '001362' AND Module = 'IN' AND TranDesc = 'I250204'

SELECT Acct, BatNbr, RefNbr, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, Posted, * 
-- UPDATE GLTran SET CrAmt = case CrAmt when 0 then 0 else 108.52 end, CuryCrAmt = case CuryCrAmt when 0 then 0 else 108.52 end, DrAmt = case DrAmt when 0 then 0 else 108.52 end,	CuryDrAmt = case CuryDrAmt when 0 then 0 else 108.52 end
FROM GLTran WHERE BatNbr = '001363' AND Module = 'IN' AND TranDesc = 'HIERBA LUISA KG'

SELECT Descr, * FROM Inventory WHERE InvtID = 'I250204'

/**** ZUCULENTO ****/

SELECT InvtAcct, BatNbr, RefNbr, TranType, InvtID, TranAmt, * 
FROM INTran WHERE BatNbr = '001362'

SELECT TrnsfrDocNbr, * FROM TrnsfrDoc WHERE BatNbr = '001362'    

SELECT InvtAcct, BatNbr, RefNbr, TranType, InvtID, TranAmt, 
* FROM INTran WHERE RcptNbr = '000478'

/********************/

--I250196
--I293859
--I293860

SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, ToSiteID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost, TranAmt, TranType, Rlsed, LineNbr, LineRef, LineID, * 
-- UPDATE C SET TranAmt = ROUND(TranAmt,2) --, ExtCost = ROUND(ExtCost,2)
-- UPDATE C SET INVTACCT = '201101'
-- update C set ExtCost = case ExtCost when 0 then 0 else 0.129 end, TranAmt = case TranAmt when 0 then 0 else 0.129 end
-- UPDATE C SET LineRef = CASE WHEN LineID <= 9 THEN '0000'+CAST(LineID AS CHAR(1)) WHEN LineID > 9 THEN (CASE WHEN LineID > 99 THEN '00'+CAST(LineID AS CHAR(3)) ELSE '000'+CAST(LineID AS CHAR(2)) END) ELSE '' END
-- UPDATE C SET LineRef = CASE WHEN LineNbr <= 9 THEN '0000'+CAST(LineNbr AS CHAR(1)) WHEN LineNbr > 9 THEN '000'+CAST(LineNbr AS CHAR(2)) ELSE '' END
-- DELETE
-- delete TOP (4)
FROM INTran C WHERE BatNbr IN ('018158') --AND PerPost = '201908' --AND TranType = 'CT' 
--AND InvtAcct = '241101' --AND InvtID = 'I212231' AND tstamp <> 0x00000000A645D2F2
--AND LineNbr IN ('11')--,'11')
--AND InvtID = 'I250196' --AND InvtAcct = '241101'
--AND TranDesc = 'TOSTADAS CLASICAS             '
ORDER BY C.TranDesc --, C.InvtAcct ASC

SELECT  Acct, BatNbr, RefNbr, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineNbr, LineRef, Posted, Rlsed, *  
-- UPDATE A SET CrAmt = ROUND(CrAmt,2), CuryCrAmt = ROUND(CuryCrAmt,2)
-- UPDATE A SET CuryDrAmt = 1
-- UPDATE A SET ACCT = '201101'
-- UPDATE A SET CrAmt = 0, CuryCrAmt = 0
-- UPDATE A SET DrAmt = 0.7744, CuryDrAmt = 0.7744 
-- UPDATE A SET CrAmt = case CrAmt when 0 then 0 else 192.3 end, CuryCrAmt = case CuryCrAmt when 0 then 0 else 192.3 end, DrAmt = case DrAmt when 0 then 0 else 192.3 end,	CuryDrAmt = case CuryDrAmt when 0 then 0 else 192.3 end
-- DELETE
-- DELETE TOP (6)
FROM GLTran A WHERE BatNbr IN ('007802') --AND PerPost = '201908' --
--AND Acct = '261101' --
AND TranDesc like 'TOSTADAS CLASICAS             %' 
--AND LineNbr IN (9,10)
--AND Acct <> '711101'
AND Module = 'IN' 
ORDER BY A.TranDesc ASC



select InvtAcct, SiteID, InvtID, * from ItemSite where InvtID = 'I210906'

SELECT InvtAcct, InvtID, SiteID, LastCost, * FROM ItemSite WHERE InvtID = 'I250043                       '


    


SELECT * FROM Batch WHERE BatNbr = '012407' AND Module = 'IN'  --NO ESTA
SELECT * 
-- UPDATE Batch SET BalanceType = '', CrTot = 0, CtrlTot = 0, CuryCrTot = 0,CuryCtrlTot = 0, CuryDrTot = 0, DrTot = 0, GLPostOpt = '', LedgerID = '', LUpd_Prog = '10040', Rlsed = 1, Status = 'H', User1 = ''
FROM Batch WHERE BatNbr = '004414' AND Module = 'IN'  --YA ESTA


SELECT * FROM INTran WHERE BatNbr = '012407'
SELECT * 
-- UPDATE INTran  SET BMIMultDiv = '', BMIRate = 1, ExtCost = 0, Rlsed = 0, TranAmt = 0, UnitPrice = 0, User1 = ''
-- DELETE
FROM INTran WHERE BatNbr = '001362' and TranType = 'TR'
--AND TranType = 'CT'

SELECT * FROM GLTran WHERE BatNbr = '012407' AND Module = 'IN'



SELECT * FROM INTran WHERE BatNbr IN (SELECT S4Future11 FROM TrnsfrDoc WHERE BatNbr = '003517')

        

        
        
        
        
        






        
        
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
