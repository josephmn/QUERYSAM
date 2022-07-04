
EXEC REGVENTAS_2018CAF '201904','CFCUSCO1'  -- > EJECUTAR PARA REGULARIZAR LAS VENTAS

SELECT * FROM RegCostoventa 


-- PARA ENSAMBLES
SELECT 'EXEC ACTU_COST_KIT '+''''+LTRIM(RTRIM(x.BatNbr))+''''+','+''''+LTRIM(RTRIM(x.InvtID))+''''+','+''''+bueno+'''' FROM (
SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, 
convert(varchar(10),(SELECT round(min(G.UnitPrice),2) UnitPrice FROM INTran G WHERE PerPost = '201903' AND TranType = 'AS' 
AND SiteID = 'CFCUSCO1' AND TranDesc <> 'Ensamble Cafeteria Nro:       '
and G.InvtID = A.InvtID)) Bueno, A.TranDate
FROM INTran A WHERE A.PerPost = '201904' AND A.TranType = 'AS' AND A.SiteID = 'CFCUSCO1' AND A.TranDesc <> 'Ensamble Cafeteria Nro:       ' and A.InvtID = 'I280003'
) X --where X.TranDate >= '2019-02-11'
--AND A.BatNbr = '038929'

-- PARA LOS AJUSTES 
select  'EXEC ACTU_COST_SI '+''''+LTRIM(RTRIM(BatNbr))+''''+','+''''+LTRIM(RTRIM(InvtID))+''''+','+''''+'2.5424'+'''', * 
from intran where invtid = 'I900418' AND PerPost = '202002' AND SiteID = 'CFCENTRAL' AND TranType = 'AJ'--- AND TranDate > = '2019-02-11'


--TRANSFERENCIA
SELECT 'EXEC ACTU_COST_TR '+''''+LTRIM(RTRIM(BatNbr))+''''+','+''''+LTRIM(RTRIM(InvtID))+''''+','+''''+'0.02'+'''', * 
from intran where invtid = 'I250096' AND PerPost = '201904' AND SiteID = 'CFCUSCO2' AND TranType = 'TR'



SELECT * FROM (
SELECT TOP 9999999 'EXEC ACTU_COST_SI '+''''+LTRIM(RTRIM(BatNbr))+''''+','+''''+LTRIM(RTRIM(InvtID))+''''+','+''''+bueno+'''' AS CAL FROM (

SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType, 
convert(varchar(10),(
SELECT round(min(G.UnitPrice),2) FROM INTran G WHERE PerPost = '201907' AND TranType = 'AS' AND SiteID = 'CFCUSCO1' AND TranDesc <> 'Ensamble Cafeteria Nro:       '
and G.InvtID = A.InvtID)) Bueno  
FROM INTran A WHERE A.PerPost = '201907' AND A.TranType = 'AJ' AND A.SiteID = 'CFCUSCO1' --AND A.TranDesc <> 'Ensamble Cafeteria Nro:       '
) X ORDER BY InvtID ASC
--AND A.BatNbr = '038929'
) Y WHERE CAL IS NOT NULL 


select distinct InvtID from INTran where TranType = 'AS' and PerPost = '201811' and TranDesc = 'Ensamble Cafeteria Nro:       ' 


/*
select InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType 
-- DELETE --top (1)
from INTran where BatNbr = '042468' --and invtid = 'I250191' and trantype = 'CT' and InvtAcct = '211101'
order by trantype desc, invtid asc

select count(TranDesc), TranDesc --acct, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef 
from GLTran where BatNbr = '042468'
group by TranDesc having COUNT(TranDesc) > 2

select acct, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef 
from GLTran where BatNbr = '042468' and TranDesc = 'BROWNIES DE DOBLE CHOCOLATE   '

delete from GLTran where BatNbr = '042470' and TranDesc = 'BROWNIES DE DOBLE CHOCOLATE   ' and LineRef in (
'00009',
'00010',
'00021',
'00022'
)

select invtacct, * from itemsite where siteid = 'cfcusco3' and invtid = (Select InvtID from Inventory where descr like '%BROWNIES DE DOBLE CHOCOLATE   %')

*/

/*

-----------------------------------------------------------------
-- PARA LIBRO DIARIO CUADRAR LOS MODULOS - SOLO REGULARIZAR IN --
-----------------------------------------------------------------


--select 'DRAMT'MOD, PerPost,BatNbr ,acct, DrAmt 
--from imporLibroDiario_xls x  where (Acct IS NOT NULL OR Start<>0) and perpost = '201901' AND module = 'INA' --and batnbr  ='000450' --and acct  ='121301'
--UNION ALL
--select 'CRAMT'MOD, PerPost,BatNbr ,acct, CrAmt 
--from imporLibroDiario_xls  where (Acct IS NOT NULL OR Start<>0) and perpost = '201901' AND module = 'INA' --and batnbr  ='000450'--and acct  ='121301'


--APA
--POA
--CAA
--GLA
--ARA
--INA


SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType 
-- UPDATE INTran SET TranAmt = ROUND(TranAmt,2)
-- DELETE
FROM INTran WHERE BatNbr = '004269' 
--AND InvtID = 'I300006'
AND TranType = 'CT' 
ORDER BY InvtID ASC

SELECT acct, PerPost, TranDesc, Qty, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef 
-- UPDATE GLTran SET CrAmt = (CASE WHEN CrAmt = 0 THEN 0 ELSE 3.3 END), CuryCrAmt = (CASE WHEN CuryCrAmt = 0 THEN CuryCrAmt ELSE 3.3 END), DrAmt = (CASE WHEN DrAmt = 0 THEN 0 ELSE 3.3 END), CuryDrAmt = (CASE WHEN CuryDrAmt = 0 THEN 0 ELSE 3.3 END)
-- UPDATE GLTRAN SET QTY = '4', CrAmt = '0.01', CuryCrAmt = '0.01'
-- UPDATE GLTran SET CrAmt = ROUND(CrAmt,2), CuryCrAmt = ROUND(CuryCrAmt,2)
-- update gltran set CrAmt = '0.02', CuryCrAmt = '0.02'
FROM GLTran WHERE BatNbr = '004269' AND Module = 'IN'
--AND TranDesc = 'I256066'
ORDER BY TranDesc ASC


select A.BatNbr, A.InvtID, A.TranAmt, B.TranDesc, B.CrAmt, B.CuryCrAmt, A.TranType, B.TranType
-- update B set  B.CrAmt = (CASE WHEN B.CrAmt = 0 THEN 0 ELSE A.TranAmt END), B.CuryCrAmt = (CASE WHEN B.CuryCrAmt = 0 THEN CuryCrAmt ELSE A.TranAmt END), B.DrAmt = (CASE WHEN B.DrAmt = 0 THEN 0 ELSE A.TranAmt END), B.CuryDrAmt = (CASE WHEN B.CuryDrAmt = 0 THEN 0 ELSE A.TranAmt END)
from (
select InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType from INTran where BatNbr = '004269' and TranType = 'CT'
) A INNER JOIN (SELECT acct, PerPost, TranDesc, Qty, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef  FROM GLTran WHERE BatNbr = '004269' AND Module = 'IN') B on A.InvtID = B.TranDesc



*/



SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType FROM INTran WHERE BatNbr = '042123' 
--AND InvtID = 'I250181'
--AND TranType = 'CT' ORDER BY InvtID ASC

SELECT acct, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef FROM GLTran WHERE BatNbr = '042123' 
--AND TranDesc = 'I250181'
--ORDER BY TranDesc ASC





SELECT X.InvtID, X.UnitPrice, X.TranAmt, Z.TranDesc, Z.CrAmt, z.CuryCrAmt, z.DrAmt, z.CuryDrAmt FROM (
SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType FROM INTran WHERE BatNbr = '039169' AND TranType = 'AS')X
LEFT JOIN (
SELECT acct, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef FROM GLTran WHERE BatNbr = '039169'-- AND TranType = ''
) Z ON X.InvtID = Z.TranDesc

EXEC ACTU_COST_KIT '039169','I250181', '152.615'


--015649


DECLARE @INVTID CHAR(6)

SET @INVTID = '042123'

SELECT A.InvtID, A.Qty, B.InvtID, B.Qty, B.UnitPrice, (B.Qty * B.UnitPrice)cal, A.TranAmt, B.TranAmt, A.UnitPrice, A.ExtCost, B.ExtCost, (ROUND(A.TranAmt,4) - ROUND(B.TranAmt,4)) DIFF
--UPDATE B SET B.QTY = A.QTY, B.TranAmt = ROUND(A.TranAmt,4)
FROM (
SELECT TOP 999999 InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType FROM INTran WHERE BatNbr = @INVTID 
--AND InvtID = 'I250181'
AND TranType = 'IN' /*AND TranDesc <> 'Ensamble Cafeteria Nro:       '*/ ORDER BY InvtID ASC
) A
LEFT JOIN (
SELECT TOP 999999 InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType FROM INTran WHERE BatNbr = @INVTID 
--AND InvtID = 'I250181'
AND TranType = 'CG' /*and TranDesc <> 'Ensamble Cafeteria Nro:       '*/ ORDER BY InvtID ASC
) B ON A.InvtID = B.InvtID


--SELECT *
---- DELETE 
--FROM INTran WHERE BatNbr = '040590' AND InvtID = 'I250017'
 

SELECT A.TranDesc, A.Qty, A.CrAmt, A.CuryCrAmt, A.DrAmt, A.CuryDrAmt, B.InvtID, B.TranAmt, B.Qty, (ROUND(A.CrAmt,4) - ROUND(B.TranAmt,4)) DIFF1 , (ROUND(A.CuryCrAmt,4) - ROUND(B.TranAmt,4)) DIFF2
--UPDATE A SET A.CrAmt = ROUND(B.TranAmt,4), A.CuryCrAmt = ROUND(B.TranAmt,4)
FROM (
(SELECT TOP 99999 * FROM GLTran WHERE BatNbr = @INVTID ORDER BY TranDesc) A
INNER JOIN (
SELECT TOP 999999 InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType FROM INTran WHERE BatNbr = @INVTID 
--AND InvtID = 'I250181'
AND TranType = 'CT' ORDER BY InvtID ASC) B ON A.TranDesc = B.InvtID
) --ORDER BY A.TranDesc

SELECT acct, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef 
--UPDATE GLTran SET DrAmt = (select SUM(CrAmt) from GLTRAN WHERE BatNbr = @INVTID and CrAmt <> 0) , CuryDrAmt = (select SUM(CrAmt) from GLTRAN WHERE BatNbr = @INVTID and CrAmt <> 0)
-- UPDATE GLTran SET DrAmt = 0 , CuryDrAmt = 0
FROM GLTRAN WHERE BatNbr = @INVTID AND TranDesc = 'Ensamble Cafeteria Nro:       '


SELECT ROUND(SUM(DrAmt),4) - ROUND(SUM(CrAmt),4) FROM GLTran WHERE BatNbr = '042123' AND Module = 'IN'

--SELECT DrAmt, CrAmt, TranDesc FROM GLTran WHERE BatNbr = '040443' AND Module = 'IN'





SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost,  TranAmt, TranType FROM INTran WHERE BatNbr = '042123' AND TranType = 'CG'

SELECT acct, PerPost, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef FROM GLTran WHERE BatNbr = '042123' 


