

INSERT INTO AM_Canales (CodCanal, NombreCanal, DescrCanal, SlsperidCanal, SlsperidSup, User1, User2, User3, User4, User5)
select  CodCanal, NombreCanal, DescrCanal, SlsperidCanal, SlsperidSup, '201810', User2, User3, User4, User5  
from  AM_Canales where User1  = '201809'


SELECT * FROM ZCONFIGSUPERVISORES WHERE Periodo = '201810'

/*
ALTER view ZCONFIGSUPERVISORES
--Funcion : Filtro de Supervisores x Canal Historico
--Sistema : Solomon IV/Data Dinamica Canales Historicos
--Usuario : Gasla Baudat Laisson Gadel
--Fecha   : 12/10/2018
AS
select distinct  T.Periodo,SGG.SlsperId JefeVenta,SGG.Name NombreJefeVenta,  id_sup,nombreSup,vend,nomVen,zona
from tempFV3 T inner join salesperson S on T.vend = S.slsperid              
inner join salesperson SG on id_sup = SG.slsperid             
left join xamPorIncentD D on D.Marca = id_sup and D.user3 = Periodo          
inner join Salesperson SGG on D.User9 = SGG .SlsperId             
where ri_id=100  and T.Periodo  in ('201801','201802','201803','201804','201805','201806','201807','201808','201809') and id_sup not in ('001','197')

UNION ALL

select distinct  '201810' Periodo ,SGG.SlsperId JefeVenta,SGG.Name NombreJefeVenta,  id_sup,nombreSup,vend,nomVen,zona
from tempFV3 T inner join salesperson S on T.vend = S.slsperid              
inner join salesperson SG on id_sup = SG.slsperid             
left join xamPorIncentD D on D.Marca = id_sup and D.user3 = Periodo          
inner join Salesperson SGG on D.User9 = SGG .SlsperId             
where ri_id=100  and T.Periodo  in ('201809') and id_sup not in ('001','197')
*/

INSERT INTO AM_VentasCanal 
select A.CodCanal,A.NombreCanal, Estado_Pedido, Almacen, BillCity, BillCountry, Cancelado, Cliente_Cod, Cliente_Dist_Cod, Cliente_Dist_Desc, 
Cliente_Dpto_Cod, Cliente_Dpto_Desc, Cliente_GpoDesp, Cliente_Name, Cliente_RUC, Cliente_ClasePrecio, Cliente_Prov_Cod, Cliente_Prov_Desc,Z.vend Cliente_Vend_Cod, 
Cliente_ZonaRutaID,Z.nomVen  Cliente_Vend_Desc, Cliente_ZonaVta_Cod, Cliente_ZonaVta_Desc, Compañia, Detalle_Cantidad, Detalle_PrecioUnit, Detalle_Prod_Cod, 
Detalle_Prod_Linea_Cod, Detalle_Prod_Linea_Desc, Detalle_Prod_Name, Detalle_Prod_Peso, Detalle_Prod_SubLinea_Cod, Detalle_Prod_SubLinea_Desc, 
Detalle_Prod_TipoMat_Cod, Detalle_Prod_TipoMat_Desc, Detalle_Prod_Marca, Detalle_Ref, Detalle_TotCost, Detalle_TotDesc, Detalle_TotInvc, Detalle_TotInvcConDesc, 
ValorVenta, Detalle_UnitDesc, DocTypeAR, Docum_Fecha, Docum_Nro, FechaCancel, LoteAR, LoteIN, NroDespacho, NroVoucher, Pedido_Fecha, Pedido_Nro, PerClosed, 
OM.Periodo, Anhio, RazonVta_Cod, ShipCity, ShipCountry, StatusPedido, TipoDoc, TipoOrden,Z.vend Vendedor_Cod,Z.nomVen Vendedor_Desc,Z.id_sup Supervisor_Cod,
Z.nombreSup Supervisor_Desc, Cliente_Cod_TipoClte, Cliente_Cod_SubTipoClte, ShipToId
from OMRVentasViaSQL OM
INNER JOIN ZCONFIGSUPERVISORES Z ON OM.Periodo  = Z.periodo and OM.vendedor_cod  = Z.VEND
inner join AM_Canales A on Z.JefeVenta  = A.SlsperidCanal  and OM.Periodo  = A.User1  --PERIODODO
where OM.periodo  ='201810'--AND Docum_Nro  ='F010007717'


SELECT *
-- update AM_VentasCanal set codcanal  ='000008' , nombreCanal  = 'CASH & CARRY'
FROM AM_VentasCanal WHERE PERIODO  IN ('201801','201802','201803','201804','201805','201806','201807','201808','201809','201810') and  Cliente_RUC IN ('20492092313','20108730294','20482032215')












