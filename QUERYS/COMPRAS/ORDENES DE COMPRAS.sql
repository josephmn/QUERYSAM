---------- ORDENES DE COMPRA 

-- FILTRA CABECERA ORDEN DE COMPRA 
sp_helptext purchord_cpnyid_ordnbr_d
purchord_cpnyid_ordnbr_d 'ALTOMAYO', '000029' 


-- FILTRA DETALLE DE LA ORDEN DE COMPRA QUE SE HA GENERADO
 sp_helptext purorddet_ponbr 
purorddet_ponbr  '000029', -32768,32767



LotSerT_All 'ALTOMAYO', '000018', '000010', '%', '%'
POAlloc_All 'ALTOMAYO', '000029', '%', '%' 

Select * from PurOrdDet where PONbr = '000029' 







