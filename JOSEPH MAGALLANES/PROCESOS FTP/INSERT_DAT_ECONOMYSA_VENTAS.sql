CREATE PROC INSERT_DAT_ECONOMYSA_VENTAS    
AS    
-- CONTROL : CAEGA DE DATOS VENTAS DE ECONOMYSA        
-- CREACION: 22-03-2018        
-- AUTOR: JOSEPH MAGALLANES        
--     
/************************************************************************************/    
-- VERIFICAMOS SI EL ARCHIVO EXISTE
DECLARE @Envio int
DECLARE @PERIODO CHAR(6)
DECLARE @EXISTE_ENVIO NVARCHAR(555)
       
SET @PERIODO = LEFT(RIGHT(CAST(CONVERT(VARCHAR(20),GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/

SET @EXISTE_ENVIO  = 'D:\FTP\ECONOMYSA\altomayo_ventas_'+@PERIODO+'.json'        
print @EXISTE_ENVIO          
EXEC Master.dbo.xp_fileexist @EXISTE_ENVIO , @Envio OUT          

-- SI EXITE ENTRA EN ESTA OPCION
IF @Envio = 1          
	begin          
		PRINT 'ARCHIVO SI EXISTE'
		-- BORRAMOS TABLA TEMPORAL VENTAS (SI HAY ARCHIVOS)
		DELETE FROM AMCUSTOMER.dbo.altomayo_ventas1         

		-- ENCONTRAR ARCHIVO A CARGAR    
		-- A.        
		DECLARE                 
		@ARCHIVO_ACAMBIAR VARCHAR(100),        
		@ARCHIVO_CAMBIADO VARCHAR(100),            
		@CADENA VARCHAR(500)          
          
		SET @ARCHIVO_ACAMBIAR = 'D:\FTP\ECONOMYSA\altomayo_ventas_*.json'            
		SET @ARCHIVO_CAMBIADO = 'altomayo_ventas.json'    
              
		set @CADENA = 'ren ' + @ARCHIVO_ACAMBIAR+' '+@ARCHIVO_CAMBIADO       
		exec master..xp_cmdshell @CADENA     
    
		-- DELETEAMOS LA TABLA CON LOS DATOS ACTUALES PARA PODER CARGAR LOS NUEVOS DATOS    
		-- B.    

		BEGIN TRY  
	
			DECLARE
			--@PERIODO CHAR(6),
			@validadcion int
	
			--SET @PERIODO = LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/
    
			-- Generate a constraint violation error.  
			BULK INSERT AMCUSTOMER.dbo.altomayo_ventas1 FROM 'D:\FTP\ECONOMYSA\altomayo_ventas.json' WITH ( FIELDTERMINATOR = '","', ROWTERMINATOR = '},{' )      
	
			set @validadcion = (select COUNT(*) from AMCUSTOMER.dbo.altomayo_ventas1)
	
			--print @validadcion

			if @validadcion > 0
				begin
					--begin
					PRINT 'INSERT DE ARCHIVO JSON CORRECTA'
					--end
					begin
						-- DELETEAMOS REGISTRO SOLO DE LOS DATOS DEL PERIODO ACTUAL
						--select *
						Delete from AMCUSTOMER.dbo.altomayo_ventas where cliente_cod = 1 and MONTH(fecha_ven) = MONTH(GETDATE()) AND YEAR(fecha_ven) = YEAR(GETDATE())

						PRINT 'DATOS DEL PERIODO '+@PERIODO+' EN TABLA ALTOMAYO_VENTAS ELIMINADO'
					end
					begin
				
						INSERT INTO AMCUSTOMER.dbo.altomayo_ventas (    
						cod_fac, cod_cli, cod_tip_cli, cod_rut, cod_pro, cod_tip_pro, cod_dis, nombre_tip_cli, nombre_rut, nombre_pro, nombre_tip_pro, nombre_dis, cantidad, valor_ven, fecha_ven, cliente_cod)    
    
						SELECT cod_fac, cod_cli, cod_tip_cli, cod_rut, cod_pro,    
						cod_tip_pro, cod_dis, nombre_tip_cli,nombre_rut,nombre_pro,nombre_tip_pro,nombre_dis,    
						cantidad,ROUND(CONVERT(FLOAT,valor_ven),2) valor_ven,    
						right(left(Ltrim(Rtrim(fecha_ven)),10),4)+'-'+right(left(Ltrim(Rtrim(fecha_ven)),5),2)+'-'+left(Ltrim(Rtrim(fecha_ven)),2)fecha_ven, '1' cliente_cod    
    
						FROM (    
  
						SELECT     
						REPLACE(Y.cod_fac,'"','') cod_fac,    
						cod_cli,cod_tip_cli,cod_rut,cod_pro,cod_tip_pro,cod_dis,nombre_tip_cli,nombre_rut,    
						REPLACE(nombre_pro,'+ë','É') nombre_pro,nombre_tip_pro,    
						REPLACE(nombre_dis,'+æ','Ñ')  nombre_dis,cantidad,    
						REPLACE(valor_ven,',','.') valor_ven,    
						RTRIM(LTRIM(REPLACE(fecha_ven,'0:00:00"',''))) fecha_ven    
    
						FROM (    
    
						SELECT     
    
						REPLACE(cod_fac,'cod_fac":"','') cod_fac,    
						REPLACE(cod_cli,'cod_cli":"','') cod_cli,    
						REPLACE(cod_tip_cli,'cod_tip_cli":"','') cod_tip_cli,    
						REPLACE(cod_rut,'cod_rut":"','') cod_rut,    
						REPLACE(cod_pro,'cod_pro":"','') cod_pro, 
						REPLACE(cod_tip_pro,'cod_tip_pro":"','') cod_tip_pro,    
						REPLACE(cod_dis,'cod_dis":"','') cod_dis,    
						REPLACE(nombre_tip_cli,'nombre_tip_cli":"','') nombre_tip_cli,    
						REPLACE(nombre_rut,'nombre_rut":"','') nombre_rut,    
						REPLACE(nombre_pro,'nombre_pro":"','') nombre_pro,    
						REPLACE(nombre_tip_pro,'nombre_tip_pro":"','') nombre_tip_pro,    
						REPLACE(nombre_dis,'nombre_dis":"','') nombre_dis,    
						REPLACE(cantidad,'cantidad":"','') cantidad,    
						REPLACE(valor_ven,'valor_ven":"','') valor_ven,    
						REPLACE(fecha_ven,'fecha_ven":"','') fecha_ven    
    
						FROM (    
    
						SELECT     
    
						REPLACE(RTRIM(LTRIM(cod_fac)),'[{','') cod_fac,     
						RTRIM(LTRIM(cod_cli)) cod_cli,     
						RTRIM(LTRIM(cod_tip_cli)) cod_tip_cli,     
						RTRIM(LTRIM(cod_rut)) cod_rut,     
						RTRIM(LTRIM(cod_pro)) cod_pro,     
						RTRIM(LTRIM(cod_tip_pro)) cod_tip_pro,     
						RTRIM(LTRIM(cod_dis)) cod_dis,     
						RTRIM(LTRIM(nombre_tip_cli)) nombre_tip_cli,     
						RTRIM(LTRIM(nombre_rut)) nombre_rut,     
						RTRIM(LTRIM(nombre_pro)) nombre_pro,     
						RTRIM(LTRIM(nombre_tip_pro)) nombre_tip_pro,     
						RTRIM(LTRIM(nombre_dis)) nombre_dis,     
						RTRIM(LTRIM(cantidad)) cantidad,     
						RTRIM(LTRIM(valor_ven)) valor_ven,     
						RTRIM(LTRIM(fecha_ven)) fecha_ven    
    
						FROM AMCUSTOMER.dbo.altomayo_ventas1    
						)X    
						)Y    
						)Z 

						PRINT 'INSERT DE TABLA TEMPORAL A ALTOMAYO_VENTAS CON PERIODO '+@PERIODO+' CORRECTO'
					end
			
					Begin
						-- DELETEAMOS TABLA EN DONDE HACEMOS LA CONVERSION DE LOS DATOS
						DELETE FROM AMCUSTOMER.dbo.altomayo_ventas1
						PRINT 'DATOS DE TABLA TEMPORAL VENTAS ELIMINADO'
					end
				end
		END TRY  

		BEGIN CATCH  

			if @@ERROR = 7330
				--ROLLBACK TRANSACTION; 
		
				begin
					PRINT 'NO HAY DATOS PARA EL BULK QUIZAS ARCHIVO VACIO: ERROR: 99'
					PRINT 'NO SE ELIMINA DATOS ANTIGUOS DE VENTAS PARA EL PERIODO '+@PERIODO
					PRINT 'TABLA TEMPORAL VENTAS VACIA'
				end
		END CATCH;   
 
		-- TRUNCAMOS LA TABLA TEMPORAL VENTAS PARA LIMPIAR REGISTROS        
		-- E.        
        
		DELETE FROM AMCUSTOMER.dbo.altomayo_ventas1         
        
		-- LIMPIAMOS REGISTROS DE LOS JSON RESTANTES    
		-- F.        
		DECLARE                 
		@ARCHIVOS_ECONOMYSA VARCHAR(100),                
		@CADENA_ENV_ECO VARCHAR(500)          
          
		SET @ARCHIVOS_ECONOMYSA = 'D:\FTP\ECONOMYSA\altomayo_ventas.json'            
              
		set @CADENA_ENV_ECO = 'del ' + @ARCHIVOS_ECONOMYSA             
		exec master..xp_cmdshell @CADENA_ENV_ECO 
	end          

-- SI NO EXISTE NO ENTRA Y NO REALIZA CAMBIO ALGUNO
IF @Envio = 0          
	begin          
		PRINT 'NO EXISTE'
		PRINT 'NO HABRA CAMBIOS, PROCESO TERMINADO'      
	end 