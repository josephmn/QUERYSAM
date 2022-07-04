USE [CA2015APP]
GO
DECLARE   
@lote VARCHAR(10)  
DECLARE cClientes CURSOR FOR

	 select banksub from cashacct	  
      
OPEN cClientes 
FETCH cClientes INTO @lote 
WHILE (@@FETCH_STATUS = 0 )
BEGIN
 begin
	 
      
	  
   

 end	
FETCH cClientes INTO @lote
END
CLOSE cClientes
DEALLOCATE cClientes
go

