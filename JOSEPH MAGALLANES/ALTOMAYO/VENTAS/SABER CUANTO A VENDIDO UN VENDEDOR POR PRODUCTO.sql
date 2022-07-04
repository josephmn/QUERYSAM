-- 1.- PRIMERO
/********* POR CODIGOS DE VENDEDORES, PRODUCTO Y FECHA ESTABLECIDAS **********/


SELECT *, 'Desde el 15-05-2018 al 30-06-2018' FECHA FROM (
SELECT SI.SlsperID CODIGO_VEND, SL.Name NOMBRE_APELLIDOS, SUM(SI.QtyShip) CANTIDAD_21795, 
(
SELECT COUNT(*) FROM (
SELECT DISTINCT SHIP.CustID, SHIP.SlsperID FROM SOShipHeader SHIP INNER JOIN SOShipLine LINE ON SHIP.ShipperID = LINE.ShipperID WHERE SHIP.SlsperID in ('157','544','656','706','707','738')
and ship.Invcdate > = '2018-05-15' and ship.InvcDate < = '2018-06-30'
) X where X.SlsperID = SI.SlsperID)

PUNTO_VENTA FROM SOShipHeader SO
INNER JOIN SOShipLine SI ON SO.ShipperID = SI.ShipperID
INNER JOIN Salesperson SL ON SL.SlsperId = SI.SlsperID
WHERE SO.SlsperID IN ('157','544','656','706','707','738')

AND PerPost IN ('201805','201806') AND SI.InvtID = '21795' AND SO.InvcDate > = '2018-05-15' AND SO.InvcDate < = '2018-06-30' AND InvcNbr <> '' AND SO.Cancelled = 0 
GROUP BY SI.SlsperID, SL.Name
--ORDER BY SO.InvcDate ASC
) X ORDER BY CANTIDAD_21795 DESC



select so.ShipperID, so.InvcNbr, so.InvcDate, so.PerPost, so.SiteID, si.InvtID, si.QtyShip, so.BillZip, so.CustID, so.BillName from SOShipHeader so
inner join SOShipLine si on so.ShipperID = si.ShipperID
where so.SlsperID = '544' and so.InvcDate >= '2018-05-15' and so.InvcDate <= '2018-06-30' and so.Cancelled = 0 and si.InvtID = '21795'
order by so.InvcDate asc


SELECT COUNT(*) FROM (
SELECT DISTINCT SHIP.CustID, SHIP.SlsperID FROM SOShipHeader SHIP INNER JOIN SOShipLine LINE ON SHIP.ShipperID = LINE.ShipperID WHERE SHIP.SlsperID = '544'
and ship.Invcdate > = '2018-05-15' and ship.InvcDate < = '2018-06-30'
) X 


-- 2.- SEGUNDO
/********* POR CODIGOS DE VENDEDORES, FECHA Y CANTIDADES **********/

SELECT *, 'Desde el 15-05-2018 a la fecha' FECHA FROM (
SELECT SI.SlsperID CODIGO_VEND, SL.Name NOMBRE_APELLIDOS, /*SUM(SI.QtyShip) CANTIDAD_21795,*/ COUNT(*) PUNTO_VENTA, SUM(SI.TotInvc) TOTAL_VENTA FROM SOShipHeader SO
INNER JOIN SOShipLine SI ON SO.ShipperID = SI.ShipperID
INNER JOIN Salesperson SL ON SL.SlsperId = SI.SlsperID
WHERE SO.SlsperID IN (
--'157',
--'544',
--'656',
--'706',
--'707',
--'738'
'006',
'699',
'700',
'701',
'702',
'703',
'705'
)
AND PerPost IN ('201805','201806','201807') /*AND SI.InvtID = '21795'*/ AND SO.InvcDate > = '2018-05-15' AND SO.InvcDate < ='2018-06-30' AND InvcNbr <> '' AND SO.Cancelled = 0 
GROUP BY SI.SlsperID, SL.Name
--ORDER BY SO.InvcDate ASC
) X ORDER BY CODIGO_VEND ASC

