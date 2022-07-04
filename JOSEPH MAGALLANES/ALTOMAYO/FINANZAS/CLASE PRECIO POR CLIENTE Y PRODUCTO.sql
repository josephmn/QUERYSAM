
--create view SlspricexCustomer
--as

select SlsPrcID1, No_Plan, Tipo_Precio, Metodo_Descuento, Articulo, Clase_Precio, isnull(p.Descr,'') 'Descripcion_ClassPrice', Ruc, 
c.Name 'Cliente_Nombre', Almacen, Cant_Minima, Cant_Max, UserCrea, 
UserModifica, FechaCrea, FechaModifica, SlsPrcID2, UM_Venta, Cant_Corte, Precio, Descuento, Fecha_Inicio, Fecha_Fin from (
SELECT SlsPrcID SlsPrcID1, CatalogNbr 'No_Plan', (CASE DiscPrcTyp WHEN 'S' THEN 'Estandar' ELSE 'Promocion' END) 'Tipo_Precio', 
(CASE DiscPrcMthd WHEN 'F' THEN 'Flat Price' ELSE 'Other' END) 'Metodo_Descuento', InvtID 'Articulo', CustClassID 'Clase_Precio', 
CustID 'Ruc', SiteID 'Almacen', MinQty 'Cant_Minima', MaxQty 'Cant_Max', Crtd_User 'UserCrea', LUpd_User 'UserModifica', 
Crtd_DateTime 'FechaCrea', LUpd_DateTime 'FechaModifica'
FROM SlsPrc --WHERE CustClassID = '0005' AND InvtID = '20632'
) x left join Customer c on x.Ruc = c.CustId left join PriceClass p on x.Clase_Precio = p.PriceClassID
inner join (
SELECT SlsPrcID SlsPrcID2, SlsUnit 'UM_Venta', QtyBreak 'Cant_Corte', DiscPrice 'Precio', DiscPct 'Descuento', StartDate 'Fecha_Inicio', EndDate 'Fecha_Fin' 
FROM SlsPrcDet --WHERE SlsPrcID IN (SELECT SlsPrcID FROM SlsPrc WHERE CustClassID = '0005' AND InvtID = '20632')
) y on x.SlsPrcID1 = y.SlsPrcID2 where SlsPrcID1 <> '' --and x.Cliente <> ''

--SELECT * FROM PriceClass WHERE 



SELECT SlsPrcID, * FROM SlsPrc WHERE InvtID = '21398' AND CustID = '20537321190'


SELECT * 
-- DELETE
FROM SlsPrcDet WHERE SlsPrcID IN (SELECT SlsPrcID FROM SlsPrc WHERE InvtID = '21753' AND CustID = '20537321190')

