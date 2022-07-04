CREATE PROC INSERT_DAT_TCA_VENTAS    
-- CONTROL : INSERT VENTAS DE TCA             
-- CREACION: 22-03-2018            
-- AUTOR: JOSEPH MAGALLANES            
--   
AS             
/************************************************************************************/  
-- VERIFICAMOS SI EL ARCHIVO EXISTE  
DECLARE @Envio int  
DECLARE @EXISTE_ENVIO NVARCHAR(555)  
         
SET @EXISTE_ENVIO  = 'D:\FTP\TCA\altomayo_ventas.txt'          
print @EXISTE_ENVIO            
EXEC Master.dbo.xp_fileexist @EXISTE_ENVIO , @Envio OUT            
  
-- SI EXITE ENTRA EN ESTA OPCION  
IF @Envio = 1            
 begin            
  PRINT 'ARCHIVO SI EXISTE'  
  -- LIMPIAMOS TABLA TEMPORAL A CARGAR  
  -- A.  
  
  DELETE AMCUSTOMER.dbo.altomayo_ventas1  
  
  -- DELETEAMOS LA TABLA CON LOS DATOS ACTUALES PARA PODER CARGAR LOS NUEVOS DATOS  -- INSERT BULK EN TABLA "altomayo_cateras1"     
  -- B.    
  
  BEGIN TRY      
     
   DECLARE    
   @PERIODO CHAR(6),    
   @validadcion int    
     
   SET @PERIODO = LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/    
        
   -- Generate a constraint violation error.      
   BULK INSERT AMCUSTOMER.dbo.altomayo_ventas1 FROM 'D:\FTP\TCA\altomayo_ventas.txt' WITH ( FIELDTERMINATOR = '|', ROWTERMINATOR = '\n' )          
  
     
   set @validadcion = (select COUNT(*) from AMCUSTOMER.dbo.altomayo_ventas1)    
     
   if @validadcion > 1    
    begin    
     PRINT 'INSERT DE ARCHIVO TXT CORRECTA'    
       
     -- DELETEAMOS REGISTRO SOLO DE LOS DATOS DEL PERIODO ACTUAL    
     --select *    
     Delete from AMCUSTOMER.dbo.[altomayo_ventas] where MONTH(fecha_ven) = MONTH(GETDATE()) AND YEAR(fecha_ven) = YEAR(GETDATE()) AND cliente_cod = '5'   
    
     PRINT 'DATOS DEL PERIODO '+@PERIODO+' EN TABLA ALTOMAYO_VENTAS ELIMINADO'    
       
     begin    
   -- INSERT PARA LOS DATOS EN LA TABLA + PERIODO DE INSERCION    
      
   insert into AMCUSTOMER.dbo.[altomayo_ventas]           
   (cod_fac, cod_cli, cod_tip_cli, cod_rut, cod_pro, cod_tip_pro, cod_dis, nombre_tip_cli, nombre_rut, nombre_pro, nombre_tip_pro, nombre_dis, cantidad, valor_ven, fecha_ven, cliente_cod)          
          
   SELECT cast(cod_fac as nvarchar(13)) cod_fac,           
   cod_cli,           
   cod_tip_cli,           
   cod_rut,           
   cod_pro,           
   cod_tip_pro,           
   cod_dis,           
   nombre_tip_cli,           
   nombre_rut,           
   nombre_pro,           
   nombre_tip_pro,           
   replace(LTRIM(RTRIM(nombre_dis)),'´+¢','Ñ') nombre_dis,           
          
   replace(replace(Ltrim(Rtrim(cantidad)),'.00',''),',','') cantidad,           
          
   replace(Ltrim(Rtrim(valor_ven)),',','') valor_ven,           
          
   right(left(Ltrim(Rtrim(fecha_ven)),10),4)+'-'+right(left(Ltrim(Rtrim(fecha_ven)),5),2)+'-'+left(Ltrim(Rtrim(fecha_ven)),2) fecha_ven,          
  
   '5' cliente_cod FROM AMCUSTOMER.dbo.altomayo_ventas1 WHERE cod_fac NOT IN (SELECT cod_fac   
   FROM AMCUSTOMER.dbo.altomayo_ventas where month(fecha_ven) = MONTH(DATEADD(MONTH,-1,GETDATE())) and year(fecha_ven) = year(GETDATE()) and cliente_cod = 5)  
         
   PRINT 'INSERT DE TABLA TEMPORAL A ALTOMAYO_VENTAS CON PERIODO '+@PERIODO+' CORRECTO'  
     end    
       
     Begin    
   -- DELETEAMOS TABLA EN DONDE HACEMOS LA CONVERSION DE LOS DATOS    
   DELETE AMCUSTOMER.dbo.altomayo_ventas1         
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
          
  -- LIMPIAMOS REGISTROS DE LOS TXT RESTANTES      
  -- C.          
  DECLARE                 
  @ARCHIVOS_TCA VARCHAR(100),                
  @CADENA_ENV_TCA VARCHAR(500)     
          
  SET @ARCHIVOS_TCA = 'D:\FTP\TCA\altomayo_ventas.txt'            
              
  set @CADENA_ENV_TCA = 'del ' + @ARCHIVOS_TCA             
  exec master..xp_cmdshell @CADENA_ENV_TCA   
 end            
  
-- SI NO EXISTE NO ENTRA Y NO REALIZA CAMBIO ALGUNO  
IF @Envio = 0            
 begin            
  PRINT 'NO EXISTE'  
  PRINT 'NO HABRA CAMBIOS, PROCESO TERMINADO'        
 end 