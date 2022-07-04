



DECLARE @EMB VARCHAR(10)    
DECLARE @DOC VARCHAR(10)    
DECLARE cClientes CURSOR FOR		
		select SHIPPERID, invcnbr from newsh  where invcnbr  BETWEEN 'F580041264' AND 'F580041284'		        
OPEN cClientes 
FETCH cClientes INTO @EMB, @DOC
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin 
 	 	  
	 DECLARE @NUEVO INT 
	 SELECT @NUEVO =  CAST(RIGHT(@DOC,7) AS INTEGER)
	 SET @NUEVO  = @NUEVO - 1	
	 DECLARE @DOC_NEW CHAR(10)
	 SET @DOC_NEW  = 'F58'+ RIGHT( '0000'+CAST(@NUEVO AS VARCHAR) ,7)	 
	 PRINT  ' OLD   :' +@DOC +'  NEW :' +@DOC_NEW
	 UPDATE NEWSH SET invcnbr  = @DOC_NEW where shipperid =@EMB and invcnbr =@DOC
 end	
FETCH cClientes INTO @EMB, @DOC
END
CLOSE cClientes
DEALLOCATE cClientes
go


select * from newsh where shipperid ='FLI0004338'

exec Pasar_Bak_Pedido_Nextel

       sp_helptext  Pasar_Bak_Pedido_Nextel

