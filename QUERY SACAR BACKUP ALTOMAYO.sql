USE AM2018APP
GO
--ECTRUCTURA PAR EL JOB
EXEC GNR_INDEXDTBASE '"D:\PUBLICO_GASLA\7z.exe"','AM2018APP','D:\DT_ALTOMAYO\','D:\DT_ALTOMAYO\','\\backup-Serv2008\DT_ALTOMAYO\'

/**************** PROCESO A CREAR PARA LOS BACKUP **********************/
/*
CREATE PROCEDURE GNR_INDEXDTBASE             
@RUTA_7Z VARCHAR(256),              
@NOMBRE_BASE VARCHAR(50),              
@RUTA_BASE VARCHAR(256),              
@RUTA_DESTINO VARCHAR(256),              
@RUTA_ENVIO VARCHAR(256)              
              
AS                
BEGIN  --INICIA BEGIN TSP              
DECLARE @name VARCHAR(50), -- NOMBRE BASE DATOS              
@path VARCHAR(256), --RUTA ORIGEN              
@pathd VARCHAR(256),--RUTA DONDE SE GUARDARA EL ARCHIVO               
@fileName VARCHAR(256), -- RUTA + ARCHIVO               
@fileDate VARCHAR(20), -- EXTENCION FECHA PARA BAK              
@CADENA_7Z VARCHAR(500), --RUTA DEL ARCHIVO 7Z GENERADA A PARTIR DEL PASO 1            
----------------------------------------------------------------------            
@USERNAME VARCHAR(500), -- USUARIO PARA ACCESO CARPETA DESTINO            
@PASSWORD VARCHAR(500) -- CONTRASEÑA USADA PARA ACCESO CARPETA             
            
-- INICIO  ( ASIGNAR CREDENCIALES  PARA LOS ACCESOS 16 )             
-- Usted puede cambiar las credenciales para rutas distintas            
SET @USERNAME  ='administrator'            
SET @PASSWORD  ='p3p3gr1ll0'            
----------------------------------------------------------------------            
                                
set @path  =@RUTA_BASE              
----------------------------------------------------------------------              
-- PASO 1  GENERAR BACKUP Y GUARDARLO SEGUN RUTA ASIGNADA ------------              
----------------------------------------------------------------------              
----------------------------------------------------------------------             
--A. VERIFICAR SI CARPETA ORIGEN EXISTE ,SINO CREARLA            
DECLARE @Existe int            
EXEC master..xp_fileexist @RUTA_BASE , @Existe OUT            
IF @Existe = 0            
begin            
DECLARE @FOLDER_ORIGEN nvarchar(555)            
set @FOLDER_ORIGEN  ='mkdir '+@RUTA_BASE            
EXEC master..xp_cmdshell @FOLDER_ORIGEN, no_output            
end            
--            
--            
--B. VERIFICAR SI CARPETA A COMPRIMIR EXISTE, SINO CREARLA            
DECLARE @Existe2 int            
EXEC Master.dbo.xp_fileexist @RUTA_DESTINO , @Existe2 OUT            
IF @Existe2 = 0            
begin            
DECLARE @FOLDER_COMPRESS nvarchar(555)            
set @FOLDER_ORIGEN  ='mkdir '+ @RUTA_DESTINO            
EXEC master..xp_cmdshell @FOLDER_COMPRESS, no_output            
end            
--            
--            
/*            
--C. VERIFICAR SI CARPETA DE ENVIO EXISTE , SINO CREARLA COMO ADMINISTRADOR            
DECLARE @Existe3 int            
EXEC Master.dbo.xp_fileexist @RUTA_DESTINO , @Existe2 OUT            
IF @Existe2 = 0            
begin            
DECLARE @FOLDER_COMPRESS nvarchar(555)            
set @FOLDER_ORIGEN  ='runas /user:\\192.168.10.16\administrator mkdir \\192.168.10.16\C:\HENDER\'            
EXEC master..xp_cmdshell @FOLDER_COMPRESS, no_output            
end            
EXEC master..xp_cmdshell 'mkdir C:\HENDER\',no_output            
*/            
             
SET @path =@RUTA_BASE              
SET @pathD =@RUTA_DESTINO              
-- Includes the date in the filename                
--SET @fileDate = 'HISTORICO'              
-- Includes the date and time in the filename                
 SET @fileDate = CONVERT(VARCHAR(20), GETDATE(), 112)      --COLOCAR -1 SI SE SACA BACKUP EL DIA SIGUIENTE       
 SET @name = @NOMBRE_BASE                
SET @fileName = @path + @name + '' + @fileDate + '.BAK' -- Unique FileName                
--@fileName = @path + @name + '.BAK' -- Non-Unique Filename                
declare @GENERAR_BACKUP NVARCHAR(556)              
SET @GENERAR_BACKUP  ='BACKUP DATABASE ' +@name + ' TO DISK  ='''+@fileName +''' ;'              
EXECUTE sp_executesql @GENERAR_BACKUP              
SELECT @filename AS DIRECCION ,@name+''+@fileDate+'.BAK' AS NOMBRE 
PRINT '  PASO 1 FINALIZADO '               
            
            
--------------------------------------------------------------------------       
-- PASO 2  COMPRIMIR BACKUP EN LA  CARPETA SELECCIONADA                ---              
--------------------------------------------------------------------------           
--------------------------------------------------------------------------              
declare @CADENA_ZIP nVARCHAR(255)              
--declare @path varchar(255)              
DECLARE @NOMBRE_7Z VARCHAR(255)              
--DECLARE @RUTA_7Z VARCHAR(255)              
--set @path   ='D:\DT_COFFEE\'              
--set @RUTA_7Z  ='D:\DT_COFFEE\7z.exe'              
set @fileName = @path + @NAME + '' + @fileDate + '.bak'               
set @NOMBRE_7Z  =''+@pathD + @NAME + '' + @fileDate + '.7Z'               
SET @CADENA_ZIP = ''+@RUTA_7Z +' a -t7z '+@NOMBRE_7Z  + ' -mx9 -R '+@filename+''              
--"C:\Program Files\7-Zip\7z.exe" A "\\192.168.10.15\instaladores\PRUEBA\%NOMBRE%.7z" "D:\INVENTARIO*.bak"              
PRINT @CADENA_ZIP            
EXEC xp_cmdshell @CADENA_ZIP               
PRINT  'PASO 2 FINALIZADO '              
--------------------------------------------------------------------------              
-- PASO 3  ENVIAR_7Z A RUTA ASIGNADA---------------------              
--------------------------------------------------------------------------              
--------------------------------------------------------------------------              
declare @credenciales NVARCHAR(500)--CREDENCIALES EN EJECUCION PARA ENVIO DE ARCHIVOS              
declare @CADENA_ENVIO NVARCHAR(500)              
declare @COMPARTIDA NVARCHAR(256)              
SET @COMPARTIDA  =SUBSTRING(@RUTA_ENVIO,1,LEN(@RUTA_ENVIO)-1)              
set @CADENA_ENVIO = 'copy ' +  @NOMBRE_7Z + ' '+@RUTA_ENVIO+''              
PRINT @CADENA_ENVIO              
SET @credenciales ='net use * '+@COMPARTIDA+' '+@PASSWORD+' /user:'+@USERNAME+' /persistent:no'              
PRINT @credenciales            
exec master..xp_cmdshell @credenciales              
exec master..xp_cmdshell @CADENA_ENVIO               
exec xp_cmdshell 'net use * /delete /y'              
              
--------------------------------------------------------------------------              
-- PASO 4  Eliminar .BAK Y .7Z -------------------------------------------              
--------------------------------------------------------------------------              
--------------------------------------------------------------------------              
-- VERIFICAR SI SE ENVIO EL ARCHIVO            
DECLARE @Envio int            
DECLARE @EXISTE_ENVIO NVARCHAR(555)            
SET @EXISTE_ENVIO  =@RUTA_ENVIO +  @name + '' + @fileDate + '.7Z'            
print @EXISTE_ENVIO            
EXEC Master.dbo.xp_fileexist @EXISTE_ENVIO , @Envio OUT            
IF @Envio = 1            
begin            
PRINT ' SI EXISTE '             
 declare @sqlquery nvarchar(500)              
 set @sqlquery= 'Del "'+@fileName +'"' -- ELIMINAR .BAK              
 print @sqlquery              
 exec master..xp_cmdshell @sqlquery              
 set @sqlquery ='Del "'+@NOMBRE_7Z +'"'--ELIMINAR .7Z              
 print @sqlquery              
 exec master..xp_cmdshell @sqlquery              
end            
IF @Envio = 0            
begin            
 PRINT ' NO EXISTE'             
 -- SE MANTENDRA ARCHIVO BAK Y 7Z  SI NO SE HA ENVIADO            
end            
END -- END TSP
*/