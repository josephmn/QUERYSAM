CREATE PROC INSERT_DAT_ECONOMYSA_CARTERA
-- CONTROL : INSERT DATOS DE CARTERA PARA ECONOMYSA      
-- CREACION: 23-03-2018      
-- AUTOR: JOSEPH MAGALLANES      
--   
/************************************************************************************/  
AS
-- VERIFICAMOS SI EL ARCHIVO EXISTE
DECLARE @Envio int
DECLARE @PERIODO CHAR(6)
DECLARE @EXISTE_ENVIO NVARCHAR(555)
       
SET @PERIODO = LEFT(RIGHT(CAST(CONVERT(VARCHAR(20),GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/

SET @EXISTE_ENVIO  = 'D:\FTP\ECONOMYSA\altomayo_carteras_'+@PERIODO+'.json'        
print @EXISTE_ENVIO          
EXEC Master.dbo.xp_fileexist @EXISTE_ENVIO , @Envio OUT          

IF @Envio = 1          
	begin          
		PRINT 'ARCHIVO SI EXISTE'
		-- BORRAMOS TABLA TEMPORAL CARTERAS (SI HAY ARCHIVOS)
		DELETE FROM AMCUSTOMER.dbo.altomayo_carteras1

		-- ENCONTRAR ARCHIVO A CARGAR  
		-- A.
		DECLARE               
		@ARCHIVO_ACAMBIAR VARCHAR(100),      
		@ARCHIVO_CAMBIADO VARCHAR(100),          
		@CADENA VARCHAR(500)        
        
		SET @ARCHIVO_ACAMBIAR = 'D:\FTP\ECONOMYSA\altomayo_carteras_*.json'     --CAMBIAR AQUI EL NOMBRE DEL ARCHIVO Y LA RUTA (SI SE CAMBIARA)     
		SET @ARCHIVO_CAMBIADO = 'altomayo_carteras.json'  -- NOMBRE DEL ARCHIVO A CARGAR JSON
            
		set @CADENA = 'ren ' + @ARCHIVO_ACAMBIAR+' '+@ARCHIVO_CAMBIADO     
		exec master..xp_cmdshell @CADENA   

		-- DELETEAMOS LA TABLA CON LOS DATOS ACTUALES PARA PODER CARGAR LOS NUEVOS DATOS  -- INSERT BULK EN TABLA "altomayo_cateras1" 
		-- B.

		BEGIN TRY  
	
			DECLARE
			--@PERIODO CHAR(6),
			@validadcion int
	
			--SET @PERIODO = LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/
    
			-- Generate a constraint violation error.  
			BULK INSERT AMCUSTOMER.dbo.altomayo_carteras1 FROM 'D:\FTP\ECONOMYSA\altomayo_carteras.json' WITH ( FIELDTERMINATOR = '","', ROWTERMINATOR = '},{' )  
	
			set @validadcion = (select COUNT(*) from AMCUSTOMER.dbo.altomayo_carteras1)
	
			if @validadcion > 1
				begin
					PRINT 'INSERT DE ARCHIVO JSON CORRECTA'
			
					-- DELETEAMOS REGISTRO SOLO DE LOS DATOS DEL PERIODO ACTUAL
					--select *
					Delete 
					from AMCUSTOMER.dbo.altomayo_carteras where cliente_cod = 1 and periodo_ven = @PERIODO

					PRINT 'DATOS DEL PERIODO '+@PERIODO+' EN TABLA ALTOMAYO_CARTERAS ELIMINADO'
			
					begin
						-- INSERT PARA LOS DATOS EN LA TABLA + PERIODO DE INSERCION
						insert into AMCUSTOMER.dbo.altomayo_carteras 
						(cod_rut, cod_ven, cod_mes, cod_pro, cod_dis, nombre_rut, nombres_ven, nombre_mes, nombre_pro, nombre_dis, visitas, clientes, cliente_cod, periodo_ven)
						--1764
						select * from(select 
						REPLACE(REPLACE(RTRIM(LTRIM(cod_rut)),'[{',''),'"cod_rut":"','') cod_rut, 
						REPLACE(RTRIM(LTRIM(cod_ven)),'cod_ven":"','') cod_ven, 
						REPLACE(RTRIM(LTRIM(cod_mes)),'cod_mes":"','') cod_mes, 
						REPLACE(RTRIM(LTRIM(cod_pro)),'cod_pro":"','') cod_pro, 
						REPLACE(RTRIM(LTRIM(cod_dis)),'cod_dis":"','') cod_dis, 
						REPLACE(RTRIM(LTRIM(nombre_rut)),'nombre_rut":"','') nombre_rut, 
						REPLACE(RTRIM(LTRIM(nombres_ven)),'nombres_ven":"','') nombres_ven, 
						REPLACE(RTRIM(LTRIM(nombre_mes)),'nombre_mes":"','') nombre_mes, 
						REPLACE(RTRIM(LTRIM(nombre_pro)),'nombre_pro":"','') nombre_pro, 
						REPLACE(RTRIM(LTRIM(nombre_dis)),'nombre_dis":"','') nombre_dis, 
						REPLACE(RTRIM(LTRIM(visitas)),'visitas":"','') visitas, 
						REPLACE(REPLACE(REPLACE(RTRIM(LTRIM(clientes)),'}]',''),'"',''),'clientes:','') clientes ,
						'1' cliente_cod, LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/ Periodo

						from AMCUSTOMER.dbo.altomayo_carteras1
						)z where z.cod_rut <> '' or cod_ven <> '' or cod_mes <> '' 
						PRINT 'INSERT DE TABLA TEMPORAL A ALTOMAYO_CARTERAS CON PERIODO '+@PERIODO+' CORRECTO'
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
					PRINT 'NO SE ELIMINA DATOS ANTIGUOS PARA EL PERIODO '+@PERIODO
					PRINT 'TABLA TEMPORAL VACIA'
				end
		END CATCH;   
      
		-- LIMPIAMOS REGISTROS DE LOS JSON RESTANTES  
		-- C.      
		DECLARE               
		@ARCHIVOS_ECONOMYSA VARCHAR(100),              
		@CADENA_ENV_ECO VARCHAR(500)        
        
		SET @ARCHIVOS_ECONOMYSA = 'D:\FTP\ECONOMYSA\altomayo_carteras.json'          
            
		set @CADENA_ENV_ECO = 'del ' + @ARCHIVOS_ECONOMYSA           
		exec master..xp_cmdshell @CADENA_ENV_ECO 
	end          
IF @Envio = 0          
	begin          
		PRINT 'NO EXISTE'
		PRINT 'NO HABRA CAMBIOS, PROCESO TERMINADO'      
	end          

