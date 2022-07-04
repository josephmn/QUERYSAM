

SELECT InvtAcct, PerPost, PerEnt, Rlsed, BatNbr, RefNbr, TranType, Qty, UnitPrice, * 
-- DELETE
FROM INTran WHERE BatNbr = '000254'

SELECT * FROM GLTran WHERE BatNbr = '000254'





ALTER PROC REG_ROUND_INTRAN_CAF
@BATNBR CHAR(6)
AS

SELECT InvtAcct, BatNbr, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost, TranAmt, TranType, LineID
-- UPDATE INTran SET QTY = 0.0025
-- UPDATE INTran SET ExtCost = CASE ExtCost WHEN 0 THEN 0 ELSE ROUND(UnitPrice * Qty,3) END, TranAmt = CASE TranAmt WHEN 0 THEN 0 ELSE ROUND(UnitPrice * Qty,3) END 
-- UPDATE INTran SET ExtCost = ROUND(ExtCost,2),  TranAmt = ROUND(TranAmt,2)
FROM INTran WHERE BatNbr = '000276' AND InvtMult <> 1 --AND InvtID = 'I250181'
AND InvtAcct IN ('251101') --,'251101') --ORDER BY InvtID ASC

SELECT A.acct, A.PerPost, A.TranDesc, A.Qty, A.CrAmt, A.CuryCrAmt, A.DrAmt, A.CuryDrAmt, A.TranType, A.LineRef, LineId
-- update GLTran SET QTY = 0.0015
-- UPDATE GLTran SET CrAmt = 0.013 , CuryCrAmt = 0.013
-- UPDATE GLTran SET ExtCost = ROUND(QTY * I.UnitPrice,2), A.TranAmt = ROUND(QTY * I.UnitPrice,2)
FROM GLTran A WHERE A.BatNbr = '000276' AND A.Module = 'IN' AND A.TranDesc <> 'Ensamble Cafeteria Nro:' --and TranDesc = 'I250181'
AND A.Acct IN ('251101') --,'251101')



EXEC REG_A_LA_MALA '003383'



alter PROC REG_A_LA_MALA
@BATNBR CHAR(6)
AS
---SET @BATNBR = '003101'

--SELECT InvtAcct, BatNbr, RcptNbr, TranDate, RefNbr, PerPost, SITEID, InvtID, TranDesc, QTY, UnitPrice, InvtMult, ExtCost, TranAmt, TranType, LineNbr, * 
--FROM INTran WHERE BatNbr = '000347' AND TranType = 'CT' AND TranDesc <> 'Ensamble Cafeteria Nro:       ' --and InvtAcct = '241101' --and RcptNbr = '' and TranDesc = 'EMP. AJI DE GALLINA           '

--SELECT acct, PerPost, TranDate, TranDesc, Qty,CrAmt, CuryCrAmt, DrAmt, CuryDrAmt, TranType, LineRef, LineNbr, * 
---- update GLTran set CrAmt = case Cramt when 0 then 0 else  end , CuryCrAmt= , DrAmt = , CuryDrAmt = 
--FROM GLTran WHERE BatNbr = '000347' --and Acct = '241101'
--AND Module = 'IN' AND TranDesc <> 'Ensamble Cafeteria Nro:       '

/*
UPDATE G SET
CrAmt = CASE CrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END, 
CuryCrAmt = CASE CuryCrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END, 
DrAmt = CASE DrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END, 
CuryDrAmt = CASE CuryDrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END
FROM INTran I inner join GLTran G on I.BatNbr = G.BatNbr and I.InvtID = G.TranDesc --and I.Qty = G.Qty
WHERE G.BatNbr = @BATNBR and G.Acct = '251101' AND G.TranDesc <> 'Ensamble Cafeteria Nro:       '
*/

UPDATE G SET
CrAmt = CASE CrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,3) END, 
CuryCrAmt = CASE CuryCrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,3) END, 
DrAmt = CASE DrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,3) END, 
CuryDrAmt = CASE CuryDrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,3) END
FROM INTran I inner join GLTran G on I.BatNbr = G.BatNbr and I.InvtID = G.TranDesc --and I.Qty = G.Qty
WHERE G.BatNbr = @BATNBR and G.Acct = '241101' AND G.TranDesc <> 'Ensamble Cafeteria Nro:       '

/*
UPDATE G SET
CrAmt = CASE CrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END, 
CuryCrAmt = CASE CuryCrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END, 
DrAmt = CASE DrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END, 
CuryDrAmt = CASE CuryDrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END
FROM INTran I inner join GLTran G on I.BatNbr = G.BatNbr and I.InvtID = G.TranDesc --and I.Qty = G.Qty
WHERE G.BatNbr = @BATNBR and G.Acct = '252401' AND G.TranDesc <> 'Ensamble Cafeteria Nro:       '

UPDATE G SET
CrAmt = CASE CrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END, 
CuryCrAmt = CASE CuryCrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END, 
DrAmt = CASE DrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END, 
CuryDrAmt = CASE CuryDrAmt WHEN 0 THEN 0 ELSE ROUND(I.UnitPrice * G.Qty,2) END
FROM INTran I inner join GLTran G on I.BatNbr = G.BatNbr and I.InvtID = G.TranDesc --and I.Qty = G.Qty
WHERE G.BatNbr = @BATNBR and G.Acct = '711101' AND G.TranDesc <> 'Ensamble Cafeteria Nro:       '
*/



