
SELECT Ventas."Producto", Inventory."Descr", SUM(Ventas."Expr1") Cantidad, --SUM(Ventas."Totinvcline") Soles, Ventas."ValorVta", 
SUM(CASE WHEN Ventas.ShipperID <> '' THEN Ventas.Totinvcline ELSE (CASE WHEN ventas.doctype = 'CM' THEN Ventas.ValorVta * -1 ELSE Ventas.ValorVta END) END) SOLES, --Ventas."TipoDoc", 
AVG(ItemSite."AvgCost") AvgCost
FROM
    { oj ("AM2020APP"."dbo"."Ventas" Ventas 
	LEFT OUTER JOIN "AM2020APP"."dbo"."ItemSite" ItemSite ON Ventas."Producto" = ItemSite."InvtID" AND Ventas."SiteID" = ItemSite."SiteID")
    LEFT OUTER JOIN "AM2020APP"."dbo"."Inventory" Inventory ON Ventas."Producto" = Inventory."InvtID"}
WHERE
    (Ventas."TipoDoc" = '01' OR
    Ventas."TipoDoc" = '03' OR
    Ventas."TipoDoc" = '07' OR
    Ventas."TipoDoc" = '08') --AND Ventas."Producto" = '21597'
GROUP BY Ventas."Producto", Inventory."Descr" --, Ventas."TipoDoc"


                




