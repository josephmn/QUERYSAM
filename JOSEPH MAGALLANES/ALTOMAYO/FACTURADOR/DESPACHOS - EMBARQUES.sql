
-- GRUPO DE DESPACHO (GENERAR)
SELECT * FROM GrupoDespachoH WHERE NroGrpD IN ('000457')
SELECT * FROM GrupoDespachoD WHERE NroGrpD IN ('000457')

-- DESPACHO
SELECT * FROM PHeDespacho WHERE nrodespacho IN ('S000007928')
SELECT * FROM xAMDespEmbD WHERE nrodespachoD = 'S000007928'

-- SOSHIP CABECERA Y DETALLE ENBARQUES
SELECT * FROM SOShipHeader WHERE ShipperID = 'FLI0000786'
SELECT ShipperID, InvtID, QtyShip, * FROM SOShipLine WHERE ShipperID = 'FLI0000786'

--select sol.QtyShip, sol.InvtID, invt.User3, adg.user6 from SOShipLine sol
--INNER JOIN InventoryADG adg on sol.InvtID = adg.InvtID
--INNER JOIN Inventory invt on invt.InvtID = adg.InvtID
--where shipperId = 'BCH0004438'




--SELECT top 999999999 NroDespachoD, round(SUM(VolTotal),4) VOLDespacho FROM(

--SELECT top 999999999 NroDespachoD, InvtId, sum(VolFinal) VolTotal FROM (

--select NroDespachoD, InvtId, (x.qtyShip*VolxUni)VolFinal from (
--select embD.NroDespachoD, sol.shipperId, sol.QtyShip, sol.InvtID, invt.User3, adg.user6, (CASE WHEN (invt.User3) =0 THEN 0 ELSE (adg.user6/invt.User3) END) VolxUni from SOShipLine sol
--INNER JOIN InventoryADG adg on sol.InvtID = adg.InvtID
--INNER JOIN Inventory invt on invt.InvtID = adg.InvtID
--INNER join xAMDespEmbD embD on embD.ShipperID = sol.ShipperID
--where sol.shipperId IN (SELECT shipperId FROM xAMDespEmbD WHERE nrodespachoD IN (SELECT NroDespacho FROM GrupoDespachoD)) --WHERE NroGrpD IN ('000471')))
--)x
--)y
--group by NroDespachoD, InvtId
--)Z
--group by NroDespachoD


