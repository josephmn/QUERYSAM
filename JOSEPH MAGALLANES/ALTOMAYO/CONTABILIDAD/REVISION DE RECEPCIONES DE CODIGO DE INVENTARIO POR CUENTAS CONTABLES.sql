

SELECT Acct, InvtId, upper(TranDesc) TranDesc, SUM(Qty) QTY, AVG(UnitCost) UnitCost, UnitDescr 
FROM POTran WHERE ACCT LIKE '25%' --INVTID = '25002'
GROUP BY Acct, InvtId, TranDesc, UnitDescr 

