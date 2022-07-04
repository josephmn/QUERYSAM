
select * 
-- update detalle_documento set val_venta_Orig = 880.28, val_venta_Sol = 880.28, val_igv_Orig = 134.28,	val_igv_Sol = 134.28, val_SubTotal_Orig = 746, val_SubTotal_Sol = 746
-- update detalle_documento set val_venta_Orig = 0, val_venta_Sol = 0, val_igv_Orig = 0, val_igv_Sol = 0, val_SubTotal_Orig = 0, val_SubTotal_Sol = 0

-- update detalle_documento set val_SubTotal_Sol =  0.01
from detalle_documento where id_documento = 'C0000023332' and LineId = '014'

--C0000023414
--C0000023415
--C0000023416


--SELECT TOP 1 LineId FROM detalle_documento A where id_documento = 'C0000023414' AND val_venta_Orig <> 0 ORDER BY A.LineId DESC

SELECT ISNULL(COUNT(*),0)DATO FROM detalle_documento WHERE ltrim(rtrim(id_documento))  = ltrim(rtrim('C0000023414'))  AND val_venta_Orig  = 0    

 -------------------------------------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Inicio
 declare  @ID_Documento  varchar (15)
 declare  @LineID  varchar (51)
 declare  MANTECA Cursor  For

 select  distinct  id_documento , LineId   from  detalle_documento    where  id_documento  in (select  id_documento from documento     WHERE 
 SUBSTRING(LEFT(CONVERT(VARCHAR,fec_venta  , 120), 10),1,4) + SUBSTRING(LEFT(CONVERT(VARCHAR, fec_venta, 120), 10),6,2) = '202008' 
 and enviado_externo = 0  AND estado = 'C'  /*and id_documento like  '%C%'*/  and  id_cliente <>  '00000000000' )    and val_venta_Sol= 0  AND  id_documento  not  in  
 (select  id_documento  from  JV_DOBLE_BON)

 OPEN    MANTECA
 FETCH MANTECA  into   @ID_Documento ,  @LineID
	 WHILE  (@@FETCH_STATUS  = 0) 
	   BEGIN 
					DECLARE @LINEMENOR   char(3)  
					DECLARE @NUMERO int
						
						
						SET @LINEMENOR = (SELECT TOP 1 LineId FROM detalle_documento A where id_documento = @ID_Documento AND val_venta_Orig <> 0 ORDER BY A.LineId DESC)
					    --Set   @LINEMENOR  =   (case   when  convert(Integer , @LineID)-1  < = 9 then   '00'+ cast(convert(Integer , @LineID)-1 as varchar ) else  '0'+ cast(convert(Integer , @LineID)-1  as varchar) end  ) 
	  
						select  @LINEMENOR + '---------------------------------->' AS ORDEN 

						SELECT @NUMERO  = ( SELECT ISNULL(COUNT(*),0)DATO FROM detalle_documento WHERE ltrim(rtrim(id_documento))  = ltrim(rtrim(@ID_Documento))  AND val_venta_Orig  = 0    )
						print ''+ cast(@numero as varchar)

						UPDATE TOP (1) detalle_documento  
						SET 
						val_igv_Orig = val_igv_Orig - ((0.01)  * @NUMERO), 
						val_igv_Sol = val_igv_Sol - ((0.01)  *@NUMERO), 
						val_venta_Orig = val_venta_Orig - ((0.01)  *@NUMERO), 
						val_venta_Sol = val_venta_Sol - ((0.01)  *@NUMERO), 
						val_SubTotal_Orig = ROUND((val_venta_Orig - ((0.01)  *@NUMERO))/1.18,2), 
						val_SubTotal_Sol = ROUND((val_venta_Orig - ((0.01)  *@NUMERO))/1.18,2)
						WHERE  ltrim(rtrim(id_documento))  = ltrim(rtrim(@ID_Documento)) AND val_venta_Orig > 0 AND  LineId  = @LINEMENOR  and CatId ='AFECTO'
						--SELECT * 
						
						update a set val_venta_Orig=0.01, val_venta_Sol=0.01, val_igv_Orig=0.01, val_igv_Sol=0.01, val_SubTotal_Orig=0.01, val_SubTotal_Sol  = 0.01
						FROM detalle_documento a WHERE  ltrim(rtrim(id_documento))  = ltrim(rtrim(@ID_Documento)) AND val_venta_Orig = 0 --and LineId = @LineID 

		FETCH MANTECA  into   @ID_Documento ,  @LineID 
	END
CLOSE MANTECA 
DEALLOCATE  MANTECA

 -------------------------------------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIN 
