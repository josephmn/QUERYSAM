
/************** PARA DOLARES ******************/
 
SELECT CrTot, CtrlTot, DrTot, CuryCrTot, CuryCtrlTot, CuryDrTot, CuryRate, module, PerPost, Status, CuryRateType
-- update t set CrTot = 2454, CtrlTot = 2454, DrTot = 2454
-- update t set Status = 'P'
FROM Batch t where BatNbr = '007214' and Module = 'AR'

SELECT BankAcct, CuryOrigDocAmt, CuryRate, OrigDocAmt, DocType, PerPost, Status, DocDate
-- update t set CuryOrigDocAmt = '3000', OrigDocAmt = '9816'
FROM ARDoc t where BatNbr = '007214'

SELECT acct, CuryId, InvtId, CuryExtCost, CuryRate, CuryTranAmt, CuryUnitPrice, ExtCost, Qty, TaxCat, TranAmt, UnitPrice, TranType, PerPost, TranDate
-- update t set CuryTranAmt = round((QTY * CuryUnitPrice),2), TranAmt = round((QTY * (CuryUnitPrice*CuryRate)),2)
-- update t set CuryTranAmt = '3000', TranAmt = '9816'
-- update t set qty = qty * -1
FROM ARTran t where BatNbr = '007214' --and CuryUnitPrice = 0


SELECT CrTot, CtrlTot, DrTot, CuryCrTot, CuryCtrlTot, CuryDrTot, CuryRate, module, PerPost, Status, CuryRateType FROM AM2017APP..Batch where BatNbr = '010984' and Module = 'AR'

SELECT BankAcct, CuryOrigDocAmt, CuryRate, OrigDocAmt, DocType, PerPost, Status, DocDate FROM AM2017APP..ARDoc where BatNbr = '010984'

SELECT acct, CuryId, InvtId, CuryExtCost, CuryRate, CuryTranAmt, CuryUnitPrice, ExtCost, Qty, TaxCat, TranAmt, UnitPrice, TranType, PerPost, TranDate FROM AM2017APP..ARTran where BatNbr = '010984'


/********************* PARA SOLES *************************/

SELECT CrTot, CtrlTot, DrTot, CuryCrTot, CuryCtrlTot, CuryDrTot, CuryRate, module, PerPost, Status, CuryRateType
-- update t set CrTot = 2454, CtrlTot = 2454, DrTot = 2454
-- update t set Status = 'P'
FROM Batch t where BatNbr = '007214' and Module = 'AR'

SELECT BankAcct, CuryOrigDocAmt, CuryRate, OrigDocAmt, DocType, PerPost, Status, DocDate
-- update t set CuryOrigDocAmt = '8844.48', OrigDocAmt = '8844.48'
FROM ARDoc t where BatNbr = '007214'

SELECT acct, CuryId, InvtId, CuryExtCost, CuryRate, CuryTranAmt, CuryUnitPrice, ExtCost, Qty, TaxCat, TranAmt, UnitPrice, TranType, PerPost, TranDate
-- update t set CuryTranAmt = round((QTY * CuryUnitPrice),2), TranAmt = round((QTY * (CuryUnitPrice*CuryRate)),2)
-- update t set CuryTranAmt = '8844.48', TranAmt = '8844.48'
-- update t set qty = qty * -1
FROM ARTran t where BatNbr = '007214' --and CuryUnitPrice = 0


SELECT * --CrTot, CtrlTot, DrTot, CuryCrTot, CuryCtrlTot, CuryDrTot, CuryRate, module, PerPost, Status, CuryRateType
FROM AM2017APP..Batch where BatNbr = '003540' and Module = 'AR'

SELECT * --BankAcct, CuryOrigDocAmt, CuryRate, OrigDocAmt, DocType, PerPost, Status, DocDate 
FROM AM2017APP..ARDoc where BatNbr = '003540'

SELECT * --acct, BatNbr, CuryId, InvtId, CuryExtCost, CuryRate, CuryTranAmt, CuryUnitPrice, ExtCost, Qty, TaxCat, TranAmt, UnitPrice, TranType, PerPost, TranDate 
FROM AM2017APP..ARTran where BatNbr = '003540'

--SELECT * FROM Batch 

--SELECT * FROM ARDoc 

--SELECT * FROM ARTran


