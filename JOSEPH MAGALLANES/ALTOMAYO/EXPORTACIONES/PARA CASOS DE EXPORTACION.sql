
SELECT * FROM documento where id_documento = 'C0000010745'
SELECT * FROM documento where id_documento = 'C0000012026'


select * from detalle_documento where id_documento = 'C0000010745'
select * from detalle_documento where id_documento = 'C0000012026'

select * from documento where id_cliente = '20100000106'


SELECT * 
-- delete
FROM documento where id_documento = 'C0000012026'

select * 
-- delete
from detalle_documento where id_documento = 'C0000012026'




select * 
-- UPDATE T SET precio_unit = Precio_Orig
-- UPDATE T SET TaxId = '', id_tipoVenta = 'XP', val_igv_Orig = 0, val_igv_Sol = 0, val_venta_Orig = round((cantidad * precio_unit),2)
from detalle_documento T where id_documento = 'X0000095842'


select * 
-- UPDATE T SET val_venta_Sol = round((val_venta_Orig * d.valor_tipo_cambio),2), val_SubTotal_Orig = val_venta_Orig, val_SubTotal_Sol = round((val_venta_Orig * d.valor_tipo_cambio),2), Precio_Orig = round((precio_unit * d.valor_tipo_cambio),2)
from detalle_documento T inner join documento d on T.id_documento = d.id_documento where t.id_documento = 'X0000095842'


SELECT * FROM documento where id_documento = 'X0000095842'

SELECT * 
-- update d set valor_igv_Orig = 0, valor_igv_Soles = 0, m_total_venta_Orig = (select sum(val_venta_Orig) from detalle_documento where id_documento = 'X0000095842')
FROM documento d where id_documento = 'X0000095842'

SELECT * 
-- update d set m_total_venta_Soles = round((m_total_venta_Orig * valor_tipo_cambio),2)
FROM documento d where id_documento = 'X0000095842'






