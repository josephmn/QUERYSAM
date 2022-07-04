


SELECT * FROM SYS.procedures WHERE create_date > = '2019-10-11'


--ASP_DINAMICA_PACxC

--ASP_POST_RIGHT_CXC_PA


/**********************************************************************************************************/


CREATE PROC ASP_DINAMICA_PACxC
-- PROCESO : PARA CREAR TABLA DINAMICA Y CARGAR REPORTE EN EXCEL DE CXC POR CLIENTE, TIPO DE CLIENTES Y N PAGOS CON CAMPOS HACIA LA DERECHA
-- SISTEMA : SOLOMON IV
-- USURIOA : JOSEPH CARLOS MAGALLANES NOLAZCO
-- FECHA   : 14-10-2019
@PERIODO VARCHAR(6)
AS
/*** LIMPIAMOS LA TABLA PARA CREARLA NUEVAMENTE ***/
-- INICIO
BEGIN 
	DECLARE @QUERYDROP VARCHAR(MAX)
	SET @QUERYDROP = 'IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''DinamicaPACxC'+@PERIODO+''')) begin DROP TABLE DinamicaPACxC'+@PERIODO+' end'
	EXECUTE (@QUERYDROP);
END
-- FIN

-- INICIO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'TEMP_TABLACXC'))                                    
begin DROP TABLE TEMP_TABLACXC end      
-- FIN

/*** CREAMOS LA TABLA  DinamicaPACxC CON EL SELECT DESDE LA QUERY DE PAGO CONTRA DOCUMENTO ***/
-- INICIO

BEGIN
	DECLARE @QUERY VARCHAR(MAX)
	SET @QUERY = 'SELECT TOP 1 * INTO DinamicaPACxC'+@PERIODO+' FROM DINAMIC_CXC_PA'
	EXECUTE (@QUERY);
END

-- FIN

-- CREAMOS LA SEGUNDA TABLA
-- INCIO

SELECT * INTO TEMP_TABLACXC FROM DINAMIC_CXC_PA
-- FIN

-- __________________________________________________________________________________________________________
--|																											 |--
--| PASO 2.- CREAMOS LA TABLA CON LA CANTIDAD DE FILAS O LAS FILAS QUE PONDREMOS EN COLUMNAS PARA LA TABLA	 |--
--|__________________________________________________________________________________________________________|--

-- INICIO PASO 2

DECLARE @NumColumn int

set @NumColumn = (SELECT MAX(POST) DATO FROM TEMP_TABLACXC)

--SELECT @NumColumn
DECLARE @ContadoAM int
DECLARE @FechaP char(3) --fecha de pago
DECLARE @MontoP char(3) --monto de pago
DECLARE @PeriodoP char(3) --period de pago

set @ContadoAM = 1

while (@ContadoAM <= @NumColumn)
	begin
	 print @ContadoAM
		set @FechaP  = 'F'+RIGHT('00'+CAST(@ContadoAM AS varchar),2) 
		set @MontoP = 'M'+RIGHT('00'+CAST(@ContadoAM AS  varchar),2) 
		set @PeriodoP  = 'P'+RIGHT('00'+CAST(@ContadoAM AS  varchar),2)  

		--print @Nfac
		Declare @SQL VarChar(1000)
		SELECT @SQL = 'ALTER TABLE DinamicaPACxC'+@PERIODO+' ADD ' + @FechaP + ' date'
		Exec (@SQL)
		SELECT @SQL = 'ALTER TABLE DinamicaPACxC'+@PERIODO+' ADD ' + @MontoP + ' float'
		Exec (@SQL)
		SELECT @SQL = 'ALTER TABLE DinamicaPACxC'+@PERIODO+' ADD ' + @PeriodoP + ' char(6)'
		Exec (@SQL)
		set @ContadoAM = @ContadoAM + 1
	end

-- FIN PASO 2

-- _________________________________________________________________________________________________________________________
--|																															|--
--| PASO 3.- CON LOS CAMPOS COMPLETAMENTE CORREGIDOS, PROCEDEMOS A CONTRUIR LA TABLA DINAMICA PARA LOS PAGOS DESDE CXC		|--
--|_________________________________________________________________________________________________________________________|--

-- INICIO PASO 4

BEGIN
	DECLARE @QUERYN VARCHAR(MAX)
	SET @QUERYN = 'TRUNCATE TABLE DinamicaPACxC'+@PERIODO+''
	EXECUTE (@QUERYN);
END

----
BEGIN
DECLARE @REFNBR char(15)
DECLARE @SENTENCIA VARCHAR(MAX)

DECLARE SACUDE_Y_PERREA CURSOR FOR   

	SELECT DISTINCT NRO_DOCUMENTO, @PERIODO PERIODO FROM TEMP_TABLACXC WHERE PERIODO = @PERIODO

  OPEN SACUDE_Y_PERREA  FETCH SACUDE_Y_PERREA INTO @REFNBR, @PERIODO
        												
  WHILE (@@FETCH_STATUS = 0 )            	 
              BEGIN -- WHILE                			 
              --PROCESO  DEMO        					 
      		  
			  SET @SENTENCIA = ('
				insert into DinamicaPACxC'+@PERIODO+'
				(NRO_DOCUMENTO, RUC_CLIENTE, TIPO_CLIENTE, MONTO_SIN_IGV, PERIODO, FECHA_DOC, FECHA_VEN, COD_CREDITO, FECHA_PAGO, MONTO_PAGO, PERIODO_PAGO)

				SELECT TOP 1 NRO_DOCUMENTO, RUC_CLIENTE, TIPO_CLIENTE, MONTO_SIN_IGV, PERIODO, FECHA_DOC, FECHA_VEN, COD_CREDITO, '''' FECHA_PAGO, '''' MONTO_PAGO, '''' PERIODO_PAGO FROM (
				SELECT * FROM TEMP_TABLACXC
				) Y WHERE Y.NRO_DOCUMENTO = '''+LTRIM(RTRIM(@REFNBR)))+''''

				--PRINT @SENTENCIA

				EXEC (@SENTENCIA);

				EXEC ASP_POST_RIGHT_CXC_PA @REFNBR, @PERIODO
										                                            
              FETCH SACUDE_Y_PERREA INTO @REFNBR, @PERIODO
              END-- END WHILE            
      CLOSE SACUDE_Y_PERREA            
      DEALLOCATE SACUDE_Y_PERREA          
END 


/*

EXEC ASP_DINAMICA_PACxC --'201901'


-- SELECT * FROM DinamicaPACxC201901 WITH(NOLOCK)

*/









/**********************************************************************************************************/






CREATE PROC ASP_POST_RIGHT_CXC_PA
-- PROCESO : PARA REALIZAR UPDATE A LA DERECHA POR EL POS EN CADA DOCUMENTO
-- SISTEMA : SOLOMON IV
-- USURIOA : JOSEPH CARLOS MAGALLANES NOLAZCO
-- FECHA   : 15-10-2019
@REFNBR CHAR(10),
@PERIODO CHAR(6)
AS
BEGIN

DECLARE @pos int 

----TXTUPDATE----------------
DECLARE @TXTQRY NVARCHAR(MAX);
-----------------------------

DECLARE CUR_UPDATE CURSOR FOR   

		SELECT DISTINCT POST, NRO_DOCUMENTO 
		FROM TEMP_TABLACXC WHERE NRO_DOCUMENTO = @REFNBR --'F010010664' --
		AND PERIODO = @PERIODO
		ORDER BY POST ASC

      OPEN CUR_UPDATE
	  FETCH CUR_UPDATE INTO  @pos, @REFNBR
        										

	  WHILE (@@FETCH_STATUS = 0 )            	 
              BEGIN -- WHILE			  			                  			 
              --PROCESO  DEMO  
			  -- set @Contador  = @Contador  + 1      
			 print 'inicia el lote : '+@REFNBR
			 print @pos  

			 SET  @TXTQRY  ='
			  UPDATE A SET 
				A.F'+ RIGHT('00'+ CAST(@pos AS VARCHAR) ,2) +' = B.FECHA_PAGO, 
				A.M'+ RIGHT('00'+ CAST(@pos AS VARCHAR) ,2) +' = B.MONTO_PAGO, 
				A.P'+ RIGHT('00'+ CAST(@pos AS VARCHAR) ,2) +' = B.PERIODO_PAGO
				FROM DinamicaPACxC'+@PERIODO+' A WITH(NOLOCK)
				INNER JOIN TEMP_TABLACXC B WITH(NOLOCK) ON A.NRO_DOCUMENTO = B.NRO_DOCUMENTO
				WHERE A.NRO_DOCUMENTO = '''+ @REFNBR +'''		 
				AND B.POST = '+ cast( @pos as char(2)) +'
		      '
			  --PRINT @TXTQRY
			  EXECUTE (@TXTQRY);

			  print 'termina el lote : '+@REFNBR
    
              FETCH CUR_UPDATE INTO  @pos, @REFNBR
              END-- END WHILE            
      CLOSE CUR_UPDATE            
      DEALLOCATE CUR_UPDATE   
END