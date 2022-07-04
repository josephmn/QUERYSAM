
--select *,isnull((select top 1 rtrim(batnbr)+' '+ (case when status in('R','C') then 'LIB' else 'NOLIB' end )  from poreceipt where POnbr in (select PONbr from PurchOrd where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(MovAsociado))) ) ),''),      
--isnull( (select PONbr from PurchOrd where   user1 collate Modern_Spanish_CI_AS = (rtrim(ltrim(MovAsociado))) ) ,'')              
--from SGRPAM2019.DBO.Vs_SolomonKardex where movimiento in('RECEPCION DE COMPRA')   --and idmovimiento not in ( 'CFCUZCO2000000000092','CFCUZCO2000000000435')   


select * from sys.tables where name like '%compra%'





SELECT idmovimiento, CantidadIngreso, CostoUnitario, CostoExtendido, CostoPromedio, CostoPromedioAnterior, * 
-- update [INV].[Kardex] set CantidadIngreso = 20, CostoUnitario = 0.25000000, CostoExtendido = 5.760000, CostoPromedio = 0.25000000, CostoPromedioAnterior = 0.25000000
FROM [INV].[Kardex] WHERE CORRELATIVO = '00000121' AND NUMERO = '0770010955' AND FechaNegocio = '2019-08-12'

SELECT id, BaseAfecta, Igv, TotalMN, TotalME, TipoCambio, * 
-- update gen.movimiento set BaseAfecta = 4.24000000, Igv = 0.76000000, TotalMN = 5.00000000, TotalME = 1.49925037, TipoCambio = 3.33500000
FROM gen.movimiento WHERE id = 'CFCUZCO1000000001249'

SELECT idmovimiento, Cantidad, CostoUnitario, CostoExtendido, Igv, CantidadAlmacen, CantidadSaldo, CostoUnitarioAlmacen, CostoExtendidoAlmacen, *
-- update GEN.DetalleMovimiento set Cantidad = 20.0000000, CostoUnitario = 0.21186440, CostoExtendido = 5.000000, Igv = 0.76000000, CantidadSaldo = 20.00000000, CostoUnitarioAlmacen = 0.21186440
FROM GEN.DetalleMovimiento WHERE IdMovimiento = 'CFCUZCO1000000001249'




SELECT idmovimiento, CantidadIngreso, CostoUnitario, CostoExtendido, CostoPromedio, CostoPromedioAnterior, * 
-- update [INV].[Kardex] set CantidadIngreso = 20, CostoUnitario = 0.25000000, CostoExtendido = 5.760000, CostoPromedio = 0.25000000, CostoPromedioAnterior = 0.25000000
FROM [INV].[Kardex] WHERE CORRELATIVO = '00000121' AND NUMERO = '0770010955' AND FechaNegocio = '2019-08-12'


--SELECT idmovimiento, CantidadIngreso, CostoUnitario, CostoExtendido, CostoPromedio, CostoPromedioAnterior, * 
---- update [INV].[Kardex] set CantidadIngreso = 20, CostoUnitario = 0.25000000, CostoExtendido = 5.760000, CostoPromedio = 0.25000000, CostoPromedioAnterior = 0.25000000
--FROM [INV].[Kardex] WHERE IdMovimiento = 'CFCUZCO1000000001248'

SELECT id, BaseAfecta, Igv, TotalMN, TotalME, TipoCambio, * 
-- update gen.movimiento set BaseAfecta = 4.24000000, Igv = 0.76000000, TotalMN = 5.00000000, TotalME = 5.00000000, TipoCambio = 3.33500000
FROM gen.movimiento WHERE id = 'CFCUZCO1000000001248'

SELECT idmovimiento, Cantidad, CostoUnitario, CostoExtendido, Igv, CantidadAlmacen, CantidadSaldo, CostoUnitarioAlmacen, CostoExtendidoAlmacen, *
-- update GEN.DetalleMovimiento set Cantidad = 20.0000000, CostoUnitario = 0.21186440, CostoExtendido = 5.000000, Igv = 0.76000000, CantidadSaldo = 20.00000000, CostoUnitarioAlmacen = 0.21186440
FROM GEN.DetalleMovimiento WHERE IdMovimiento = 'CFCUZCO1000000001248'





--SELECT id, BaseAfecta, Igv, TotalMN, TotalME, TipoCambio, * 
---- update gen.movimiento set BaseAfecta = 4.24000000, Igv = 0.76000000, TotalMN = 5.00000000, TotalME = 1.49925037, TipoCambio = 3.33500000
--FROM gen.movimiento WHERE FechaNegocio = '2019-08-22' and NumeroCorrelativo = '00000035'


--SELECT idmovimiento, Cantidad, CostoUnitario, CostoExtendido, Igv, CantidadAlmacen, CantidadSaldo, CostoUnitarioAlmacen, CostoExtendidoAlmacen, *
---- update GEN.DetalleMovimiento set Cantidad = 20.0000000--, CostoUnitario = 0.25000000, CostoExtendido = 5.800000, Igv = 0.76000000, CostoUnitarioAlmacen = 0.25000000, CostoExtendidoAlmacen = 5.800000
--FROM GEN.DetalleMovimiento WHERE IdMovimiento = 'LIMAMCEN000000000076'


