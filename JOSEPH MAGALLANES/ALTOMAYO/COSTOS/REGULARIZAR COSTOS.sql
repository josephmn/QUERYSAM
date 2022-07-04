

SELECT QtyOnHand, InvtID, SiteID 
-- UPDATE L SET QtyOnHand = 0
FROM Location L WHERE InvtID = '21039' --AND SiteID = 'CIXPROD'

SELECT AvgCost, LastCost, QtyAvail, QtyOnHand, TotCost, InvtID, SiteID 
-- UPDATE T SET AVGCOST = '3.367613' ---,  TOTCOST = 0 , lastcost = '3.34118' --, QtyAvail = 0, QtyOnHand =0
FROM ItemSite T WHERE InvtID = '21039'-- and SiteID = 'CIXPT'


--008393 030-021119
--008435 030-021124

--008539 37586
--008671 37609

--008750 B030038685
--009099 F030016277


/************** PARA TRANSFERENCIA Y RECEPCION DE TRANSFERENCIA *******************/

SELECT InvtID, TranDesc, ExtCost, QTY, TranAmt, UnitPrice, round((3.341189*Qty),2) UnitPrice2, TranType, * 
-- UPDATE T SET TRANAMT = round((UnitPrice*Qty),2)
-- UPDATE T SET UnitPrice = '3.34118'
-- UPDATE T SET ExtCost = round((UnitPrice*Qty),2)
FROM INTran T WHERE BatNbr = '008671' AND InvtID = '21039' --and TranType = 'TR'



SELECT trandesc, qty, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * FROM GLTran WHERE BatNbr = '008671' AND TranDesc = '21039'



SELECT trandesc, qty, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * 
-- UPDATE T SET DrAmt = '4510.59', CuryDrAmt = '4510.59'
FROM GLTran T WHERE BatNbr = '008671' AND TranDesc = '21039' AND LineNbr = '00005'

SELECT trandesc, qty, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * 
-- UPDATE T SET CrAmt = '4510.59', CuryCrAmt = '4510.59'
FROM GLTran T WHERE BatNbr = '008671' AND TranDesc = '21039' AND LineNbr = '00006'


/******************** PARA VENTA *********************************************************/

SELECT InvtID, TranDesc, ExtCost, QTY, TranAmt, UnitPrice, round((3.341189*Qty),2) UnitPrice2, TranType, * 
-- UPDATE T SET TRANAMT = round((UnitPrice*Qty),2)
-- UPDATE T SET UnitPrice = '3.34118'
-- UPDATE T SET ExtCost = 3.34
FROM INTran T WHERE BatNbr = '009099' AND InvtID = '21039' and TranType = 'IN'


SELECT trandesc, qty, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * FROM GLTran WHERE BatNbr = '009099' AND TranDesc = '21039'


SELECT trandesc, qty, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * 
-- UPDATE T SET DrAmt = '3.34', CuryDrAmt = '3.34'
FROM GLTran T WHERE BatNbr = '009099' AND TranDesc = '21039' AND LineNbr = '00063'

SELECT trandesc, qty, CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, * 
-- UPDATE T SET CrAmt = '3.34', CuryCrAmt = '3.34'
FROM GLTran T WHERE BatNbr = '009099' AND TranDesc = '21039' AND LineNbr = '00064'


