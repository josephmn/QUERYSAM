
/**** CAMBIO DE RAZON SOCIAL CUZCO ****/

select VendName, VendId, * from PurchOrd where PONbr = '001321' --and VendId = '20564347982'

update PurchOrd
set VendId = '20491221446', VendName = 'CONSORCIO ORION CUSCO S.R.L' where PONbr = '001321'



/**** CONSULTA EL VENDEDOR ****/

SELECT Name, * FROM Vendor WHERE VendId = '20491221446'

--ANDINO SAC                    	20527925682    

--EXEC recargar_kardex


