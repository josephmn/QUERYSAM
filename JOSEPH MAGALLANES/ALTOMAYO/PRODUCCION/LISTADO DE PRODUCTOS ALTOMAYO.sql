

SELECT * FROM sys.objects WHERE NAME LIKE '%MILES%'


ZInventoryMILES





CREATE VIEW ZInventoryMILES
AS
select I.InvtID,I.Descr,case when I.user1='ALT' then (case  when  A.ProdLineId in('SCL','CBS') then 'ACL' when  A.ProdLineId in('SDE','SDG') then 'ADE'  
when A.ProdLineId in ('SGO') then 'AGO'  when A.ProdLineId in('TOM','TOG') then 'ATM' else A.ProdLineId end) ELSE I.USER1  END idmarca,A.ProdLineId
from inventory I 
inner join InventoryADG A on I.InvtID  = A.InvtID
WHERE I.USER1 <>'OTRAS'
UNION ALL 
SELECT 'POR_CXC'INVTID,'CUENTAS X COBRAR'DESCR,'CXC'IDMARCA,'CXC'PRODLINEID



-- version v.1.0
Select I.InvtID 'Codigo', I.Descr 'Nombre' , I.ClassID 'Clase', 
I.InvtType 'Tipo', 

(CASE I.InvtType
WHEN 'C' THEN 'MERCADERIA'
WHEN 'F' THEN 'PRODUCTO TERMINADOS'
WHEN 'S' THEN 'PRODUCTOS EN PROCESO'
WHEN 'R' THEN 'MATERIAS PRIMAS'
WHEN 'C' THEN 'EMVASES Y EMBALAJES'
WHEN 'O' THEN 'SUMINISTROS DIVERSOS'
WHEN 'F' THEN 'EXISTENCIAS POR RECIBIR'
WHEN 'F' THEN 'GTOS MAQUILA Y FABRICACION'
ELSE '0' END) 'Desc Tipo', 

I.Source 'Origen', 

(case I.Source when 'P' then 'Comprado' when 'M' then 'Manufacturado' when 'O' then 'Maquilado'else '0' end)'Descr. Origen',
I.user1 'Marca', xa.descr 'Descr. Marca', Ig.ProdLineID 'Linea',
P.Descr 'Descr Linea', I.Source 'Desc. Sublinea',
ams.Descripcion 'Desc. Sublinea',
I.TranStatusCode 'TranStatus', 
'ACTIVO' 'Estado',
I.StkUnit 'U/M Almacenamiento', I.DfltPOUnit 'U/M Compra', I.DfltSOUnit 'U/M Venta',

--I.DfltSite 'Site', 
I.DfltWhseLoc, 
I.LastCost 'Costo Ultimo', Ig.Volume 'Volumen', Ig.VolUOM 'Unid. Vol', Ig.Weight 'Peso Neto', Ig.WeightUOM 'U/M P. Neto', Ig.SCWeightUOM 'Unid. Medida', 
Ig.StdGrossWt 'Peso Bruto Std.', I.User3 'Unds x Caja/Paquete'
from Inventory I
inner join InventoryADG Ig on I.InvtID = Ig.InvtID
inner join xAMMarcas xa on xa.idmarca = I.User1
--inner join ProductClass  pc on pc.DfltInvtType = i.InvtType
inner join ProductLine p on Ig.ProdLineID = P.ProdLineID
inner join xAMSubLinea ams on ams.SubLineaID = I.User6
where --I.InvtID = '21731' and 
I.TranStatusCode = 'AC' and I.InvtID not like 'G%'
order by I.user1



alter view JM_ProductosAM_OP
-- version v.2.0 con codigo de operaciones para nueva programacion
as
Select top 99999999 I.InvtID 'Codigo', I.Descr 'Nombre' , I.ClassID 'Clase', 
I.InvtType 'Tipo', 

(CASE I.InvtType
WHEN 'C' THEN 'MERCADERIA'
WHEN 'F' THEN 'PRODUCTO TERMINADOS'
WHEN 'S' THEN 'PRODUCTOS EN PROCESO'
WHEN 'R' THEN 'MATERIAS PRIMAS'
WHEN 'C' THEN 'EMVASES Y EMBALAJES'
WHEN 'O' THEN 'SUMINISTROS DIVERSOS'
WHEN 'F' THEN 'EXISTENCIAS POR RECIBIR'
WHEN 'F' THEN 'GTOS MAQUILA Y FABRICACION'
ELSE '0' END) 'Desc Tipo', 

I.Source 'Origen', 

(case I.Source when 'P' then 'Comprado' when 'M' then 'Manufacturado' when 'O' then 'Maquilado'else '0' end)'Descr. Origen',
I.user1 'Marca', 
(case                   
when I.user1='ALT' then (case  when  Ig.ProdLineId in('SCL','CBS') then 'ACL' when  Ig.ProdLineId in('SDE','SDG') then 'ADE' 
when Ig.ProdLineId in('SGO') then 'AGO'  when Ig.ProdLineId in('TOM') then 'ATM'   else Ig.ProdLineId end)                   
when I.user1 is null then 'OTR'                   
else I.user1 end  ) as Marca_RE, 
xa.descr 'Descr. Marca', Ig.ProdLineID 'Linea',
P.Descr 'Descr Linea', I.Source 'Desc. Sublinea1',
ams.Descripcion 'Desc. Sublinea',
(CASE I.TranStatusCode 
WHEN 'AC' THEN 'ACTIVO' 
WHEN 'NP' THEN 'NO COMPRAR' 
WHEN 'NU' THEN 'NO USAR' 
WHEN 'OH' THEN 'RETENIDO' 
WHEN 'IN' THEN 'INACTIVO' 
WHEN 'DE' THEN 'BAJA' 
ELSE '' END) 'Estado', 
I.MaterialType 'Tipo material',
sim.Descr 'Descripcion material',
I.StkUnit 'U/M Almacenamiento', I.DfltPOUnit 'U/M Compra', I.DfltSOUnit 'U/M Venta',

--I.DfltSite 'Site', 
I.DfltWhseLoc, 
I.LastCost 'Costo Ultimo', Ig.Volume 'Volumen', Ig.VolUOM 'Unid. Vol', Ig.Weight 'Peso Neto', 
Ig.WeightUOM 'U/M P. Neto', Ig.SCWeightUOM 'Unid. Medida', 
Ig.StdGrossWt 'Peso Bruto Std.', I.User3 'Unds x Caja/Paquete', 
--me lo llecho
Ig.S4Future03 'AltoCaja', Ig.S4Future04 'AnchoCaja', Ig.S4Future05 'FondoCaja',
Ig.S4Future06 'NetoxCaja', Ig.User5 'BrutoxCaja', Ig.User6 'VolxCaja'

from Inventory I
inner join JM_REMASTERIZADO Z on I.InvtID = Z.invtid
inner join InventoryADG Ig on I.InvtID = Ig.InvtID
inner join xAMMarcas xa on xa.idmarca = Z.marca
--inner join ProductClass  pc on pc.DfltInvtType = i.InvtType
inner join ProductLine p on Ig.ProdLineID = P.ProdLineID
inner join xAMSubLinea ams on ams.SubLineaID = I.User6
left join SIMatlTypes sim on I.MaterialType = sim.MaterialType
where I.InvtID in (
'20266','20267','20310','20630','20631','20632','20633','20634','21008','21009','21032','21039',
'21040','21075','21090','21129','21150','21162','21398','21399','21410','21421','21422','21443',
'21478','21577','21597','21598','21720','21725','21726','21738','21751','21753','21758','21759',
'21761','21763','21766','21767','21768','21775','21780','21781','21782','21784','24133','21785',
'21731'
) and --'21731' and 
I.TranStatusCode = 'AC' and I.InvtID not like 'G%'
order by I.user1




ALTER VIEW JM_REMASTERIZADO
AS
select I.InvtID, I.User1, (case                   
when I.user1='ALT' then (case  when  A.ProdLineId in('SCL','CBS') then 'ACL' when  A.ProdLineId in('SDE','SDG') then 'ADE' when A.ProdLineId in('SGO') then 'AGO'  when A.ProdLineId in('TOM') then 'ATM'   else A.ProdLineId end)                   
when I.user1 is null then 'OTR'                   
else I.user1 end  ) as marca 
from inventory i    
left join inventoryAdg A on I.invtid = A.invtId    





