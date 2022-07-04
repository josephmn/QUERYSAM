

--DMG_POReqHdr_POPrint  '000282',  '%' 

SELECT * FROM PurchOrd WHERE PONbr = '000079'

SELECT InvtID, TranDesc, * FROM PurOrdDet WHERE PONbr = '000079'

 SELECT *  
 FROM POReqHdr where PONbr = '000079'

 SELECT LINEREF, InvtID, Descr, *  
 -- update t set invtid = 'M261034', Descr = 'CALBEZA INTERRUPTOR DE LIMITE - ROLDANA  TELEMECANIQUE', siteid = 'CIXSUMIN'
 -- update t set Descr = 'CINTA EMBALAJE GRANDE TRANSPARENTE'
 FROM POreqDet t where ReqNbr = '000079' --AND InvtID = 'M268023' -- and SeqNbr = '0007'
 ORDER BY T.LineRef ASC


SELECT * FROM Purchord where ponbr = '000003'

select INVTID, TRANDESC, * 
-- UPDATE S SET INVTID = 'M261034', TRANDESC = 'CALBEZA INTERRUPTOR DE LIMITE - ROLDANA  TELEMECANIQUE', SITEID = 'CIXSUMIN'
-- UPDATE S SET TRANDESC = 'CINTA EMBALAJE GRANDE TRANSPARENTE' --, SITEID = 'CIXSUMIN'
from PurOrdDet S where PONbr = '000004' AND InvtID = 'M268023' --AND LineID = 7

/***** VER RECEPCION POR OC *******/

SELECT * 
-- UPDATE POReceipt SET 
FROM POReceipt WHERE PONbr = '000435'  --000140

SELECT InvtId, TranDesc, * 
-- UPDATE POTran SET TRANDESC = 'ESCOBILLA COPA 4" DE ACERO'
FROM POTran WHERE BatNbr = '000435' AND InvtId = 'M268043'

/************************************/

SELECT * FROM POReceipt where PONbr = '000435'

SELECT * FROM POTran WHERE PONbr = '000435'





SELECT CrTot, CtrlTot, CuryCrTot, CuryCtrlTot, * 
-- update b set CrTot = '7736.15', CtrlTot = '7736.15', CuryCrTot = '7736.15', CuryCtrlTot = '7736.15'
FROM Batch b where batnbr = '009206'

SELECT CuryRcptAmtTot, CuryRcptCtrlAmt, RcptAmtTot, RcptCtrlAmt, * 
-- update t set CuryRcptAmtTot = '7736.15', CuryRcptCtrlAmt = '7736.15', RcptAmtTot = '7736.15', RcptCtrlAmt = '7736.15'
FROM POReceipt t where RcptNbr = '000468'

SELECT InvtId, RcptNbr, Qty, CuryUnitCost, UnitCost, CuryExtCost, ExtCost, * 
-- update P set CuryUnitCost = '0.5286060', UnitCost = '0.5286060'
-- UPDATE P SET CuryExtCost = ROUND((UnitCost*Qty),2), ExtCost = ROUND((UnitCost*Qty),2)
FROM POTran P WHERE RcptNbr = '000468'

--select * from INTran where BatNbr = '009206'

SELECT InvtID, Qty, UnitPrice, ExtCost, TranAmt, * 
-- UPDATE A SET UnitPrice = '0.5286060'
-- UPDATE A SET ExtCost = ROUND((UnitPrice*Qty),2), TranAmt = ROUND((UnitPrice*Qty),2)
FROM INTran A WHERE RcptNbr = '009206' and InvtID = '25205'


SELECT CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, * 
-- update g set CrAmt = (case when CrAmt = 0 then 0 else 6343.27 end), CuryCrAmt = (case when CuryCrAmt = 0 then 0 else 6343.27 end), DrAmt = (case when DrAmt = 0 then 0 else 6343.27 end), CuryDrAmt = (case when CuryDrAmt = 0 then 0 else 6343.27 end)
FROM GLTran g where RefNbr = '000468' and BatNbr = '000476' and LineRef in (1,2)


SELECT CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, * 
-- update g set CrAmt = (case when CrAmt = 0 then 0 else 1392.88 end), CuryCrAmt = (case when CuryCrAmt = 0 then 0 else 1392.88 end), DrAmt = (case when DrAmt = 0 then 0 else 1392.88 end), CuryDrAmt = (case when CuryDrAmt = 0 then 0 else 1392.88 end)
FROM GLTran g where RefNbr = '000468' and BatNbr = '000476' and LineRef in (3,4)




SELECT InvtID, Qty, UnitPrice, ExtCost, TranAmt, * 
FROM INTran A WHERE BatNbr = '012584'

SELECT *
FROM GLTran A WHERE BatNbr = '012584'



