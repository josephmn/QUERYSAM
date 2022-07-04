
--001022 NOLIB
--001162 NOLIB

SELECT * 
-- DELETE
-- UPDATE Batch SET STATUS = 'B'
FROM Batch WHERE BatNbr IN ('007329','001171') AND Module = 'IN'

SELECT * 
-- DELETE
FROM INTran WHERE BatNbr IN ('007329','001171')

SELECT * 
-- DELETE
FROM GLTran WHERE BatNbr IN ('007329','001171')



SELECT * 
-- DELETE
-- UPDATE Batch SET STATUS = 'B'
FROM Batch WHERE BatNbr IN ('037925') AND Module = 'IN'

SELECT * 
-- DELETE
FROM INTran WHERE BatNbr IN ('037925')

SELECT * 
-- DELETE
FROM GLTran WHERE BatNbr IN ('037925')






--- PARA AJUSTE----
---- PARA PODER REALIZAR UN AJUSTE - COMO REGRESAR PARA QUE LIBERE CORRECTAMENTE (BATCH)

SELECT BalanceType, CrTot, CtrlTot, CuryCrTot, DrTot, GLPostOpt, LedgerID, LUpd_Prog, Rlsed, Status, User1 
-- UPDATE Batch SET BalanceType = '', CrTot = -7.42, CtrlTot = -7.42, CuryCrTot = 0, DrTot = -7.42, GLPostOpt = '', LedgerID = '', LUpd_Prog = '10030', Rlsed = 0, Status = 'H'--, User1 = 'CFCUZCO2000000001424J'
FROM batch WHERE BatNbr = '014917' and Module = 'IN'


---- PARA PODER REALIZAR UN AJUSTE - COMO REGRESAR PARA QUE LIBERE CORRECTAMENTE (INTRAN)
SELECT InvtID, RefNbr, Qty, BMIMultDiv, BMIRate, ExtCost, refnbr, rlsed, tranamt, unitprice 
-- UPDATE INTran SET BMIMultDiv = '', BMIRate = 0, ExtCost = -7.42, refnbr = 'PORSAL', rlsed = 0, TranAmt = -7.42
FROM INTran WHERE BatNbr = '014917' AND refnbr = 'PORSAL'


--- PARA QUITAR GLTRAN
SELECT * 
-- DELETE
FROM GLTRAN WHERE BatNbr = '037925' AND refnbr = 'EI00001059'

--UPDATE INTran
--SET BMIMultDiv = '', BMIRate = 0, ExtCost = '0.09', refnbr = 'EI00000082', rlsed = 0, tranamt = '0.09', unitprice = '0.005678' where batnbr = '007329'

--- PARA ENSAMBLES ----

SELECT * 
-- UPDATE BATCH SET STATUS = 'B'
-- UPDATE BATCH SET Rlsed = 0, Status = 'B'
FROM Batch WHERE BatNbr in ('037925') AND Module = 'IN'



SELECT * FROM INTRAN WHERE BatNbr in ('017017','021679')


SELECT * FROM GLTran WHERE BatNbr = '017017' AND Module = 'IN'





select * from POReceipt where batnbr = '019185'












