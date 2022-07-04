

ALTER  PROCEDURE TSP_LIBERAR_LOTES2
@BASE VARCHAR(20)
AS
BEGIN TRY
		SET NOCOUNT ON
BEGIN
------------------------------
 DECLARE   
@lote VARCHAR(6)  
DECLARE cClientes CURSOR FOR
		select --top 20
		BATNBR from batch 
		where 1 = 1
		and module = 'AR' 
        and perpost ='201604'
		and status  in ('B','H','S') 
		and crtd_User in ('SYSADMIN','ECMARSAL')	
		--and batnbr not in (select lote from lrevisados )		        
OPEN cClientes 
FETCH cClientes INTO @lote 
WHILE (@@FETCH_STATUS = 0 )
BEGIN -- INICIA FOR
 begin -- INICIA DETALLE FOR
	   insert into  lrevisados select @lote
	   EXEC	liberarAR @LOTE 
       print 'liberarAR '+char(39)+ @lote +char(39)
 end	-- TERMINA DETALLE FOR
FETCH cClientes INTO @lote
END
CLOSE cClientes
DEALLOCATE cClientes
------------------------------
END
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
		SELECT 'NO GENERADO' AS NO_GENERADO, @ErrorMessage AS ERROR_MENS
END CATCH
GO
























