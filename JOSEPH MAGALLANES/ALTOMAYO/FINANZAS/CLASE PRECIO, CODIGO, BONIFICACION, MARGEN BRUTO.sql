

select PriceClassID, DescrClass, InvtID, Descr, ClassID, Unidad, Precio, Costo, (case Precio when 0 then 0 else round(((Precio - Costo)/Precio)*100,2) end) MargenBruto from (
select distinct top 999999 right(xpc.ch_CodProd,5) InvtID, I.Descr, I.ClassID, pc.PriceClassID, pc.Descr DescrClass, xpc.SlsUnit Unidad, 
round((select z.DiscPrice from (
select distinct top 1 InvtID, CustClassID, SlsUnit, DiscPrice from xAMPriceClass where 
CustClassID = pc.PriceClassID and
InvtID = right(xpc.ch_CodProd,5) 
order by CustClassID, DiscPrice
)z),2) Precio,
isnull(round(mcp.CostoPromGen,2),0) Costo from PriceClass pc
inner join xAM_ListPrecioSol xpc on pc.PriceClassID = xpc.ch_LstPrecio
left join Inventory I on right(xpc.ch_CodProd,5) = I.InvtID
left join man_CostoPromedio mcp on mcp.CodProducto = right(xpc.ch_CodProd,5)
where 
--pc.PriceClassID in ('0003')--,'0006') 
--and 
I.ClassID in ('20','21')
--and right(xpc.ch_CodProd,5) = '21032'
order by PriceClassID, InvtID
)x


--select isnull((select top 1 nu_Precio1 from xAM_ListPrecioSol where 
--ch_LstPrecio = '0005' and ( right(rtrim(ch_CodProd),5) = '21032' or right(rtrim(ch_CodProd),7) = '21032') and nu_Corte <= 4 --and SlsUnit= 'UNI'      
--order by nu_Corte desc),0)   
   
--select isnull((select cast(CostoPromGen as char(100)) from man_CostoPromedio where CodProducto = '21032'   ),0)  

--SELECT Descr FROM PriceClass WHERE PriceClassID = '0001'