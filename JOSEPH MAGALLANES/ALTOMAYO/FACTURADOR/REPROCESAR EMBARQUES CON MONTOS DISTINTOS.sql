--F020000237

--- reprocesar embarques cuando no pasan con montos correctos

SELECT ARBatNbr, INBatNbr, InvcDate, Cancelled, AdminHold, SlsperID, ShipperID, USER1, PerPost, * FROM SOShipHeader WHERE InvcNbr = 'F010006546'

SELECT InvtID, QtyShip, CuryCost, UnitDesc, * FROM SOShipLine WHERE SHIPPERID = 'FLI0002197'

SELECT InvtID, Qty, RefNbr, Rlsed, UnitPrice, TranAmt, user1, TranType, * FROM INTran WHERE BatNbr = '005322' AND RefNbr = 'F010006546' --AND InvtID = '21795'  

SELECT * FROM GLTran WHERE BatNbr = '005322' and RefNbr = 'F010006546' and module = 'IN'

-- ELIMINAR DATOS DE GLTRAN E INTRAN
select *
-- delete 
from INTran WHERE BatNbr = '005322' AND RefNbr = 'F010006546' and InvtID = '21795'

select *
-- delete
from GLTran WHERE BatNbr = '005322' and RefNbr = 'F010006546' and module = 'IN' and TranDesc = '21795'


--select  * from ardoc where refnbr  ='F010006546'


SELECT InvcDate, Cancelled, InvcNbr, INBatNbr, CuryMultDiv, user1, ShipperID, user2, * FROM SOShipHeader WHERE InvcNbr = 'F020000237'
SELECT InvtID, ShipperID, QtyShip, * from SOShipLine where ShipperID = 'CFLI000036'

SELECT InvtID, InvtMult, Qty, User1, * FROM INTran WHERE BatNbr = '005321' AND RefNbr = 'F020000237'


select * from sys.procedures where name like '%asp_%'

/*
ASP_INSERTAR_A_INTRAN

ASP_GENERAGLINTRAN

*/

SELECT UnitPrice, TranAmt, ExtCost, qty, Tranamt, UnitPrice, InvtID, RefNbr, Rlsed, UnitPrice, TranAmt, user1, TranType, InvtMult, * 
FROM INTran WHERE BatNbr = '005321' AND RefNbr = 'F020000237' --AND InvtID = '21795'  


SELECT UnitPrice, TranAmt, ExtCost, qty, Tranamt, UnitPrice, * FROM INTRAN 
WHERE PERPOST = '201805' AND TranType = 'CM'

--SELECT UnitPrice, * FROM INTran
--update INTran set TranAmt = TranAmt * -1, ExtCost = ExtCost *-1, qty = QTY*-1 --, --Tranamt = Tranamt * -1 -- UnitPrice
--WHERE BatNbr = '005321' AND RefNbr = 'F020000237' and TranType = 'CG'

