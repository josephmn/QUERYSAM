
select User8, * from SOShipHeader where PerPost = '201809' and User8 = '07'

SELECT s.user6, --S.SlsperId,
sum(c.TotCost) 'TotCost Prod',
SUM(c.CuryTaxAmt00) IGV,  SUM(c.CuryTotMerch) SubTotal,
--SUM(case when T.DocType = 'CM' then c.CuryTotMerch * -1 else c.CuryTotMerch end) SubTotal, 
(SUM(c.CuryTotMerch)*1.18) Total
--FROM (
--SELECT INBatNbr, ARBatNbr, ShipperID, SiteID, InvcNbr, InvcDate, PerPost, Cancelled, a.CustID, a.BillName, 
--CuryTotInvc, TotInvc, a.User5, CuryTotMerch, TotMerch, TotCost, CuryTotTax, TotTax 
FROM SOShipHeader a
inner join SOShipLine c on a.ShipperID = c.ShipperID
--left join ARDoc T on a.InvcNbr = T.RefNbr
inner join Salesperson s on a.SlsperID = s.SlsperId
--inner join Customer b on a.CustID = b.CustId and b.ClassId = 'AUT'
where a.perpost = '201809' --and a.SlsperID not in ('001','197')
AND Cancelled = 0 and s.User6 IN('CUPP','ARTA','CHNO','IQPU','PITU','TRCC') --and a.User8 <> '07'
AND InvcNbr <> ''
AND INBatNbr <> '' AND ARBatNbr <> ''
group by s.user6 --, S.SlsperId


SELECT QTYSHIP, INVTID, * FROM SOShipLine WHERE ShipperID IN (
SELECT ShipperID FROM SOShipHeader WHERE InvcNbr IN ('B050064371','B050064379')
)



-- 21751 ---> 36  --1568
-- 21753 ---> 12  --2070
-- 21009 ---> 24  --408


select * from Ventas where PerPost = '201809'



select SUM(TotCost) from SOShipLine where ShipperID in 
( select ShipperID from SOShipHeader where  PERPOST  ='201809'  and  SlsPerid ='514' and CustID in 
(
select CustID from Customer where ClassId  ='DIS'
))

