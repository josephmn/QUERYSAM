/*
SELECT * FROM [INV].[AjusteInventario] WHERE ID IN ('        000000000001','        000000000002')

--X IDLOCAL
SELECT CodigoProducto, Descripcion, Cantidad, CostoUnitario, CostoExtendido FROM [INV].DetalleAjusteInventario d
inner join GEN.Producto P on D.idproducto = P.id

WHERE IdAjusteInventario IN ('        000000000002')



