
SELECT CuryTotMerch, CuryWholeOrdDisc, CuryTotTax, S4Future04, S4Future03, S4Future05, CuryTotInvc, CuryTotPmt, CuryBalDue, BalDue, TotInvc, TotTax, * 
-- UPDATE newSH SET CuryTotTax = round(CuryTotMerch * 0.18,3), TotTax = round(CuryTotMerch * 0.18,2)
-- UPDATE newSH SET CuryTotInvc = CuryTotMerch + round(CuryTotMerch * 0.18,2), CuryBalDue = CuryTotMerch + round(CuryTotMerch * 0.18,2), BalDue = CuryTotMerch + round(CuryTotMerch * 0.18,2), TotInvc = CuryTotMerch + round(CuryTotMerch * 0.18,2)
FROM newSH WHERE ShipperID = 'FLI0002747'

SELECT CuryTotMerch, CuryWholeOrdDisc, round(CuryTotMerch * 0.18,3) CuryTotTax, S4Future04, S4Future03, S4Future05, CuryTotInvc, CuryTotPmt, CuryBalDue, BalDue, TotInvc, round(CuryTotMerch * 0.18,2) TotTax, * 
FROM newSH WHERE ShipperID = 'FLI0002747'

SELECT CuryTotMerch, CuryWholeOrdDisc, CuryTotTax, S4Future04, S4Future03, S4Future05, CuryTotMerch + round(CuryTotMerch * 0.18,2) CuryTotInvc, CuryTotPmt, CuryTotMerch + round(CuryTotMerch * 0.18,2) CuryBalDue, CuryTotMerch + round(CuryTotMerch * 0.18,2) BalDue, CuryTotMerch + round(CuryTotMerch * 0.18,2) TotInvc, TotTax, * 
FROM newSH WHERE ShipperID = 'FLI0002747'

SELECT CuryTotMerch, CuryWholeOrdDisc, CuryTotTax, S4Future04, S4Future03, S4Future05, CuryTotInvc, CuryTotPmt, CuryBalDue, BalDue, TotInvc, TotTax, * 
FROM newSH WHERE ShipperID = 'FCH0001440'

--FCH0001440     -- BUENO
--FCH0001460     -- MALO


SELECT CuryTotMerch, CuryWholeOrdDisc, CuryTotTax, S4Future04, S4Future03, S4Future05, CuryTotInvc, CuryTotPmt, CuryBalDue, BalDue, TotInvc, TotTax, * 
-- UPDATE SOShipHeader SET CuryTotTax = round(CuryTotMerch * 0.18,3), TotTax = round(CuryTotMerch * 0.18,2)
-- UPDATE SOShipHeader SET CuryTotInvc = CuryTotMerch + round(CuryTotMerch * 0.18,2), CuryBalDue = CuryTotMerch + round(CuryTotMerch * 0.18,2), BalDue = CuryTotMerch + round(CuryTotMerch * 0.18,2), TotInvc = CuryTotMerch + round(CuryTotMerch * 0.18,2)
FROM SOShipHeader WHERE ShipperID = 'BDH0017273'

SELECT CuryTotMerch, CuryWholeOrdDisc, CuryTotTax, S4Future04, S4Future03, S4Future05, CuryTotInvc, CuryTotPmt, CuryBalDue, BalDue, TotInvc, TotTax, * 
FROM SOShipHeader WHERE ShipperID = 'BDH0017273'



SELECT * FROM SOShipTax WHERE ShipperID = 'FCH0003839'
SELECT * FROM SOShipTax WHERE ShipperID = 'FCH0001460'


SELECT * FROM newSTax WHERE ShipperID = 'FCH0001440'
SELECT * FROM newSTax WHERE ShipperID = 'FCH0001460'

SELECT ShipperID, * FROM SOShipHeader WHERE InvcNbr = 'F020000449'


