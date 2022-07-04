

ALTER PROCEDURE TSP_LIBERAR_LOTES
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
        and perpost ='201601'
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

SET NOCOUNT OFF
END
END TRY
BEGIN CATCH
  print 'error' 
		
END CATCH




