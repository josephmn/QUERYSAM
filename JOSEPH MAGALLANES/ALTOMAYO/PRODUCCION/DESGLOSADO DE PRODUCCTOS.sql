
--- PARA REVISAR EL DESGLOSADO DE PRODUCTOS ALTOMAYO

select v2.codProducto, v2.Producto, v2.Unidad_Producto, 
v2.CodInsumo, v2.Insumo, v2.cantComp, v2.Unidad_Insumo,
v3.CodInsumo InsumoKit, v3.Insumo NomInsumoKit, v3.cantComp CantInsumoKit, v3.Unidad_Insumo Uni_Ins_Kit
from vs_JProdInsumo2 v2
inner join vs_JProdInsumo2 v3 on v3.codProducto = v2.CodInsumo WHERE v2.CodInsumo = '23001' AND v2.codProducto = '21795'



--select * from tb_ventas

CREATE VIEW DESGLOSADO_COMPONENTES
AS
select distinct   I.InvtID as  codProducto, I.Descr as Producto, I.StkUnit as Unidad_Producto, 

C.CmpnentId as CodInsumo , C.CmpnentId kit23001
    
,ISNULL(I2.Descr,' ** VACIO **')  Insumo,C.CmpnentQty as cantComp, I2.StkUnit as Unidad_Insumo  from   inventory  I    
inner join  Kit K on  I.InvtID  = K.KitId     
inner join Component C on  K.KitId  =  C.KitId       
left outer join Inventory I2 on C.CmpnentId  = I2.InvtID     
where I.InvtID not in (Select InvtID from inventory where InvtID like '20%')  and     
C.CmpnentId  not in  (select CmpnentId from  Component where CmpnentId  like '%G%')   
and C.CmpnentId  not in  (select CmpnentId from  Component where CmpnentId  like '%S%') and C.CmpnentId <> '23001' and I.InvtID not like 'I%' --AND I.InvtID = '21795' 
--and I.InvtID = '21004'   
group  by I.InvtID, I.Descr, K.KitId, C.KitId, C.CmpnentId, I2.Descr, C.CmpnentQty, I.StkUnit, I2.StkUnit

union all

select v2.codProducto, v2.Producto, v2.Unidad_Producto, 
v2.CodInsumo, --v2.Insumo, v2.cantComp, v2.Unidad_Insumo,
v3.CodInsumo InsumoKit, v3.Insumo NomInsumoKit, v3.cantComp CantInsumoKit, v3.Unidad_Insumo Uni_Ins_Kit
from vs_JProdInsumo2 v2
inner join vs_JProdInsumo2 v3 on v3.codProducto = v2.CodInsumo WHERE v2.CodInsumo = '23001' --AND v2.codProducto = '21795'



