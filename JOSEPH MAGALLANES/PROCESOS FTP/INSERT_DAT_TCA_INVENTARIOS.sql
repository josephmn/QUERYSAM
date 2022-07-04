CREATE PROC INSERT_DAT_TCA_INVENTARIOS
-- CONTROL : INSERT VENTAS DE TCA           
-- CREACION: 22-03-2018          
-- AUTOR: JOSEPH MAGALLANES          
--       
/************************************************************************************/      
AS
-- VERIFICAMOS SI EL ARCHIVO EXISTE
DECLARE @Envio int
DECLARE @EXISTE_ENVIO NVARCHAR(555)

SET @EXISTE_ENVIO  = 'D:\FTP\TCA\altomayo_stocks.txt'        
print @EXISTE_ENVIO          
EXEC Master.dbo.xp_fileexist @EXISTE_ENVIO , @Envio OUT          

IF @Envio = 1          
	begin          
		PRINT 'ARCHIVO SI EXISTE'
		-- LIMPIAMOS TABLA TEMPORAL A CARGAR
		DELETE from AMCUSTOMER.dbo.altomayo_inventarios1

		-- DELETEAMOS LA TABLA CON LOS DATOS ACTUALES PARA PODER CARGAR LOS NUEVOS DATOS  -- INSERT BULK EN TABLA "altomayo_cateras1"   
		-- B.  
  
		BEGIN TRY    
   
		 DECLARE  
		 @PERIODO CHAR(6),  
		 @validadcion int  
   
		 SET @PERIODO = LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/  
      
			-- Generate a constraint violation error.    
		 BULK INSERT AMCUSTOMER.dbo.altomayo_inventarios1 FROM 'D:\FTP\TCA\altomayo_stocks.txt' WITH ( FIELDTERMINATOR = '|', ROWTERMINATOR = '\n' )    
   
		 set @validadcion = (select COUNT(*) from AMCUSTOMER.dbo.altomayo_inventarios1)  
   
		 if @validadcion > 1  
		  begin  
		   PRINT 'INSERT DE ARCHIVO TXT CORRECTA'  
     
		   -- DELETEAMOS REGISTRO SOLO DE LOS DATOS DEL PERIODO ACTUAL  
		   --select *  
		   DELETE from AMCUSTOMER.dbo.altomayo_inventarios
			where periodo_inv = @PERIODO
			AND cliente_cod = '5'
  
		   PRINT 'DATOS DEL PERIODO '+@PERIODO+' EN TABLA ALTOMAYO_INVENTARIOS ELIMINADO'  
     
		   begin  
			-- INSERT PARA LOS DATOS EN LA TABLA + PERIODO DE INSERCION  
    
			INSERT INTO AMCUSTOMER.dbo.[altomayo_inventarios] (cod_alm, cod_pro, nombre_pro, nombre_alm, cantidad, valor, fecha, cliente_cod, periodo_inv)

			SELECT Cod_alm, cod_pro, nombre_pro, nombre_alm, cantidad, valor,
			(
			CASE fecha WHEN '' THEN '' ELSE (right(left(Ltrim(Rtrim(fecha)),10),4)+'-'+right(left(Ltrim(Rtrim(fecha)),5),2)+'-'+left(Ltrim(Rtrim(fecha)),2)) END
			)
			fecha, '5' cliente_cod, LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/ Periodo 

			FROM(
			select 
			RTRIM(LTRIM(Cod_alm)) Cod_alm,
			RTRIM(LTRIM(cod_pro)) cod_pro,
			RTRIM(LTRIM(nombre_pro)) nombre_pro,
			RTRIM(LTRIM(nombre_alm)) nombre_alm,
			REPLACE(RTRIM(LTRIM(cantidad)),'.00','') cantidad,
			ROUND(CONVERT(float,RTRIM(LTRIM(valor))),3) valor,
			CAST(RTRIM(LTRIM(fecha)) AS CHAR(10)) fecha
			from AMCUSTOMER.dbo.altomayo_inventarios1
			) X
       
			PRINT 'INSERT DE TABLA TEMPORAL A ALTOMAYO_INVENTARIOS CON PERIODO '+@PERIODO+' CORRECTO'  
		   end  
     
		   Begin  
			-- DELETEAMOS TABLA EN DONDE HACEMOS LA CONVERSION DE LOS DATOS  
			DELETE from AMCUSTOMER.dbo.altomayo_inventarios1
			PRINT 'DATOS DE TABLA TEMPORAL INVENTARIO ELIMINADO'  
		   end  
		  end  
		END TRY    
  
		BEGIN CATCH    
  
		 if @@ERROR = 7330  
		  --ROLLBACK TRANSACTION;   
    
		  begin  
		   PRINT 'NO HAY DATOS PARA EL BULK QUIZAS ARCHIVO VACIO: ERROR: 99'  
		   PRINT 'NO SE ELIMINA DATOS ANTIGUOS DE INVENTARIOS PARA EL PERIODO '+@PERIODO  
		   PRINT 'TABLA TEMPORAL INVENTARIOS VACIA'  
		  end  
		END CATCH;     
        
		-- LIMPIAMOS REGISTROS DE LOS TXT RESTANTES    
		-- C.        
		DECLARE                 
		@ARCHIVOS_TCA VARCHAR(100),                
		@CADENA_ENV_TCA VARCHAR(500)          
          
		SET @ARCHIVOS_TCA = 'D:\FTP\TCA\altomayo_stocks.txt'            
              
		set @CADENA_ENV_TCA = 'del ' + @ARCHIVOS_TCA            
		exec master..xp_cmdshell @CADENA_ENV_TCA 
	end          
IF @Envio = 0          
	begin          
		PRINT 'NO EXISTE'
		PRINT 'NO HABRA CAMBIOS, PROCESO TERMINADO'      
	end          
