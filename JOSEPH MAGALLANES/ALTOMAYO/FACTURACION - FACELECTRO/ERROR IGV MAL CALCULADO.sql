
--declare @monto float
--declare @documento varchar(20)

--set @monto = 254
--set @documento = 'S0000002590'

--update documento set m_total_venta_Orig = @monto, m_total_venta_Soles = @monto
--from documento where id_documento = @documento

--update documento set valor_igv_Orig = round((@monto - (@monto/1.18)),2), valor_igv_Soles = round((@monto - (@monto/1.18)),2)
--from documento where id_documento = @documento

--update detalle_documento set val_igv_Orig = round((@monto - (@monto/1.18)),2), val_igv_Sol = round((@monto - (@monto/1.18)),2)
--from detalle_documento where id_documento = @documento

--update detalle_documento 
--set precio_unit = round(@monto/1.18,2), 
--val_venta_Orig = @monto, 
--val_venta_Sol = @monto, 
--val_SubTotal_Orig = round(@monto/1.18,2),
--val_SubTotal_Sol = round(@monto/1.18,2),
--Precio_Orig = round(@monto/1.18,2)
--from detalle_documento where id_documento = @documento

select * from documento where id_documento = 'S0000002590'
select * from detalle_documento where id_documento = 'S0000002590'

select * from documento where id_documento = 'S0000002589'
select * from detalle_documento where id_documento = 'S0000002589'

--select count(*) dat, id_documento from detalle_documento
--group by id_documento
--order by id_documento desc
