

SELECT InvcNbr, InvcDate, CustID, BillName, BillAddr1, BillAddr2, ShipAddr1, ShipAddr2, ShipCustID, ShipName, ARBatNbr, INBatNbr, * 
-- update a set CustID = '20549853472', BillName = 'SERVICIOS E INVERSIONES PATZY S.R.L.',  BillAddr1 = 'SECTOR 08 GRUPO 01 MZ C LOTE12', BillAddr2 = '', ShipAddr1 = 'SECTOR 08 GRUPO 01 MZ C LOTE12', ShipAddr2 = '', ShipCustID = '20549853472', ShipName = 'SERVICIOS E INVERSIONES PATZY S.R.L.'
FROM SOShipHeader a WHERE ShipperID = 'FLI0002560'


SELECT * 
-- 
FROM SOShipTax WHERE ShipperID = 'FLI0002560'


select * 
-- update ARDoc set custid = '20549853472'
from ARDoc where BatNbr = '006659' and RefNbr = 'F010016899'

select * 
-- update ARTran set TranDesc = cast('20549853472 SERVICIOS E INVERSIONES PATZY' as char(30))
from ARTran where BatNbr = '006659' and RefNbr = 'F010016899' and Acct <> '401110    '

select id, TranDesc, * 
-- UPDATE GLTran SET id = '20549853472'
-- UPDATE GLTran SET TranDesc = cast('20549853472 SERVICIOS E INVERSIONES PATZY' as char(30))
from GLTran where BatNbr = '006659' and Module = 'AR' AND RefNbr = 'F010016899' and Acct <> '401110    '



SELECT id, * 
-- UPDATE INTran SET id = '2054985347'
FROM INTran WHERE BatNbr = '007443' AND RefNbr = 'F010016899'

SELECT * 

FROM GLTran WHERE BatNbr = '007443' AND Module = 'IN' AND RefNbr = 'F010016899'




select * 
-- update AR_Balances set CurrBal = 761.5
from AR_Balances where CustID = '20549853472'

select * 
-- update AR_Balances set CurrBal = 0
from AR_Balances where CustID = '20600819705'





