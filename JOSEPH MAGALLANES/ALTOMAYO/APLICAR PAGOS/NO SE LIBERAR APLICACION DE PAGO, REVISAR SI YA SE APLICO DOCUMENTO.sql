


select ShipperID, InvcNbr, InvcDate, Cancelled, ARBatNbr, INBatNbr, * from SOShipHeader A where PerPost = '201810' and User1 = 'S000002768' ORDER BY A.ARBatNbr ASC



--liberarar '011928'

select * 
-- UPDATE BATCH SET STATUS = 'B'
from Batch where BatNbr IN ('011928') and Module = 'AR'
SELECT * FROM ARDoc WHERE BatNbr IN ('011928')
select *
-- DELETE 
-- update artran set acct = '121301'
from ARTran where BatNbr IN ('011928')
select * from GLTran where BatNbr IN ('011928') and Module = 'AR'
SELECT * FROM ARAdjust WHERE AdjBatNbr = '011928'


select * from Batch where BatNbr IN ('011928') and Module = 'AR'
SELECT * FROM ARDoc WHERE BatNbr IN ('011928')
select * from ARTran where BatNbr IN ('011928')
select * from GLTran where BatNbr IN ('011928') and Module = 'AR'
SELECT * FROM ARAdjust WHERE AdjBatNbr = '011928'


select * 
-- UPDATE B SET STATUS = 'B', CrTot = 556.36,	CtrlTot= 556.36,	CuryCrTot= 556.36,	CuryCtrlTot= 556.36
from Batch B where BatNbr IN ('010537') and Module = 'AR'

SELECT * 
-- DELETE 
FROM ARDoc WHERE BatNbr IN ('010537') AND RefNbr = 'F050014083' AND BatSeq = 7


SELECT * 
-- DELETE 
FROM ARDoc WHERE RefNbr = 'B050060739'
     

select * 
-- DELETE
from ARTran where BatNbr IN ('010537') AND RecordID = '489414'



SELECT * 
-- delete
FROM RefNbr WHERE REFNBR IN (SELECT RefNbr FROM ARDoc WHERE BatNbr = '011928')

SELECT * 
-- delete
FROM WrkRelease

SELECT * 
-- delete
FROM WrkReleaseBad

SELECT CustID, * FROM SOShipHeader WHERE InvcNbr = 'F050014083'



-- LLenar_xAMVsDetAplicacion  'HUAPT',	16822


 --INSERT INTO xAMVsDetAplicacion       
 SELECT SOShipHeader.SlsperID as CodVendedor, SOShipHeader.CustID AS RUC, SOShipHeader.BillName AS NombClte, ARDoc.RefNbr AS Documento,       
        ARDoc.DocDate as FechaDoc, ARDoc.CuryOrigDocAmt as Monto, ARDoc.CuryDocBal as MontoAppl, ARDoc.CuryDocBal as Saldo ,       
        phedespacho.almacen, phedespacho.nrodespacho,       
        phedespacho.tipo as tipodespacho,ARDoc.BankAcct,ARDoc.BankSub,'',null      
 FROM         phedespacho INNER JOIN      
        xDespachoShippers ON phedespacho.nrodespacho = xDespachoShippers.NroDespacho AND       
        phedespacho.almacen = xDespachoShippers.user05 INNER JOIN      
        SOShipHeader ON xDespachoShippers.Shipperid = SOShipHeader.ShipperID INNER JOIN      
        ARDoc ON SOShipHeader.InvcNbr = ARDoc.RefNbr AND SOShipHeader.ARBatNbr = ARDoc.BatNbr      
 WHERE     (ARDoc.DocBal > 0.0) AND (ARDoc.Rlsed = 1) AND (SOShipHeader.TermsID = '01') and phedespacho.almacen = 'HUAPT'      


/*****************************************************/

 SELECT *

  FROM         phedespacho 
  INNER JOIN xDespachoShippers ON phedespacho.nrodespacho = xDespachoShippers.NroDespacho AND phedespacho.almacen = xDespachoShippers.user05 
  INNER JOIN SOShipHeader ON xDespachoShippers.Shipperid = SOShipHeader.ShipperID 
  INNER JOIN ARDoc ON SOShipHeader.InvcNbr = ARDoc.RefNbr AND SOShipHeader.ARBatNbr = ARDoc.BatNbr    
WHERE     (ARDoc.DocBal > 0.0) AND (ARDoc.Rlsed = 1) AND (SOShipHeader.TermsID = '01') and phedespacho.almacen = 'HUAPT'   


SELECT * FROM phedespacho WHERE nrodespacho = 'S000002768' AND almacen = 'HUAPT'
SELECT Shipperid, * FROM xDespachoShippers WHERE NroDespacho = 'S000002768' AND user05 = 'HUAPT'

SELECT ARBatNbr, TermsID, * FROM SOShipHeader WHERE ShipperID IN (SELECT Shipperid FROM xDespachoShippers WHERE NroDespacho = 'S000002768' AND user05 = 'HUAPT')

SELECT BatNbr, Rlsed, DocBal, * 
FROM ARDoc A WHERE RefNbr IN (SELECT InvcNbr FROM SOShipHeader WHERE ShipperID IN (SELECT Shipperid FROM xDespachoShippers WHERE NroDespacho = 'S000002768' AND user05 = 'HUAPT'))
ORDER BY A.BatNbr ASC






