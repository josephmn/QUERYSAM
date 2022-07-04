-- B010001190

SELECT* FROM (
SELECT X.InvcNbr ,Y.RefNbr ,X.InvtID INVTIDSL ,Y.InvtID ,X.SUMA,Y.SUM_INTRAN  FROM (
select H.InvcNbr , InvtID, SUM(QtyShip) SUMA from SOShipLine D inner join SOShipHeader H ON d.ShipperID  = H.ShipperID AND PerPost  ='201806' AND Cancelled  = 0 /*AND h.InvcNbr ='B030035036     '*/
  GROUP BY H.InvcNbr , D.InvtID )X
  INNER JOIN 
  (
select RefNbr , InvtID, SUM(QTY) SUM_INTRAN from intran where PERPOST  ='201806' and TranType = 'IN'  /*and RefNbr  ='B030035036'*/ GROUP BY RefNbr , InvtID
)Y ON X.InvcNbr  = Y.RefNbr  AND X.InvtID   = Y.InvtID 
)Z WHERE SUMA <>SUM_INTRAN 

------- REVISAR FACTURAS ------

SELECT SHIPPERID, USER1, InvcDate, InvcNbr, ARBatNbr, INBatNbr, SiteID, * FROM SOShipHeader WHERE INVCNBR = 'F010006491'

SELECT qtyship, Invtid, Descr, USER7, SiteID, * FROM SOShipLine WHERE SHIPPERID = 'FLI0002140' and InvtID = '21767'


select RefNbr, InvtID, Qty, * from intran where batnbr = '005108' and refnbr = 'F010006491' and invtid = '21767'

SELECT * FROM GLTran WHERE RefNbr = 'F010006491' AND TranDesc = '21767'

----- REVISAR CAB-MOVI -----

SELECT * FROM CAB_MOVI WHERE ch_FecInici = '2018-06-09'


