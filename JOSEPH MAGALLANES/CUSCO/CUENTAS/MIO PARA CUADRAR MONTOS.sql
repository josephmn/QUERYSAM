
--AI00000196     	28.75	32.65	3.90   batnbr = '007992'
--AI00000560     	0.85	3.82	2.97 batnbr = '026076'


----1
SELECT BatNbr, RefNbr, rlsed, PerPost, SiteID, ExtCost, InvtID, qty, UnitPrice, round(TranAmt,2) TranAmt, trantype, round(UnitPrice*qty,2) new, (round(UnitPrice*qty,2) -  round(TranAmt,2)) gg 
FROM INTRAN WHERE BatNbr = '026076' AND RefNbr = 'AI00000560'
SELECT BatNbr, RefNbr, PerPost, rlsed, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, qty, Trandesc, TranType  FROM GLTran WHERE BatNbr = '026076' AND RefNbr = 'AI00000560'


----2
SELECT BatNbr, RefNbr, rlsed, PerPost, SiteID, ExtCost, InvtID, qty, UnitPrice, round(TranAmt,2) TranAmt, trantype, round(UnitPrice*qty,2) new, (round(UnitPrice*qty,2) -  round(TranAmt,2)) gg 
FROM INTRAN WHERE BatNbr = '007992' AND RefNbr = 'AI00000196'
SELECT BatNbr, RefNbr, PerPost, rlsed, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, qty, Trandesc, TranType  FROM GLTran WHERE BatNbr = '007992' AND RefNbr = 'AI00000196'

--- LOTES
SELECT DISTINCT InvtID FROM INTRAN WHERE BatNbr = '007992' AND RefNbr = 'AI00000196'


--select 'AM'TIPO, PerPost ,TranType ,round( suM(valor) ,2)Monto from (
--select perpost,batnbr,REFNBR,invtid,(case when  trantype  ='CM' THEN 'IN' ELSE TranType END)TranType ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') 
--then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor        
--from intran where invtacct like '201101%' and rlsed =1  AND perpost ='201803' AND InvtID  ='I212288' AND SiteID  ='CFCENTRAL' --@Perpost
--group by batnbr,REFNBR,invtid,perpost,trantype 
--)x where valor <>0  group by PerPost ,TranType
--UNION ALL
--select 'HIST'TIPO,'201803'perpost ,'IN'TRANTYPE,PTDCOGS02 * -1 Monto  FROM ItemHist where SiteID  ='CFCENTRAL' AND InvtID  ='I212288' AND FiscYr  ='2018' UNION ALL
--select 'HIST'TIPO,'201803'perpost ,'TR'TRANTYPE,(PTDCostTrsfrIn02 - PTDCostTrsfrOut02) Monto FROM ItemHist where SiteID  ='CFCENTRAL' AND InvtID  ='I212288' AND FiscYr  ='2018' UNION ALL
--select 'HIST'TIPO,'201803'perpost ,'AJ'TRANTYPE,(PTDCostAdjd02) Monto FROM ItemHist where SiteID  ='CFCENTRAL' AND InvtID  ='I212288' AND FiscYr  ='2018'

--select 'AM'TIPO, PerPost ,TranType ,round( suM(valor) ,2)Monto from (
--select perpost,batnbr,REFNBR,invtid,(case when  trantype  ='CM' THEN 'IN' ELSE TranType END)TranType ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor        
--from intran where invtacct like '201101%' and   rlsed =1  AND perpost   ='201806' AND InvtID  ='I250182' AND SiteID  ='CFCUSCO2' --@Perpost
--group by batnbr,REFNBR,invtid,perpost,trantype 
--)x where valor <>0  group by PerPost ,TranType
--UNION ALL
--select 'HIST'TIPO,'201806'perpost ,'IN'TRANTYPE,PTDCOGS05 * -1 Monto  FROM ItemHist where SiteID  ='CFCUSCO2' AND InvtID  ='I250182' AND FiscYr  ='2018' UNION ALL
--select 'HIST'TIPO,'201806'perpost ,'TR'TRANTYPE,(PTDCostTrsfrIn05 - PTDCostTrsfrOut05) Monto FROM ItemHist where SiteID  ='CFCUSCO2' AND InvtID  ='I250182' AND FiscYr  ='2018' UNION ALL
--select 'HIST'TIPO,'201806'perpost ,'AJ'TRANTYPE,(PTDCostAdjd05) Monto FROM ItemHist where SiteID  ='CFCUSCO2' AND InvtID  ='I250182' AND FiscYr  ='2018'

                                       
     SELECT * FROM ItemHist WHERE SiteID = 'CFCUSCO1'
	 select LTRIM(RTRIM(Descr)), InvtID,* from Inventory where InvtID = 'I210731'

	 
	 select PTDCOGS02,*  
	 --UPDATE Y SET PTDCOGS02 = -3.56
	 FROM ItemHist Y where SiteID  ='CFCENTRAL' AND InvtID  ='I212288' AND FiscYr  ='2018'

	 select PTDCostAdjd05,* 
	 -- UPDATE Y SET PTDCostAdjd05 = 4.82
	 FROM ItemHist Y where SiteID  ='CFCUSCO2' AND InvtID  ='I250048' AND FiscYr  ='2018'



SELECT * FROM GLTran WHERE BatNbr = '' AND PerPost = '201807'

SELECT BatNbr, RefNbr, * FROM GLTran WHERE Module = 'PO' AND PerPost = '201807' AND TranDate = '2018-07-24'


SELECT * FROM GLTran WHERE MODULE = 'GL' AND BatNbr = '001025'


SELECT BatNbr, REFNBR, MODULE, TranDesc, acct, PerPost, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, Qty ,* FROM GLTran WHERE RefNbr LIKE '%1025' AND PerPost = '201807'

--SELECT * FROM GLTran WHERE BatNbr = '001064'

select * from PurchOrd where PONbr = '001025'

SELECT 
QtyOrd, QtyRcvd, CuryUnitCost, UnitCost, --cantidad, cantidadrecibida, costounitario,costo unit
CostReceived, CuryCostReceived, --montos bases
CuryExtCost, ExtCost, --costos + IGV
InvtID, PurchUnit, TranDesc, LineID, * 
FROM PurOrdDet p where ponbr = '001025' 


select InvtId, TranDesc, * from POTran where PONbr = '001025' --= (select PONbr from PurchOrd where PONbr = '001025')


SELECT BatNbr, RefNbr, ExtCost, InvtID, UnitPrice,  Qty,TranAmt, (UnitPrice *Qty) ff, TranAmt - (UnitPrice *Qty) ,* 
-- update t set Rlsed = 1, BMIRate = 1, BMIMultDiv = 'M'
-- update t set  tranamt = (UnitPrice *Qty)
FROM INTran t WHERE BatNbr = '026076' --TranDesc IN (SELECT TranDesc FROM GLTran WHERE RefNbr = '001025' AND PerPost = '201807')
--SELECT BatNbr, REFNBR, MODULE, TranDesc, acct, PerPost, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, Qty ,* FROM GLTran WHERE RefNbr = '001025' AND PerPost = '201807'



SELECT BatNbr, RefNbr, ExtCost, InvtID, * FROM INTran WHERE BatNbr = '026076' --TranDesc IN (SELECT TranDesc FROM GLTran WHERE RefNbr = '001026' AND PerPost = '201807')
--SELECT BatNbr, REFNBR, MODULE, TranDesc, acct, PerPost, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, Qty ,* FROM GLTran WHERE RefNbr = '001026' AND PerPost = '201807'

--007992
--AI00000196

--201101
--I210402                       
--I210701                       

SELECT TranType, BatNbr, RefNbr, ExtCost, InvtID, Qty, TranDesc, * FROM INTran WHERE BatNbr = '026076'
--SELECT TranType, BatNbr, RefNbr, ExtCost, InvtID, TranDesc, * FROM INTran WHERE BatNbr = '008551'

--select distinct BatNbr  from intran where TranType = 'AJ' AND JrnlType = 'IN'  and PerPost = '201803' and RefNbr like 'AI%'

-----------------------------> enaqui

SELECT BatNbr, RefNbr, TranType, acct, ExtCost, InvtID, trandesc, UnitPrice,  Qty, ROUND(TranAmt,2) TranAmt , UnitPrice *Qty ff, TranAmt - (UnitPrice *Qty) P , (TranAmt - ExtCost) YY, * 
-- update t set Rlsed = 1, BMIRate = 1, BMIMultDiv = 'M'
-- update t set  tranamt = UnitPrice *Qty
-- update t set ExtCost = UnitPrice * Qty
FROM INTran t WHERE --BatNbr = '026076' and 
acct = '201101' and PerPost = '201807' AND PerEnt = '026076' and TranType = 'CT' --and RefNbr like '%AJUSTE%' AND TranAmt - 
AND (UnitPrice *Qty) > 0 --AND FiscYr = '2018'
 
SELECT BatNbr, acct, REFNBR, MODULE, TranDesc, acct, PerPost, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, Qty ,* FROM GLTran 
--where Module = 'GL'
WHERE BatNbr = '026076' -- and TranDesc = 'EMPANADA DE CARNE'



--and acct = '201101'
--AND PerPost = '201807'
--SELECT BatNbr, REFNBR, MODULE, TranDesc, acct, PerPost, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, Qty ,* FROM GLTran WHERE BatNbr = '008551' --AND PerPost = '201807'



SELECT BatNbr, REFNBR, MODULE, TranDesc, acct, PerPost, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, Qty ,* FROM GLTRAN WHERE RefNbr = 'AI00000196' AND 
BatNbr = '008482'
 --Acct IN ('201101') --,'261101','241101') 
 --AND PerPost = '201807'






 SELECT BatNbr, RefNbr, ExtCost, InvtID,  * 
-- update t set Rlsed = 1, BMIRate = 1, BMIMultDiv = 'M'
FROM INTran t WHERE BatNbr IN ( SELECT DISTINCT BatNbr FROM GLTRAN WHERE --RefNbr = 'AI00000196' AND BatNbr = '008482'
 Acct IN ('201101') --,'261101','241101') 
 AND PerPost = '201807' AND Module = 'PO') --'008482' 
 AND Rlsed <> 1