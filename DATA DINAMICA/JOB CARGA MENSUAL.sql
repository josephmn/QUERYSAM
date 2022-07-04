CREATE proc [dbo].[Carga_AM_Ventas]                  
as      
--delete AM_Ventas where [Periodo] in ('201211','201212')      
----where Periodo in ( rtrim(year(getdate())) + right('00'+ rtrim(month(getdate())),2),rtrim(year(getdate())) + right('00'+ rtrim((case when month(getdate()) <> 1 then month(getdate()) -1 else 12 end)),2))                 
--                  
--insert into AM_Ventas                   
--select [Almacen],[BillCity],[BillCountry],[Cancelado],[Cliente_Cod],[Cliente_Dist_Cod],                  
--[Cliente_Dist_Desc],[Cliente_Dpto_Cod],[Cliente_Dpto_Desc],[Cliente_GpoDesp],[Cliente_Name],                  
--[Cliente_RUC],[Cliente_Prov_Cod],[Cliente_Prov_Desc],[Cliente_Vend_Cod],[Cliente_ZonaRutaID],                  
--[Cliente_Vend_Desc],[Cliente_ZonaVta_Cod],[Cliente_ZonaVta_Desc],[Compañia],                  
--[Detalle_Cantidad],[Detalle_PrecioUnit],[Detalle_Prod_Cod],[Detalle_Prod_Linea_Cod],                  
--[Detalle_Prod_Linea_Desc],[Detalle_Prod_Name],[Detalle_Prod_Peso],                  
--[Detalle_Prod_SubLinea_Cod],[Detalle_Prod_SubLinea_Desc],[Detalle_Prod_Marca],                  
--[Detalle_Prod_TipoMat_Cod],[Detalle_Prod_TipoMat_Desc],[Detalle_Ref],[Detalle_TotCost],                  
--[Detalle_TotDesc],[Detalle_TotInvc],[Detalle_TotInvcConDesc],[ValorVenta],[Detalle_UnitDesc],                  
--[DocTypeAR],[Docum_Fecha],[Docum_Nro],[FechaCancel],[LoteAR],[LoteIN],[NroDespacho],                  
--[NroVoucher],[Pedido_Fecha],[Pedido_Nro],[PerClosed],[Periodo],[Anhio],[RazonVta_Cod],[ShipCity],                  
--[ShipCountry],[StatusPedido],[TipoDoc],[TipoOrden],[Vendedor_Cod],[Vendedor_Desc],                  
--[Supervisor_Cod],[Supervisor_Desc],[Cliente_Cod_TipoClte],[Cliente_Cod_SubTipoClte]                   
--from [ALTOMAYO-DATA].AM2012APP.dbo.OMRVentasViaSQL                 
--where [Periodo] in ('201211','201212')      
----where [Periodo] in ( rtrim(year(getdate())) + right('00'+ rtrim(month(getdate())),2),rtrim(year(getdate())) + right('00'+ rtrim((case when month(getdate()) <> 1 then month(getdate()) -1 else 12 end)),2))      
      
delete AM_Ventas Where [Periodo] in ('201703')--,'201702','201703')      
--where Periodo in ( rtrim(year(getdate())) + right('00'+ rtrim(month(getdate())),2),rtrim(year(getdate())) + right('00'+ rtrim((case when month(getdate()) <> 1 then month(getdate()) -1 else 12 end)),2))                 
                  
insert into AM_Ventas                   
select [Almacen],[BillCity],[BillCountry],[Cancelado],[Cliente_Cod],[Cliente_Dist_Cod],                  
[Cliente_Dist_Desc],[Cliente_Dpto_Cod],[Cliente_Dpto_Desc],[Cliente_GpoDesp],[Cliente_Name],                  
[Cliente_RUC],[Cliente_Prov_Cod],[Cliente_Prov_Desc],[Cliente_Vend_Cod],[Cliente_ZonaRutaID],                  
[Cliente_Vend_Desc],[Cliente_ZonaVta_Cod],[Cliente_ZonaVta_Desc],[Compañia],                  
[Detalle_Cantidad],[Detalle_PrecioUnit],[Detalle_Prod_Cod],[Detalle_Prod_Linea_Cod],                  
[Detalle_Prod_Linea_Desc],[Detalle_Prod_Name],[Detalle_Prod_Peso],                  
[Detalle_Prod_SubLinea_Cod],[Detalle_Prod_SubLinea_Desc],[Detalle_Prod_Marca],                  
[Detalle_Prod_TipoMat_Cod],[Detalle_Prod_TipoMat_Desc],[Detalle_Ref],[Detalle_TotCost],                  
[Detalle_TotDesc],[Detalle_TotInvc],[Detalle_TotInvcConDesc],[ValorVenta],[Detalle_UnitDesc],                  
[DocTypeAR],[Docum_Fecha],[Docum_Nro],[FechaCancel],[LoteAR],[LoteIN],[NroDespacho],                  
[NroVoucher],[Pedido_Fecha],[Pedido_Nro],[PerClosed],[Periodo],[Anhio],[RazonVta_Cod],[ShipCity],                  
[ShipCountry],[StatusPedido],[TipoDoc],[TipoOrden],[Vendedor_Cod],[Vendedor_Desc],                  
[Supervisor_Cod],[Supervisor_Desc],[Cliente_Cod_TipoClte],[Cliente_Cod_SubTipoClte]      ,ShipToId   ,Estado_Pedido  ,    
(select antZonaRutaId from [ALTOMAYO-TEMP].AM2017APP.dbo.XAMMAE_RUTA where ZonaRutaID= Cliente_ZonaRutaID) GrupoRuta,    
(select user3 from [ALTOMAYO-TEMP].AM2017APP.dbo.inventory where invtid= Detalle_Prod_Cod) CantidadXCaja,0 cajas    
from [ALTOMAYO-TEMP].AM2017APP.dbo.OMRVentasViaSQL  O               
where [Periodo] in ('201703') --,'201702','201703')      
--where [Periodo] in ( rtrim(year(getdate())) + right('00'+ rtrim(month(getdate())),2),rtrim(year(getdate())) + right('00'+ rtrim((case when month(getdate()) <> 1 then month(getdate()) -1 else 12 end)),2))      
      
--select *from [ALTOMAYO-DATA].AM2013APP.dbo.OMRVentasViaSQL      
--select user3,* from [ALTOMAYO-DATA].AM2018APP.dbo.inventory where 