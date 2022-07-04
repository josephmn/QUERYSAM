
---BUENO
select*

  from SOShipTax  X where shipperid  ='FLI0004185'

--MALO
   select*
   -- UPDATE X SET CuryMerchTax = '1942.819', CuryMerchTxbl = '10793.44', CuryMerchTxblLessTax = '10793.44', CuryTotTax = '1942.819', CuryTotTxbl = '10793.44', MerchTax = '1942.82', MerchTxbl = '10793.44', MerchTxblLessTax = '10793.44',TotTax = '1942.819', TotTxbl = '10793.44'
  from SOShipTax  X where shipperid  ='FLI0004435'



SELECT INBatNbr,* FROM SOShipHeader WHERE InvcNbr = 'F010008445'
SELECT LineRef, InvtID, Descr, QtyShip, Cost, CuryCost, SlsPrice, CurySlsPrice, CuryTaxAmt00, CuryTotCost, CuryTotInvc, 
CuryTotMerch, CuryTxblAmt00, TaxAmt00, TotCost, TotInvc, TotMerch, TxblAmt00, user5, user7 
FROM SOShipLine WHERE ShipperID = 'FLI0004185'

SELECT INBatNbr,* 
-- update t set s4future11 = '0033'
FROM SOShipHeader t  WHERE InvcNbr = 'F010008690'
SELECT LineRef, InvtID, Descr, QtyShip, Cost, CuryCost, SlsPrice, CurySlsPrice, CuryTaxAmt00, CuryTotCost, CuryTotInvc, 
CuryTotMerch, CuryTxblAmt00, TaxAmt00, TotCost, TotInvc, TotMerch, TxblAmt00, user5, user7 
-- update SOShipLine set CuryCost = 0, SlsPrice = 0, CurySlsPrice = 0, CuryTaxAmt00 = 0, CuryTotCost = 0, CuryTotInvc = 0, CuryTotMerch = 0, CuryTxblAmt00 = 0, TaxAmt00 = 0, TotInvc = 0, TotMerch = 0, TxblAmt00 = 0, user5 = '0.5', user7 = '0033'
FROM SOShipLine WHERE ShipperID = 'FLI0004435' --and InvtID in ('21760','21760') and LineRef in ('00006','00007')


SELECT INBatNbr, ARBatNbr, InvcDate, TermsID, * 
FROM SOShipHeader WHERE InvcNbr = 'F010008445'
SELECT INBatNbr, ARBatNbr, InvcDate, TermsID, * 
-- UPDATE SOShipHeader SET BalDue = '12736.26', CuryBalDue = '12736.26', CuryTotInvc = '12736.26', CuryTotMerch = '10793.44', CuryTotTax = '1942.819', S4Future05 = '2', S4Future11 = '0034', TotCost = '5259.73', TotInvc = '12736.26', TotMerch = '10793.44', TotTax = '1942.82', User5 = '12736.27'
-- UPDATE SOShipHeader SET INBatNbr = '', ARBatNbr = '', invcdate = '2018-10-23'
FROM SOShipHeader WHERE InvcNbr = 'F010008690'

--select * 
--UPDATE SOShipLine SET
--Cost = '4.83', CuryCost = '4.83', SlsPrice = '10.16', CurySlsPrice = '10.16', 
--CuryTaxAmt00 = '1316.74', CuryTotCost = '3477.77', CuryTotInvc = '7315.2', CuryTotMerch = '7315.2', 
--CuryTxblAmt00 = '7315.2', TaxAmt00 = '1316.74', TotCost = '3477.77', TotInvc = '7315.2', TotMerch = '7315.2', TxblAmt00 = '7315.2', user5 = '10.16'
--FROM SOShipLine WHERE ShipperID = 'FLI0004435' and InvtID = '21795'
    
select * from SOShipHeader where InvcDate = '2018-10-23'




select * from INTran where BatNbr = '011519' and RefNbr = 'F010008445' and InvtID in ('21552','21760')
select * from INTran where BatNbr = '012486' and RefNbr = 'F010008690' and InvtID in ('21552','21760')




SELECT * FROM BATCH WHERE BATNBR = '010335' AND Module = 'AR'
SELECT * FROM ARDoc WHERE BATNBR = '010335'
SELECT * FROM ARDoc WHERE BATNBR = '009424' AND RefNbr = 'F010008445'

SELECT * FROM ARTran WHERE BatNbr = '010335' AND REFNBR = 'F010008690'
SELECT * 
-- UPDATE ARTran T SET 
FROM ARTran WHERE BatNbr = '009424' AND REFNBR = 'F010008445'

SELECT * FROM INTran WHERE BatNbr = '012637' AND RefNbr = 'F010008690'
SELECT * FROM GLTran WHERE BatNbr = '012637' AND RefNbr = 'F010008690' AND Module = 'IN'






--DELETE FROM BATCH WHERE BATNBR = '010334' AND Module = 'AR'
--DELETE FROM ARDoc WHERE BATNBR = '010334'
--DELETE FROM ARTran WHERE BatNbr = '010334' AND REFNBR = 'F010008690'
--DELETE FROM INTran WHERE BatNbr = '012637' AND RefNbr = 'F010008690'
--DELETE FROM GLTran WHERE BatNbr = '012637' AND RefNbr = 'F010008690' AND Module = 'IN'




SELECT LineRef, InvtID, Descr, QtyShip, Cost, CuryCost, SlsPrice, CurySlsPrice, CuryTaxAmt00, CuryTotCost, CuryTotInvc, 
CuryTotMerch, CuryTxblAmt00, TaxAmt00, TotCost, TotInvc, TotMerch, TxblAmt00, user5, user7 
FROM SOShipLine WHERE ShipperID = 'FLI0004185'

SELECT LineRef, InvtID, Descr, QtyShip, Cost, CuryCost, SlsPrice, CurySlsPrice, CuryTaxAmt00, CuryTotCost, CuryTotInvc, 
CuryTotMerch, CuryTxblAmt00, TaxAmt00, TotCost, TotInvc, TotMerch, TxblAmt00, user5, user7 
FROM SOShipLine WHERE ShipperID = 'FLI0004435'

SELECT *
FROM SOShipLine WHERE ShipperID = 'FLI0004185'

SELECT *
-- update t set taxcat = 'AFECTO'
FROM SOShipLine t WHERE ShipperID = 'FLI0004435'





















