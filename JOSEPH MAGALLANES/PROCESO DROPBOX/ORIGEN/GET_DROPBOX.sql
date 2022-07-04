CREATE PROC GET_DROPBOX   
  
/***************************************************************************/  
--|  DESCRIPCION :  DROPBOX             |  
--|   FUNCION : OBTENER ARCHIVOS DE TEXTO PLANO Y SUBIRLOS AL DROPBOX |  
--|     AUTOR : JOSEPH MAGALLANES NOLAZCO        |  
--|      AREA : SISTEMAS ALTOMAYO          |  
--| PROGRAMACION : ASISTENCIA AM           |  
/***************************************************************************/  
  
AS     
  
--1.- INICIO  
/*----------------------------------------------------------------------------------------------------------*/  
/*************| ELIMINAMOS LOS DATOS DE LA TABLA TEMPORAL CIX Y DE LA CARPETA DROPBOX |**********************/  
/*----------------------------------------------------------------------------------------------------------*/  
  
-- 2.- REALIZAMOS EL INSERT A UNA TABLA TEMPORAL PARA LUEGO INSERTARLO EN LA REAL        
--LIMPIAMOS TABLA TEMPORAL DE LA ASISTENCIA   
       
TRUNCATE TABLE ASISTENCIA_TEMP_CIX --WHERE FECHA = convert(char(10), GETDATE(), 120) AND COD_ASI_TEM LIKE 'CIX%'    
  
DECLARE @xRutDir nvarchar(500)  
DECLARE @xCadenaDEL nvarchar(500)  
  
set @xRutDir = 'D:\DROPBOX\'  
set @xCadenaDEL = 'del'+' '+ @xRutDir+'*.txt'  
  
exec master..xp_cmdshell @xCadenaDEL        
  
--1.- FIN  
/*----------------------------------------------------------------------------------------------------------*/  
/*************| ELIMINAMOS LOS DATOS DE LA TABLA TEMPORAL CIX Y DE LA CARPETA DROPBOX |**********************/  
/*----------------------------------------------------------------------------------------------------------*/  
  
/*********************************************************************************************************************************************************************************************/  
  
--2.- INICIO  
/*----------------------------------------------------------------------------------------------------------*/  
/********************| VERIFICAMOS EN DIRECTORIO SI EXISTE CARPETA DROPBOX, SINO CREAR |*********************/  
/*----------------------------------------------------------------------------------------------------------*/  
  
DECLARE  
@RUTA_BASE VARCHAR(500),      
@NombreDir VARCHAR(10)   
    
set @NombreDir = 'DROPBOX'     
set @RUTA_BASE  ='D:\'+@NombreDir      
  
DECLARE @Existe int                
EXEC master..xp_fileexist @RUTA_BASE , @Existe OUT                
  
IF @Existe = 0                
begin                
DECLARE @FOLDER_ORIGEN nvarchar(555)                
set @FOLDER_ORIGEN  ='mkdir '+@RUTA_BASE                
EXEC master..xp_cmdshell @FOLDER_ORIGEN, no_output                
end    
  
--2.- FIN  
/*----------------------------------------------------------------------------------------------------------*/  
/********************| VERIFICAMOS EN DIRECTORIO SI EXISTE CARPETA DROPBOX, SINO CREAR |*********************/  
/*----------------------------------------------------------------------------------------------------------*/  
  
/*********************************************************************************************************************************************************************************************/  
  
--3.- INICIO  
/*----------------------------------------------------------------------------------------------------------*/  
/********************| VERIFICAMOS EN DIRECTORIO SI EXISTE CARPETA DROPBOX, SINO CREAR |*********************/  
/*----------------------------------------------------------------------------------------------------------*/  
  
declare @xRutDropbox nvarchar(500)  
declare @xRutDestinoD nvarchar(500)  
declare @xCopyFinal nvarchar(500)  
  
set @xRutDropbox = 'C:\Users\Administrator\Dropbox\ASISTENCIA\'  
set @xRutDestinoD = 'D:\DROPBOX\'  
set @xCopyFinal = 'copy' + ' '+@xRutDropbox+'*.txt'+' '+@xRutDestinoD  
  
exec master..xp_cmdshell @xCopyFinal  
  
--3.- FIN  
/*----------------------------------------------------------------------------------------------------------*/  
/********************| VERIFICAMOS EN DIRECTORIO SI EXISTE CARPETA DROPBOX, SINO CREAR |*********************/  
/*----------------------------------------------------------------------------------------------------------*/  
  
/*********************************************************************************************************************************************************************************************/  
  
--4.- INICIO  
/*----------------------------------------------------------------------------------------------------------*/  
/*********************| REALIZAMOS EL INSERT EN LA TABLA TEMPORAL Y LUEGO MIGRAR INFO |**********************/  
/*----------------------------------------------------------------------------------------------------------*/  
      
-- PARA ASISTENCIA_TEMP  
BULK INSERT ASISTENCIA_TEMP_CIX FROM 'D:\DROPBOX\ASISTENCIA_TEMP.txt' WITH ( FIELDTERMINATOR = '|', ROWTERMINATOR = ',')           
  
--4.- FIN  
/*----------------------------------------------------------------------------------------------------------*/  
/*********************| REALIZAMOS EL INSERT EN LA TABLA TEMPORAL Y LUEGO MIGRAR INFO |**********************/  
/*----------------------------------------------------------------------------------------------------------*/  
  
/*********************************************************************************************************************************************************************************************/  
  
--5.- INICIO  
/*----------------------------------------------------------------------------------------------------------*/  
/*********************| REALIZAMOS EL INSERT A LA TABLA REAL PARA LA MIGRACION DE CIX |**********************/  
/*----------------------------------------------------------------------------------------------------------*/  
     
--D.        
-- DELETEAMOS LOS DATOS QUE EXISTAN DEL DIA ACTUAL Y VOLVEMOS A INGRESAR LOS DATOS CON UN INSERT        
        
/** DELETEAMOS LOS REGISTOS CON FECHA ACTUAL **/        
DELETE         
FROM ASISTENCIA_TEMP WHERE FECHA = convert(char(10), GETDATE(), 120) AND COD_ASI_TEM LIKE 'CIX%'        
  
/** RECARGAMOS LOS DATOS CON LOS DATOS DEL FTP DESCARGADOS **/        
        
INSERT INTO ASISTENCIA_TEMP         
(COD_ASI_TEM, COD_PER_EMP, HORA_ENT, HORA_SAL, HORA_ENT_REF, HORA_SAL_REF, COMENTARIO, HORAS_REF, HORAS, FECHA, EST_REF, EST_ASIS, EMP_COD, PER_COD, LOC_COD, COD_LOC_PER, COD_ASI)        
        
SELECT COD_ASI_TEM, COD_PER_EMP, HORA_ENT, HORA_SAL, HORA_ENT_REF, HORA_SAL_REF, COMENTARIO, HORAS_REF, HORAS, FECHA, EST_REF, EST_ASIS, EMP_COD, PER_COD, LOC_COD, COD_LOC_PER, COD_ASI        
FROM ASISTENCIA_TEMP_CIX WHERE FECHA = convert(char(10), GETDATE(), 120) AND COD_ASI_TEM LIKE 'CIX%'        
  
--5.- INICIO  
/*----------------------------------------------------------------------------------------------------------*/  
/*********************| REALIZAMOS EL INSERT A LA TABLA REAL PARA LA MIGRACION DE CIX |**********************/  
/*----------------------------------------------------------------------------------------------------------*/  