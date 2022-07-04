CREATE PROC FTP_ALTOMAYO_ECONOMYSA    
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
    
set @RUTA_BASE  ='D:\FTP\ECONOMYSA\'+@NombreDir    
    
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
@fechaanio nvarchar(500),    
@fechames nvarchar(500)    
    
--------------------------------------    
--declaramos los vclores que tendran    
--------------------------------------    
--sacamos el formato de los archivos    
set @fechames = LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/    
set @fechaanio =  CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/     
    
--lineas de comando que crearan el archivo    
set @linea1 = 'echo economysa>D:\FTP\ftpconectE.txt'    
set @linea2 = 'echo LzNYYbcXwUKC5Euf>>D:\FTP\ftpconectE.txt'    
set @linea3 = 'echo ascii>>D:\FTP\AR_FTP\ftpconectE.txt'    
set @linea4 = 'echo get altomayo_carteras_'+@fechames+@fechaanio+'.json D:\FTP\altomayo_carteras_'+@fechames+@fechaanio+'.json>>D:\FTP\ftpconectE.txt'    
set @linea5 = 'echo get altomayo_ventas_'+@fechames+@fechaanio+'.json D:\FTP\altomayo_ventas_'+@fechames+@fechaanio+'.json>>D:\FTP\ftpconectE.txt'    
set @linea6 = 'echo close>>D:\FTP\ftpconectE.txt'    
set @linea7 = 'echo bye>>D:\FTP\ftpconectE.txt'    
    
exec master..xp_cmdshell @linea1    
exec master..xp_cmdshell @linea2    
exec master..xp_cmdshell @linea3    
exec master..xp_cmdshell @linea4    
exec master..xp_cmdshell @linea5    
exec master..xp_cmdshell @linea6    
exec master..xp_cmdshell @linea7    
    
------------------------------ SE CONECTA Y DESCAR ARCHIVOS EN FTP ------------------------------    
--C.     
exec master..xp_cmdshell 'ftp -v -d -i -s:"D:\FTP\ftpconectE.txt" 54.213.227.38'    
    
------------- MUEVE LOS ARCHIVOS DESCARGADOS A LA RUTA Y ELIMINA ARCHIVOS -----------------------    
--D.    
DECLARE     
@CADENA_ENVIO VARCHAR(500) ,    
@ARCHIVOS_PLANO VARCHAR(50),      
@RUTA_BASE2 varchar(500),    
@NombreDirtxt VARCHAR(10),    
@ARCHIVOS_ECONOMYSA VARCHAR(100),    
@CADENA_ENV_ECO VARCHAR(500),

@copia_ruta varchar(200),
@ruta_carga varchar(200)   
    
SET @ARCHIVOS_PLANO = 'D:\FTP\*.json'    
SET @ARCHIVOS_ECONOMYSA = 'D:\FTP\ftpconectE.txt'    
    
set @NombreDirtxt = RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),2) /*--DIA*/+'-'+    
 LEFT(RIGHT(CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(8)),4),2) /*--MES*/+'-'+    
 CAST(CONVERT(VARCHAR(20), GETDATE(), 112)AS CHAR(4)) /*--AÑO*/     
    
set @RUTA_BASE2  ='D:\FTP\ECONOMYSA\'+@NombreDirtxt    
    
set @CADENA_ENVIO = 'copy ' + @ARCHIVOS_PLANO+ ' '+@RUTA_BASE2       
exec master..xp_cmdshell @CADENA_ENVIO 

set @ruta_carga = 'D:\FTP\ECONOMYSA\'
set @copia_ruta = 'copy ' + @ARCHIVOS_PLANO+ ' '+@ruta_carga
exec master..xp_cmdshell @copia_ruta 
    
set @CADENA_ENVIO = 'del ' + @ARCHIVOS_PLANO    
exec master..xp_cmdshell @CADENA_ENVIO    
    
set @CADENA_ENV_ECO = 'del ' + @ARCHIVOS_ECONOMYSA    
exec master..xp_cmdshell @CADENA_ENV_ECO