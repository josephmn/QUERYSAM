
SELECT * FROM ARAdjust WHERE AdjdRefNbr IN (SELECT REFNBR FROM ARDOC WHERE BatNbr = '003995')

SELECT Cancelled, InvcNbr, InvcDate, CuryBalDue, BalDue, round(TotInvc,2), * FROM SOShipHeader WHERE user1 = 'S000004750' and Cancelled = 0
SELECT Cancelled, InvcNbr, InvcDate, round(TotInvc,2), * FROM SOShipHeader  WHERE user1 = 'S000004750' and Cancelled = 1

select distinct arbatnbr from SOShipHeader where user1 = 'S000004750' and Cancelled = 0
select distinct arbatnbr from SOShipHeader where user1 = 'S000004750' and Cancelled = 1

SELECT RefNbr, OrigDocAmt, docbal, CuryDocBal, * FROM ARDOC where RefNbr in (select invcnbr from SOShipHeader where user1 = 'S000004554' and Cancelled = 0)

SELECT ARDOC.RefNbr, SOShipHeader.InvcNbr, ARDOC.BatNbr, ARDOC.CuryDocBal, ARDOC.DocBal, round(SOShipHeader.CuryBalDue,2) CuryBalDue, round(SOShipHeader.BalDue,2) BalDue FROM ARDOC 
inner join SOShipHeader on SOShipHeader.InvcNbr = ARDoc.RefNbr 
WHERE BatNbr = '003996' AND DocType = 'IN' order by RefNbr


S-4554 
SELECT RefNbr, * FROM ARTran WHERE BatNbr = '003910' AND TranType = 'IN'

SELECT RefNbr, PerEnt, PerPost, * FROM GLTran WHERE BatNbr = '003910' AND TranType = 'IN'

select AdjdRefNbr, * from ARAdjust where AdjdRefNbr in (SELECT RefNbr FROM ARDOC WHERE BatNbr = '003910' AND DocType = 'IN')

select AdjdRefNbr, * from ARAdjust where AdjdRefNbr in (SELECT RefNbr FROM ARDOC WHERE BatNbr = '003910' AND DocType = 'IN')

---- ANULADO
--003942

---- ACEPADOS
--003995
--003996
--003997
--003999























