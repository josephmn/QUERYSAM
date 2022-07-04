SELECT A.InvcNbr, A.PerPost, A.CustID, C.Name, B.SiteID, B.InvtID, B.Descr, B.QtyShip, B.User5, (B.QtyShip * B.User5) TOTAL, A.SlsperID, D.Name
FROM SOShipHeader A
INNER JOIN SOShipLine B ON A.ShipperID = B.ShipperID
LEFT JOIN Customer C ON A.CustID = C.CustId
LEFT JOIN Salesperson D ON A.SlsperID = D.SlsperId
WHERE A.User3 = 'MUESTRA' AND A.PerPost >= '201901'

SELECT B.InvtID, B.Descr, SUM(B.QtyShip) QtyShip, SUM(B.QtyShip*B.User5) TotCost
FROM SOShipHeader A
INNER JOIN SOShipLine B ON A.ShipperID = B.ShipperID
WHERE A.User3 = 'MUESTRA' AND A.PerPost >= '201901'
GROUP BY B.InvtID, B.Descr