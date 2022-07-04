CREATE PROC PUT_ASIST_CIX    
AS    
    
------------------------------ EJECUCION DE CONSULTA PARA GUARDARLO EN UN TXT ---------------------------------    
--A.     
  
-- PARA LA TABLA DE ASISTENCIA_TEMP  
exec master..xp_cmdshell 'bcp "select COD_ASI_TEM, COD_PER_EMP, HORA_ENT, HORA_SAL, HORA_ENT_REF, HORA_SAL_REF, COMENTARIO, HORAS_REF, HORAS, FECHA, EST_REF, EST_ASIS, EMP_COD, PER_COD, LOC_COD, COD_LOC_PER, COD_ASI from [AMRRHH_CIX].dbo.ASISTENCIA_TEMP W
HERE FECHA = convert(char(10), GETDATE(), 120)" queryout "E:\FTP\ASISTENCIA_TEMP.txt" -S ASISTENCIA-CIX\ASIS_CIX -U sa -P 123456 -c -t"|" -r,'    
    
-- PARA LA TABLA DE LOCAL_PERSONAL  
exec master..xp_cmdshell 'bcp "SELECT COD_LOC_PER, LOC_COD, PER_COD FROM [AMRRHH_CIX].dbo.LOCAL_PERSONAL" queryout "E:\FTP\LOCAL_PERSONAL.txt" -S ASISTENCIA-CIX\ASIS_CIX -U sa -P 123456 -c -t"|" -r,'  
  
-- PARA LA TABLA PERSONAL  
exec master..xp_cmdshell 'bcp "SELECT PER_COD, PER_APE_PAT, PER_APE_MAT, PER_NOM, PER_FEC_NAC, PER_SEX, EC_COD, PER_DIR, TDOC_COD, NRO_DOC, PER_FEC_ING, BA_COD, PER_NUM_CTA, RGP_COD, NUM_HIJOS, LOC_COD, AREA_COD, COD_TCON, CC_COD, CAR_COD, PER_FOTO, PER_E
ST, FEC_REG, FEC_MOD, USU_REG, USU_MOD, CIERRE, NULL Template, NULL Template10, ID_PERSONAL, MAR_HUELLA, MAR_DNI FROM [AMRRHH_CIX].dbo.PERSONAL" queryout "E:\FTP\PERSONAL.txt" -S ASISTENCIA-CIX\ASIS_CIX -U sa -P 123456 -c -t"|" -r,'  
  
------------------------------ CREACION DEL ARCHIVO FTP PARA INGRESO AL SERVER DE AMAZON ----------------------------              
    
--B. VERIFICAR SI EXISTE EL ARCHIVO A LEER AL FTP (CONFIGURACION)            
       
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
 set @linea4 = 'echo put E:\FTP\ASISTENCIA_TEMP.txt ASISTENCIA_TEMP.txt>>E:\FTP\ftpasistencia.txt'       
 set @linea5 = 'echo put E:\FTP\LOCAL_PERSONAL.txt LOCAL_PERSONAL.txt>>E:\FTP\ftpasistencia.txt'  --  
 set @linea6 = 'echo put E:\FTP\PERSONAL.txt PERSONAL.txt>>E:\FTP\ftpasistencia.txt'  --      
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
    
--C.    
--PASO FINAL PARA LA SUBIDA DEL ARCHIVO AL FTP    
exec master..xp_cmdshell 'ftp -v -d -i -s:"E:\FTP\ftpasistencia.txt" 54.213.227.38'      