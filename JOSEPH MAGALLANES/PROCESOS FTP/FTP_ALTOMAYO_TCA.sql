CREATE PROC FTP_ALTOMAYO_TCA        
-- CONTROL : DESCARGA DE ARCHIVOS AL FTP ECONOMYSA        
-- CREACION: 21-03-2018        
-- AUTOR: LAISSON GASLA/JOSEPH MAGALLANES        
AS        
DECLARE        
----------------------------------------------------------------------    
@USERNAME VARCHAR(500), -- USUARIO PARA ACCESO CARPETA DESTINO                  
@PASSWORD VARCHAR(500), -- CONTRASEÑA USADA PARA ACCESO CARPETA               
----------------------------------------------------------------------                
@RUTA_BASE varchar(500),        
@NombreDir VARCHAR(10)        
SET @USERNAME  ='administrator'                  
SET @PASSWORD  ='p3p3grillo'              
set @NombreDir = RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),2) /*--DIA*/+'-'+        
 LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+'-'+        
 CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/         
--PRINT @NombreDir        
        
set @RUTA_BASE  ='D:\FTP\TCA\'+@NombreDir        
        
--A. VERIFICAR SI CARPETA ORIGEN EXISTE ,SINO CREARLA, + CREACION DE CARPETA ACTUAL          
DECLARE @Existe int                  
EXEC master..xp_fileexist @RUTA_BASE , @Existe OUT                  
IF @Existe = 0                  
begin                  
DECLARE @FOLDER_ORIGEN nvarchar(555)                  
set @FOLDER_ORIGEN  ='mkdir '+@RUTA_BASE                  
EXEC master..xp_cmdshell @FOLDER_ORIGEN, no_output                  
end           
        
------------------------------ CREACION DEL ARCHIVO FTP PARA INGRESO ----------------------------        
--B.         
declare        
--declaramos variables a usar en las lineas a crear        
@linea1 nvarchar(500),        
@linea2 nvarchar(500),        
@linea3 nvarchar(500),        
@linea4 nvarchar(500),        
@linea5 nvarchar(500),        
@linea6 nvarchar(500),        
@linea7 nvarchar(500),        
@linea8 nvarchar(500),        
@fechaanio nvarchar(500),        
@fechames nvarchar(500)        
        
--------------------------------------        
--declaramos los vclores que tendran        
--------------------------------------        
--sacamos el formato de los archivos        
--set @fechames = LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/        
--set @fechaanio =  CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/         
        
--lineas de comando que crearan el archivo        
set @linea1 = 'echo tca>D:\FTP\ftpconect.txt'        
set @linea2 = 'echo uCu89Mbq1i>>D:\FTP\ftpconect.txt'        
set @linea3 = 'echo ascii>>D:\FTP\ftpconect.txt'        
set @linea4 = 'echo get altomayo_clientes.txt D:\FTP\altomayo_clientes.txt>>D:\FTP\ftpconect.txt'        
set @linea5 = 'echo get altomayo_stocks.txt D:\FTP\altomayo_stocks.txt>>D:\FTP\ftpconect.txt'        
set @linea6 = 'echo get altomayo_ventas.txt D:\FTP\altomayo_ventas.txt>>D:\FTP\ftpconect.txt'        
set @linea7 = 'echo close>>D:\FTP\ftpconect.txt'        
set @linea8 = 'echo bye>>D:\FTP\ftpconect.txt'        
        
exec master..xp_cmdshell @linea1        
exec master..xp_cmdshell @linea2        
exec master..xp_cmdshell @linea3        
exec master..xp_cmdshell @linea4        
exec master..xp_cmdshell @linea5        
exec master..xp_cmdshell @linea6        
exec master..xp_cmdshell @linea7        
exec master..xp_cmdshell @linea8        
       
------------------------------ SE CONECTA Y DESCAR ARCHIVOS EN FTP ------------------------------        
--C.         
exec master..xp_cmdshell 'ftp -v -d -i -s:"D:\FTP\ftpconect.txt" 54.213.227.38'        
        
------------- MUEVE LOS ARCHIVOS DESCARGADOS A LA RUTA Y ELIMINA ARCHIVOS -----------------------        
--C        
DECLARE         
@CADENA_ENVIO VARCHAR(500) ,        
@ARCHIVOS_PLANO VARCHAR(50),          
@RUTA_BASE2 varchar(500),        
@NombreDirtxt VARCHAR(10),        
@ARCHIVOS_TCA VARCHAR(100),        
@CADENA_ENV_ECO VARCHAR(500),      
@CADENA_CARGA_COPIA VARCHAR(500),      
@CADENA_CARGA VARCHAR(500)      
        
SET @ARCHIVOS_PLANO = 'D:\FTP\ALTOMAYO*.txt'        
SET @ARCHIVOS_TCA = 'D:\FTP\ftpconect.txt'        
SET @CADENA_CARGA_COPIA = 'D:\FTP\TCA\ALTOMAYO*.txt'      
      
set @NombreDirtxt = RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),2) /*--DIA*/+'-'+        
 LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+'-'+        
CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/         
      
set @RUTA_BASE2  ='D:\FTP\TCA\'+@NombreDirtxt        
        
set @CADENA_ENVIO = 'copy ' + @ARCHIVOS_PLANO+ ' '+@RUTA_BASE2+''           
exec master..xp_cmdshell @CADENA_ENVIO        
      
set @CADENA_CARGA = 'copy ' + @ARCHIVOS_PLANO+ ' '+ @CADENA_CARGA_COPIA      
exec master..xp_cmdshell @CADENA_CARGA       
        
set @CADENA_ENVIO = 'del ' + @ARCHIVOS_PLANO        
exec master..xp_cmdshell @CADENA_ENVIO        
        
set @CADENA_ENV_ECO = 'del ' + @ARCHIVOS_TCA    
exec master..xp_cmdshell @CADENA_ENV_ECO 