--ALTER view [dbo].[AM_VentasV2013]        
--as

        
SELECT    Almacen, Cliente_Cod, Cliente_Dist_Desc, Cliente_Dpto_Desc, Cliente_Name, Cliente_Prov_Desc, Cliente_ZonaRutaID, Cliente_ZonaVta_Cod,         
                      Cliente_ZonaVta_Desc, Detalle_Cantidad, Detalle_Prod_Cod, Detalle_Prod_Linea_Desc, Detalle_Prod_Name, Detalle_Prod_Peso,         
                      Detalle_Prod_SubLinea_Desc, Detalle_Prod_Marca, Detalle_Prod_TipoMat_Desc, Detalle_TotCost, Detalle_TotDesc, Detalle_UnitDesc, ValorVenta,         
                      DocTypeAR, Docum_Fecha, Docum_Nro, NroDespacho, NroVoucher, Pedido_Fecha, Pedido_Nro, Periodo, Anhio, 
				
				(select right(Periodo,2)) mes,

RazonVta_Cod, ShipCity, ShipCountry,         
                      StatusPedido, TipoDoc, TipoOrden, Vendedor_Cod, Vendedor_Desc, Supervisor_Cod, Supervisor_Desc, Cliente_Cod_TipoClte,         
                      Cliente_Cod_SubTipoClte,(case when Detalle_Cantidad > 0 then (ValorVenta/Detalle_Cantidad) else 0 end)precioUni,(case when Detalle_Cantidad > 0 then Detalle_TotCost/Detalle_Cantidad else 0 end) costoUnit,  
                      DATEPART ( week , Docum_Fecha ) semana,        
(case when Cliente_ZonaVta_Cod in('LIMA','CATE','OFIC') then 'LIMA' ELSE 'PROVINCIA'END)  lIMA_pROV   ,EstadoPedido    ,GrupoRuta  ,  
(case when Detalle_Prod_Linea_Cod in('SDE','SDG') then 'SOLUBLES DESCAFEINADO' when Detalle_Prod_Linea_Cod in('CBS') then 'SOLUBLES CLASICOS' else  Detalle_Prod_Linea_Desc end  ) GrupoLinea,  
(case when EstadoPedido in('Generar Despacho','Imprimir Despacho','Imprimir Factura','en reparto') then 'TRANSITO'  else  'AVANCE' end  ) GrupoEstadoPedido,  
  
(select user3 from [ALTOMAYO-TEMP].AM2017APP.dbo.inventory where invtid= Detalle_Prod_Cod) CantidadXCaja  
,((select user3 from [ALTOMAYO-TEMP].AM2017APP.dbo.inventory where invtid= Detalle_Prod_Cod) * Detalle_Cantidad ) Cajas

--,

   
FROM         dbo.AM_Ventas       
WHERE  Anhio in ('2017') --('2016','2017','2018') --('2016','2017')        
--and Almacen ='TRUPT'        
--WHERE   (Periodo IN ('201301','201302','201303','201304','201305','201306','201307','201308','201309','201310','201311','201312','201401'))        
--Periodo in ( rtrim(year(getdate())) + right('00'+ rtrim(month(getdate())),2),rtrim(year(getdate())) + right('00'+ rtrim((case when month(getdate()) <> 1 then month(getdate()) -1 else 12 end)),2))        
--Periodo in ('201211','201212','201301')        
and (TipoDoc in ('01','03','07','08')        
OR Cliente_Cod in ('88888888888') and TipoDoc='OD')        
and  left(Docum_Nro,1) not in ('P')  AND      Detalle_Prod_Cod = '21747' AND Periodo LIKE '201702'
--AND Docum_Nro LIKE '%F030006012%'