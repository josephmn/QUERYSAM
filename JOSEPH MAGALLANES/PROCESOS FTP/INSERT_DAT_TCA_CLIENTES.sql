CREATE PROC INSERT_DAT_TCA_CLIENTES  
-- CONTROL : INSERT DATOS DE CLIENTES PARA TCA         
-- CREACION: 23-03-2018        
-- AUTOR: JOSEPH MAGALLANES        
--     
/************************************************************************************/    
AS  
-- VERIFICAMOS SI EL ARCHIVO EXISTE
DECLARE @Envio int
DECLARE @EXISTE_ENVIO NVARCHAR(555)

SET @EXISTE_ENVIO  = 'D:\FTP\TCA\altomayo_clientes.txt'        
print @EXISTE_ENVIO          
EXEC Master.dbo.xp_fileexist @EXISTE_ENVIO , @Envio OUT          

IF @Envio = 1          
	begin          
		PRINT 'ARCHIVO SI EXISTE'
		-- ELIMINAMOS ARCHIVOS DE TABLA TEMPORAL
		DELETE FROM AMCUSTOMER.dbo.altomayo_carteras1

		-- DELETEAMOS LA TABLA CON LOS DATOS ACTUALES PARA PODER CARGAR LOS NUEVOS DATOS  -- INSERT BULK EN TABLA "altomayo_cateras1"   
		-- A.  
  
		BEGIN TRY    
   
		 DECLARE  
		 @PERIODO CHAR(6),  
		 @validadcion int  
   
		 SET @PERIODO = LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--A—O*/  
      
			-- Generate a constraint violation error.    
			BULK INSERT AMCUSTOMER.dbo.altomayo_carteras1 FROM 'D:\FTP\TCA\altomayo_clientes.txt' WITH ( FIELDTERMINATOR = '|', ROWTERMINATOR = '\n' )   
 
		 set @validadcion = (select COUNT(*) from AMCUSTOMER.dbo.altomayo_carteras1)  
   
		 if @validadcion > 1  
		  begin  
		   PRINT 'INSERT DE ARCHIVO TXT PARA TCA CORRECTA'  
     
		   -- DELETEAMOS REGISTRO SOLO DE LOS DATOS DEL PERIODO ACTUAL  
		   --select *  
		   Delete   
		   from AMCUSTOMER.dbo.altomayo_carteras where cliente_cod = 5 and periodo_ven = @PERIODO  
  
		   PRINT 'DATOS DEL PERIODO '+@PERIODO+' EN TABLA ALTOMAYO_CARTERAS PARA TCA ELIMINADO'  
     
		   begin  
			-- INSERT PARA LOS DATOS EN LA TABLA + PERIODO DE INSERCION DE TCA
			insert into AMCUSTOMER.dbo.altomayo_carteras   
			(cod_rut, cod_ven, cod_mes, cod_pro, cod_dis, nombre_rut, nombres_ven, nombre_mes, nombre_pro, nombre_dis, visitas, clientes, cliente_cod, periodo_ven)  

			--267
			select 
			RTRIM(LTRIM(cod_rut)) cod_rut, 
			RTRIM(LTRIM(cod_ven)) cod_ven, 
			RTRIM(LTRIM(cod_mes)) cod_mes, 
			RTRIM(LTRIM(cod_pro)) cod_pro, 
			RTRIM(LTRIM(cod_dis)) cod_dis, 
			REPLACE(RTRIM(LTRIM(nombre_rut)),'+Ê','—') nombre_rut, 
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(replace(replace(RTRIM(LTRIM(nombres_ven)),'+Ê','—'),'+Ù','—'),'+‹','⁄'),'¥+¢','—'),'E¥+¢','…'),'?A','—A'),'+Ï','Õ'),'TORREJ—N','TORREJ”N'),'?O','—O') nombres_ven, 
			RTRIM(LTRIM(nombre_mes)) nombre_mes, 
			REPLACE(REPLACE(REPLACE(RTRIM(LTRIM(nombre_pro)),'A+ÊE','A—E'),'A¥+¢E','A—E'),'E+ÊA','E—A') nombre_pro, 
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(RTRIM(LTRIM(nombre_dis)),'A+ÊE','A—E'),'A¥+¢E','A—E'),'E+ÊA','E—A'),'A√?E','A—E'),'E√?A','E—A'),'E¥+¢A','E—A'),'E?A','E—A') nombre_dis, 
			RTRIM(LTRIM(visitas)) visitas, 
			RTRIM(LTRIM(clientes)) clientes, 
			'5' cliente_cod, 
			LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--A—O*/ Periodo 
			from AMCUSTOMER.dbo.altomayo_carteras1
  
			PRINT 'INSERT DE TABLA TEMPORAL A ALTOMAYO_CARTERAS CON PERIODO '+@PERIODO+' CORRECTO PARA TCA'  
		   end  
     
		   Begin  
			-- DELETEAMOS TABLA EN DONDE HACEMOS LA CONVERSION DE LOS DATOS  
			delete FROM AMCUSTOMER.dbo.altomayo_carteras1  
			PRINT 'DATOS DE TABLA TEMPORAL ELIMINADO'  
		   end  
		  end  
		END TRY    
  
		BEGIN CATCH    
  
		 if @@ERROR = 7330  
		  --ROLLBACK TRANSACTION;   
    
		  begin  
		   PRINT 'NO HAY DATOS PARA EL BULK QUIZAS ARCHIVO VACIO: ERROR: 99'  
		   PRINT 'NO SE ELIMINA DATOS ANTIGUOS DE CARTERAS PARA EL PERIODO '+@PERIODO  
		   PRINT 'TABLA TEMPORAL CARTERAS VACIA'  
		  end  
		END CATCH;     
        
		-- LIMPIAMOS REGISTROS DE LOS JSON RESTANTES    
		-- B.        
		DECLARE            
		@ARCHIVOS_TCA VARCHAR(100),                
		@CADENA_ENV_TCA VARCHAR(500)          
          
		SET @ARCHIVOS_TCA = 'D:\FTP\TCA\altomayo_clientes.txt'            
              
		set @CADENA_ENV_TCA = 'del ' + @ARCHIVOS_TCA             
		exec master..xp_cmdshell @CADENA_ENV_TCA 
	end          
IF @Envio = 0          
	begin          
		PRINT 'NO EXISTE'
		PRINT 'NO HABRA CAMBIOS, PROCESO TERMINADO'      
	end          

