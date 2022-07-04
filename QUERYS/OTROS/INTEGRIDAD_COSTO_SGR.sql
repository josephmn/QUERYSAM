
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [INV].[AM_IntegridadCosto_Ejecutar]
@IdLocal VARCHAR(20) = '',
@xFechaInicio DATE = '1901-01-01',
@xCodigoProducto VARCHAR (10) = ''
AS
BEGIN
	SET LANGUAGE ENGLISH
	PRINT 'FECHA ' + CONVERT(CHAR(10),RIGHT(@xFechaInicio,10),120)
	DECLARE @Result AS BIT = 0
	DECLARE @xIdProducto VARCHAR(20) = ''
	DECLARE @CodigoLocal INT = 0, @Local VARCHAR(80) = ''
	DECLARE @Num_Rows INT = 0, @CC_Rows INT = 0
	IF OBJECT_ID('tempdb..#Almacen') IS NOT  NULL
	DROP TABLE #Almacen
	IF (@IdLocal = '' OR @IdLocal IS NULL) BEGIN SET @IdLocal = '' END
	IF (@xCodigoProducto = '' OR @xCodigoProducto IS NULL) BEGIN SET @xCodigoProducto = '' END

	BEGIN TRY
		SET NOCOUNT ON
		SELECT @Local = LTRIM(RTRIM(Nombre)) FROM GEN.Local WHERE Id = @IdLocal
		SELECT @xIdProducto = LTRIM(RTRIM(Id)) FROM GEN.Producto WHERE CodigoProducto = LTRIM(RTRIM(@xCodigoProducto))
		
		PRINT 'RECALCULO COSTO N-KIT'
		--PRINT @IdLocal
		--PRINT @IdProducto
		
		SELECT Orden = ROW_NUMBER() OVER(ORDER BY (SELECT 1)),Identificador,Nombre
		INTO #Almacen
		FROM GEN.Local L --INNER JOIN VEN.ConfiguracionGastoCaja CGC ON L.Id = CGC.IdLocal
		WHERE 1 = 1
		AND L.Nombre LIKE (CASE WHEN ISNULL(@Local,'') = '' THEN '%%' ELSE @Local END)
		ORDER BY Orden

		SET @Num_Rows = 0
		SET @CC_Rows = 0

		SET @CC_Rows = 1
		SELECT @Num_Rows = COUNT(0) FROM #Almacen  
		WHILE(@CC_Rows <= @Num_Rows)
		BEGIN
			SELECT @CodigoLocal = Identificador FROM #Almacen WHERE Orden =  @CC_Rows
			PRINT @xCodigoProducto
			IF @xCodigoProducto = ''
			BEGIN
				EXEC INV.AM_RecalculoCosto @CodigoLocal,@xFechaInicio
			END
			IF @xCodigoProducto <> ''
			BEGIN
				EXEC INV.AM_RecalculoCosto @CodigoLocal,@xFechaInicio,@xCodigoProducto
			END
			SET @CC_Rows = @CC_Rows + 1  
		END
		
		PRINT 'RECALCULO COSTO KIT'
		SET @Num_Rows = 0
		SET @CC_Rows = 0
		
		SET @CC_Rows = 1
		SELECT @Num_Rows = COUNT(0) FROM #Almacen  
		WHILE(@CC_Rows <= @Num_Rows)
		BEGIN 
			SELECT @CodigoLocal = Identificador FROM #Almacen WHERE Orden =  @CC_Rows
			IF @xCodigoProducto = ''
			BEGIN
				EXEC INV.AM_RecalculoCostoKit @CodigoLocal,@xFechaInicio
			END
			IF @xCodigoProducto <> ''
			BEGIN
				EXEC INV.AM_RecalculoCostoKit @CodigoLocal,@xFechaInicio,@xCodigoProducto
			END
			SET @CC_Rows = @CC_Rows + 1  
		END

		BEGIN
			EXEC INV.AM_IntegridadCosto_Actualizar @IdLocal,@xFechaInicio,@xCodigoProducto

		END
		
		BEGIN SET @Result = 1 END  
		PRINT @Result
		SELECT @Result AS Resultado
		
		SET NOCOUNT OFF
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(4000), @ErrorNumber INT, @ErrorSeverity INT,
		@ErrorState INT, @ErrorLine INT, @ErrorProcedure VARCHAR(200);
			
		SELECT @ErrorNumber = ERROR_NUMBER(), 
		@ErrorSeverity = ERROR_SEVERITY(),
		@ErrorState = ERROR_STATE(),
		@ErrorLine = ERROR_LINE(),
		@ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-');
		SELECT @ErrorMessage = N'Error:%d|Nivel %d|Estado %d|Procedimiento %s|Linea %d|' + 
								'Mensaje: '+ ERROR_MESSAGE()
		RAISERROR(@ErrorMessage, @ErrorSeverity, 1, @ErrorNumber, 
			@ErrorSeverity,@ErrorState, @ErrorProcedure, @ErrorLine)
	END CATCH
END

