

   
DECLARE @BATNBR VARCHAR(6) -- lote para editar (BATCH(CA),CATRAN
DECLARE @TIPO CHAR(10) -- tipo de targeta  (MARSTERCARD,VISA)
DECLARE @NUMTIENDA char(3) -- tienda de donde se requiere editar
DECLARE @FECHA_NEGOCIO smalldatetime -- fecha de la targeta
DECLARE @TOTAL_INV float --monto de targeta en invictus
DECLARE @TOTAL_PLOMA float -- monto de targeta en ploma (cf_detpago)
DECLARE @TOTAL_LOTE float -- suma de targetas para editar en batch
DECLARE @BANKSUB char(24)-- CUENTA PARA VERIFICACION DE LOTE EN OBSERVACION (CATRAN)
SET @BATNBR =''
SET @TIPO  =''
SET @NUMTIENDA  ='26'---------------- IQUITOS INVICTUS
SET @FECHA_NEGOCIO ='2015-01-01'
SET @TOTAL_INV  =0
SET @TOTAL_PLOMA  =0
SET @TOTAL_LOTE = 0
SET @BANKSUB  ='CAIQEM000' --------- CENTRO DE COSTO IQUITOS
DECLARE CUR_MONTOS CURSOR FOR -- CURSOS PARA SELECT MONTOS
 select x.fechanegocio, x.tipo,x.total,y.fechanegocio,y.tipo,y.total  from (
( select row_number() over (order by fechanegocio asc) as row, fechanegocio, tipo,total
   from cfm_detpagotipo where numtienda  =  '26' 
and fechanegocio ='20150609' and tipo <>'EFECTIVO'
)x
inner join 
(select row_number() over (order by fechanegocio asc) as row, fechanegocio, tipo,total
   from cf_detpago where numtienda  = '26'
and fechanegocio  ='2015-06-09' and tipo <>'EFECTIVO')y
on x.row =y.row)
where  x.total <>y.total
OPEN CUR_MONTOS 
FETCH CUR_MONTOS INTO @TIPO ,@TOTAL_INV,@FECHA_NEGOCIO,@TOTAL_PLOMA
WHILE (@@FETCH_STATUS = 0 )-- FOR DE LOS MONTOS EN INVICTUS
BEGIN

		declare CUR_LOTE FOR
		SELECT  @BATNBR =(SELECT BATNBR  FROM CATRAN WHERE REFNBR =@TIPO AND BANKSUB =@BANKSUB
		AND TRANDATE  =@FECHA_NEGOCIO
        

         
		OPEN CUR_LOTE
		FETCH CUR_LOTE INTO @BATNBR,@TOTAL_LOTE
		WHILE (@@FETCH_STATUS = 0 )
		BEGIN
  ----------------------------
   
 			update CF_DetPago set ExportadoTr=@BATNBR
			where  tipo =@TIPO AND FechaNegocio = @FECHA_NEGOCIO and NumTienda =@NUMTIENDA
			UPDATE CF_DetPago SET  TOTAL = @TOTAL_INV from CF_DetPago  where  tipo =@TIPO AND FechaNegocio = @FECHA_NEGOCIO and NumTienda = @NUMTIENDA
			-- actualizo el batch por la suma de las targetas
		
			--actualizo monto de targetas en catran (MASTER,VISA )
			 update catran set curytranamt =@TOTAL_INV ,tranamt =@TOTAL_INV where batnbr =@BATNBR AND REFNBR =@TIPO 
			 update catran set curytranamt =@TOTAL_INV ,tranamt =@TOTAL_INV where batnbr =@BATNBR AND REFNBR =@TIPO   --CUENTAS 1010000 Y 103101

			--actualizo monto  de targetas en GLTRAN (CA) EN CAMPOS CORRESPONDIENTES			
			 update gltran set cramt =@TOTAL_INV,curycramt =@TOTAL_INV where batnbr =@BATNBR and module ='CA' and acct ='101000'
							   AND REFNBR =@TIPO
			 update gltran set dramt =@TOTAL_INV,curydramt =@TOTAL_INV where batnbr =@BATNBR and module ='CA' and acct ='103101'
							   AND REFNBR =@TIPO
			-- visa 
			 update gltran set cramt =@TOTAL_INV,curycramt =@TOTAL_INV where batnbr =@BATNBR and module ='CA' and acct ='101000'
							   AND REFNBR =
			 update gltran set dramt =@TOTAL_INV,curydramt =@TOTAL_INV where batnbr =@BATNBR and module ='CA' and acct ='103101' 
							   AND REFNBR =@TIPO
           
		FETCH CUR_LOTE INTO @BATNBR,@TOTAL_LOTE
		END
		CLOSE CUR_LOTE
		DEALLOCATE CUR_LOTE
FETCH CUR_MONTOS INTO @TIPO ,@TOTAL_INVICTUS,@FECHA_NEGOCIO,@TOTAL_PLOMA
END
CLOSE CUR_MONTOS
DEALLOCATE CUR_MONTOS
GO





-- EXTRAIGO LOTE (VISA Y MASTER) Y SUMA TARGETAS
SELECT BATNBR,SUM(CURYTRANAMT),SUM(TRANAMT) FROM CATRAN WHERE REFNBR IN ('VISA','MASTERCARD') AND BANKSUB ='CAIQCAF000' AND TRANDATE  ='2015-06-24'
GROUP BY BATNBR

-- actualizo el batch por la suma de las targetas
 update batch set crtot=205.7,ctrltot =205.7,curycrtot=205.7,curyctrltot=205.7,curydrtot=205.7, drtot=205.7
 where batnbr ='011728' and module ='CA'
--actualizo monto de targetas en catran (MASTER,VISA )
 update catran set curytranamt =75 ,tranamt =75 where batnbr ='011728' AND REFNBR ='VISA' 
 update catran set curytranamt =75 ,tranamt =75 where batnbr ='011728' AND REFNBR ='MASTERCARD' --CUENTAS 1010000 Y 103101

--actualizo monto  de targetas en GLTRAN (CA) EN CAMPOS CORRESPONDIENTES
--master
 update gltran set cramt =75,curycramt =75 where batnbr ='011728' and module ='CA' and acct ='101000' AND REFNBR ='MASTERCARD'
 update gltran set dramt =75,curydramt =75 where batnbr ='011728' and module ='CA' and acct ='103101' AND REFNBR ='MASTERCARD'
-- visa 
 update gltran set cramt =75,curycramt =75 where batnbr ='011728' and module ='CA' and acct ='101000' AND REFNBR ='VISA'
 update gltran set dramt =75,curydramt =75 where batnbr ='011728' and module ='CA' and acct ='103101' AND REFNBR ='VISA'


---SE VERIFICA TRANSFERENCIA EN BATCH,CATRAN,GLTRAN (MASTERCARD)
SELECT * FROM BATCH WHERE BATNBR  ='011728' AND MODULE ='CA'
SELECT * FROM CATRAN WHERE BATNBR='011728'  AND REFNBR ='MASTERCARD'
 --AND BANKSUB ='CAIQCAF000' AND TRSFTOBANKSUB  ='CAIQCAFMAS'
SELECT * FROM GLTRAN WHERE BATNBR ='011728' AND MODULE ='CA' AND REFNBR ='MASTERCARD'

-------------------------------ACTUALIZAR SEGUN TIPO(VISA,MASTERCARD) -------------------------------------------//
 update batch set crtot=205.7,ctrltot =205.7,curycrtot=205.7,curyctrltot=205.7,curydrtot=205.7, drtot=205.7
 where batnbr ='011728' and module ='CA'
 update catran set curytranamt =75 ,tranamt =75 where batnbr ='011728' AND REFNBR ='MASTERCARD' --CUENTAS 1010000 Y 103101
 update gltran set cramt =75,curycramt =75 where batnbr ='011728' and module ='CA' and acct ='101000' AND REFNBR ='MASTERCARD'
 update gltran set dramt =75,curydramt =75 where batnbr ='011728' and module ='CA' and acct ='103101' AND REFNBR ='MASTERCARD'




















