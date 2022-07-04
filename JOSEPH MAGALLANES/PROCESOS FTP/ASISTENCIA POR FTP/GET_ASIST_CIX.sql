CREATE PROC GET_ASIST_CIX         
-- CONTROL : DESCARGA DE ARCHIVOS PARA LA ASISTENCIA DIARIA    
-- CREACION: 30-04-2018            
-- AUTOR: JOSEPH MAGALLANES            
AS        
---------------------------- EJECUCION DE CONSULTA PARA DESCARGAR EL TXT CON DATOS DE ASISTENCIA DE CHICLAYO ---------------------------------      
--A.       
    
DECLARE              
                 
@RUTA_BASE VARCHAR(500)      
             
set @RUTA_BASE  ='E:\FTP\ftpasistencia.txt'       
      
DECLARE @Existe int                        
EXEC master..xp_fileexist @RUTA_BASE , @Existe OUT       
PRINT 'ARCHIVO EXISTE'                  
IF @Existe = 0                        
begin         
      
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
 --declaramos los valores que tendran                
 --------------------------------------                            
    --lineas de comando que crearan el archivo                
 set @linea1 = 'echo joseph>E:\FTP\ftpasistencia.txt'                
 set @linea2 = 'echo MEaeXmZB>>E:\FTP\ftpasistencia.txt'                
 set @linea3 = 'echo ascii>>E:\FTP\ftpasistencia.txt'                
 set @linea4 = 'echo get ASISTENCIA_TEMP.txt E:\FTP\ASISTENCIA_TEMP.txt>>E:\FTP\ftpasistencia.txt'    
 set @linea5 = 'echo get LOCAL_PERSONAL.txt E:\FTP\LOCAL_PERSONAL.txt>>E:\FTP\ftpasistencia.txt'    
 set @linea6 = 'echo get PERSONAL.txt E:\FTP\PERSONAL.txt>>E:\FTP\ftpasistencia.txt'    
 set @linea7 = 'echo close>>E:\FTP\ftpasistencia.txt'                
 set @linea8 = 'echo bye>>E:\FTP\ftpasistencia.txt'                
                 
 exec master..xp_cmdshell @linea1                
 exec master..xp_cmdshell @linea2                
 exec master..xp_cmdshell @linea3                
 exec master..xp_cmdshell @linea4                
 exec master..xp_cmdshell @linea5                
 exec master..xp_cmdshell @linea6          
 exec master..xp_cmdshell @linea7    
 exec master..xp_cmdshell @linea8    
       
 PRINT 'ARCHIVO CREADO'      
             
end      
      
--B.      
--EJECUTAMOS LA DESCARGA DEL ARCHIVO DEL FTP    
    
exec master..xp_cmdshell 'ftp -v -d -i -s:"E:\FTP\ftpasistencia.txt" 54.213.227.38'        
    
--C.    
-- 2.- REALIZAMOS EL INSERT A UNA TABLA TEMPORAL PARA LUEGO INSERTARLO EN LA REAL  
--LIMPIAMOS TABLA TEMPORAL DE LA ASISTENCIA  
DELETE FROM [AMRRHH_BETA].dbo.ASISTENCIA_TEMP_CIX WHERE FECHA = convert(char(10), GETDATE(), 120) AND COD_ASI_TEM LIKE 'CIX%'    
    
-- PARA ASISTENCIA_TEMP  
BULK INSERT [AMRRHH_BETA].dbo.ASISTENCIA_TEMP_CIX FROM 'E:\FTP\ASISTENCIA_TEMP.txt' WITH ( FIELDTERMINATOR = '|', ROWTERMINATOR = ',')     
  
--D.  
-- DELETEAMOS LOS DATOS QUE EXISTAN DEL DIA ACTUAL Y VOLVEMOS A INGRESAR LOS DATOS CON UN INSERT  
  
/** DELETEAMOS LOS REGISTOS CON FECHA ACTUAL **/  
DELETE   
FROM [AMRRHH_BETA].dbo.ASISTENCIA_TEMP WHERE FECHA = convert(char(10), GETDATE(), 120) AND COD_ASI_TEM LIKE 'CIX%'  
  
  
/** RECARGAMOS LOS DATOS CON LOS DATOS DEL FTP DESCARGADOS **/  
  
INSERT INTO [AMRRHH_BETA].dbo.ASISTENCIA_TEMP   
(COD_ASI_TEM, COD_PER_EMP, HORA_ENT, HORA_SAL, HORA_ENT_REF, HORA_SAL_REF, COMENTARIO, HORAS_REF, HORAS, FECHA, EST_REF, EST_ASIS, EMP_COD, PER_COD, LOC_COD, COD_LOC_PER, COD_ASI)  
  
SELECT COD_ASI_TEM, COD_PER_EMP, HORA_ENT, HORA_SAL, HORA_ENT_REF, HORA_SAL_REF, COMENTARIO, HORAS_REF, HORAS, FECHA, EST_REF, EST_ASIS, EMP_COD, PER_COD, LOC_COD, COD_LOC_PER, COD_ASI  
FROM [AMRRHH_BETA].dbo.ASISTENCIA_TEMP_CIX WHERE FECHA = convert(char(10), GETDATE(), 120) AND COD_ASI_TEM LIKE 'CIX%'  
  
