


--buscar factura

 select Cancelled,ARBatNbr,Status,PerPost, * from soshipheader where invcnbr = 'F050007958'

-- select Cancelled,ARBatNbr,Status, * from soshipheader where Cancelled = '1' and invcnbr = 'F050007959'



 --cambio para que pase la factura
 --update soshipheader
 --set   NextFunctionClass = '',ShipRegisterID = '',NextFunctionID = '', status = 'C' where Cancelled = '1' and invcnbr = 'F050007958'


--la factura debe tener un ARBatNbr para poder pasar a la fac. electronica

 select Cancelled,ARBatNbr,Status,PerPost,NextFunctionClass,ShipRegisterID,NextFunctionID, * from soshipheader where Cancelled = '1' and invcnbr = 'F050007958'

--LUEGO EJECUTAR JOB [llenarTb_ventasFE] EN ALTOMAYO-DATA
--LUEGO EJECUTAR JOB [migrarFE] EN ALTOMAYO-DATA

 /* 
 --query para saber los estados a pasar

 select top  15 shipperid, * from soshipheader WHERE perpost =  '201712'  and curyid ='SOL' and Status = 'C' And    
 left(shipperid,1)='N' And     ShipRegisterID = '' and cancelled =1 and NextFunctionClass =''  and INVCNBR <> '' and INVCNBR 
 not in (select refnbr from ardoc  ) order by user1 asc 
 
 
     