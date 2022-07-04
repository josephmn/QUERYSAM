
--5409.65 * tc=3.314--17,927.58

select ARBatNbr, INBatNbr, CustID, Cancelled, InvcNbr, BalDue, CuryBalDue, CuryID, CuryRate, CuryTotInvc, CuryTotMerch, TotCost, TotInvc, TotMerch, TotShipWght, User5 
-- update t set Baldue = 17927.58, CuryBalDue = 5409.65, CuryRate = 3.314, CuryTotInvc = 5409.65, CuryTotMerch = 5409.65, TotInvc = 17927.58, TotMerch = 17927.58
from SOShipHeader t where ShipperID = 'FLI0004232'


--select lineref, InvtID, descr, QtyShip, QtyPick, UnitDesc, User5, SlsPrice, Cost, CuryCost, CurySlsPrice, CuryTaxAmt00, CuryTotCost, CuryTotInvc, CuryTotMerch, CuryTxblAmt00, TaxAmt00, TotCost, TotInvc, TotMerch, TxblAmt00 
select lineref, InvtID, descr, QtyShip, QtyPick, UnitDesc, SlsPrice, CurySlsPrice, CuryTotInvc, CuryTotMerch, CuryTxblAmt00, TotInvc, TotMerch, TxblAmt00 
-- update so set CurySlsPrice = round(CurySlsPrice,2)
-- update so set SlsPrice = round((CurySlsPrice * 3.314),2), CuryTotInvc = round((CurySlsPrice*QtyShip),2), CuryTotMerch = round((CurySlsPrice*QtyShip),2), CuryTxblAmt00 = round((CurySlsPrice*QtyShip),2)
-- update so set TotInvc = round((CuryTotInvc*3.314),2), TotMerch = round((CuryTotInvc*3.314),2), TxblAmt00 = round((CuryTotInvc*3.314),2)
from SOShipLine so where ShipperID = 'FLI0004232'


SELECT BatNbr, RefNbr, CustId, CuryDocBal, CuryId, CuryOrigDocAmt, CuryRate, DocBal, OrigDocAmt 
-- update t set CuryDocBal = 5409.65, CuryOrigDocAmt = 5409.65, CuryRate = 3.314, DocBal = 17927.58, OrigDocAmt = 17927.58
FROM ARDoc t WHERE BatNbr = '009563'

--SELECT BatNbr, RefNbr, CustId, CuryId, Qty, CuryRate, UnitPrice, CuryUnitPrice, CuryExtCost, CuryTranAmt, ExtCost, TranAmt, UnitDesc
SELECT Acct, BatNbr, RefNbr, CustId, CuryId, InvtId, Qty, CuryRate, UnitPrice, CuryUnitPrice, CuryTranAmt, TranAmt, UnitDesc
-- update at set CuryUnitPrice = round((CuryUnitPrice),2), curyrate = 3.314
-- update at set UnitPrice = round((curyrate*CuryUnitPrice),2)
-- update at set CuryTranAmt = round((CuryUnitPrice*Qty),2)
-- update at set TranAmt = round((CuryTranAmt*curyrate),2)
FROM ARTran at WHERE BatNbr = '009563' and Acct = '701110'

SELECT Acct, BatNbr, RefNbr, CustId, InvtId, CuryId, Qty, CuryRate, UnitPrice, CuryUnitPrice, CuryTranAmt, TranAmt, UnitDesc
-- update at set curyrate = 3.314
-- update at set CuryTranAmt = (select round(sum(CuryTranAmt),2) from ARTran where batnbr = '009563' and acct <> '121301')
-- update at set TranAmt = round((CuryTranAmt * CuryRate),2)
FROM ARTran at WHERE BatNbr = '009563' and Acct = '121301'


select * 
-- update x set UnitPrice = CostoTRan
-- update x set TranAmt = round((Qty * UnitPrice),2)
from (
SELECT it.BatNbr, it.RefNbr, it.InvtID, it.ExtCost, it.Qty, it.TranAmt, it.UnitPrice, it.UnitDesc, it.TranType, 
(select UnitPrice from ARTran where RefNbr = 'F010008496' and InvtID = it.InvtID) CostoTRan
FROM INTran it 
where it.BatNbr = '011680' and it.TranType = 'IN' and it.RefNbr = 'F010008496'
) x


SELECT BatNbr, RefNbr, ExtCost, InvtID, Qty, TranAmt, UnitPrice, UnitDesc, TranType
FROM INTran where BatNbr = '011680' and TranType = 'CG'



SELECT * FROM GLTran where BatNbr = '011680'

select * from ARAdjust where AdjdRefNbr = 'F010008496'
select * from ARAdjust where AdjgRefNbr = 'F010008496'





