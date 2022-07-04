

SELECT KitId,CmpnentId COMPONENTE, Descripcion,CmpnentQty QTY, UNIDAD,LINENBR FROM (    
select
 Descripcion = (select Descripcion from SGRPAM2019.GEN.Producto where id = IdInsumo),
 CmpnentId= (select 'I'+codigoproducto from SGRPAM2019.GEN.Producto where id = IdInsumo), CmpnentQty= cantidad,
 (select top 1  abreviatura  from SGRPAM2019.GEN.UnidadMedida where id  =  IdUnidadMedida)UNIDAD ,    
 KitId=(select 'I'+codigoproducto from SGRPAM2019.GEN.Producto where id = idFormula),         
 LineNbr = CONVERT(INT,RIGHT(ID,5))    
from SGRPAM2019.VEN.FormulaProducto where idFormula in (select idproducto from SGRPAM2019.gen.localizacionproducto )        
AND ACTIVO = 1     
)X where kitid = 'I214035'





