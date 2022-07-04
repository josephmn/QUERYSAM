
SELECT * FROM LotSerMst WHERE SiteID = 'CIXPT' AND InvtID = '20560'
SELECT * FROM Location  WHERE SiteID = 'CIXPT' AND InvtID = '20560'


--UPDATE LOCATION 
--SET qtyonhand = (select qtyonhand from itemsite where invtid = location.invtid and siteid=location.siteid)
--where   whseloc='BUENESTADO' AND round(qtyonhand,1) <> round((select qtyonhand from itemsite where invtid = location.invtid and siteid=location.siteid),1)

SELECT QtyOnHand, QtyShipNotInv, * 
-- UPDATE I SET QtyOnHand = '0'
FROM ItemSite I WHERE InvtID = '20560' AND CountStatus = 'A'

--20560 -- 150
--20605 -- 4