
SELECT SUM(Expr1), WEIGHT, (SUM(Expr1)*WEIGHT)TOTAL, iNVTID FROM (
SELECT
    Ventas."ShipperID", Ventas."PerPost", Ventas."TipoDoc", Ventas."Expr1",
    Inventory."Descr", Inventory."InvtID", Inventory."MaterialType",
    InventoryADG."Weight"
FROM
    { oj (AM2019APP."dbo"."Ventas" Ventas LEFT OUTER JOIN AM2019APP."dbo"."Inventory" Inventory ON
        Ventas."Producto" = Inventory."InvtID") LEFT OUTER JOIN AM2019APP."dbo"."InventoryADG" InventoryADG ON
        Inventory."InvtID" = InventoryADG."InvtID"}
WHERE
 --   (Ventas."TipoDoc" = '08' OR Ventas."TipoDoc" = '07' OR Ventas."TipoDoc" = '03' OR Ventas."TipoDoc" = '01') 
	--AND 
	Ventas."PerPost" = '201907' AND Inventory."InvtID" = '21090' )X
GROUP BY WEIGHT, iNVTID 



select sum(Detalle_Cantidad), sum(Detalle_Prod_Peso), Detalle_Prod_Cod, Detalle_Prod_Name 
from OMRVentasViaSQL where Periodo = '201907' and Detalle_Prod_Cod = '21090'
group by Detalle_Prod_Cod, Detalle_Prod_Name 


