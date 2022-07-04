CREATE PROC PUT_DROPBOX 

/***************************************************************************/
--|	 DESCRIPCION :  DROPBOX													|
--|		 FUNCION :	OBTENER ARCHIVOS DE TEXTO PLANO Y SUBIRLOS AL DROPBOX	|
--|		   AUTOR :	JOSEPH MAGALLANES NOLAZCO								|
--|		    AREA :	SISTEMAS ALTOMAYO										|
--| PROGRAMACION :	ASISTENCIA AM											|
/***************************************************************************/

AS    

--1.- INICIO
/*----------------------------------------------------------------------------------------------------------*/
/*******************************| VERIFICACION DE CARPETA DROPBOX EN UNIDAD E |******************************/
/*----------------------------------------------------------------------------------------------------------*/

/*** CARPETA DROPBOX CREADO EN UNIDAD ***/
DECLARE
@RUTA_BASE VARCHAR(500),    
@NombreDir VARCHAR(10) 
  
set @NombreDir = 'DROPBOX'   
set @RUTA_BASE  ='E:\'+@NombreDir    

DECLARE @Existe int              
EXEC master..xp_fileexist @RUTA_BASE , @Existe OUT              

IF @Existe = 0              
begin              
DECLARE @FOLDER_ORIGEN nvarchar(555)              
set @FOLDER_ORIGEN  ='mkdir '+@RUTA_BASE              
EXEC master..xp_cmdshell @FOLDER_ORIGEN, no_output              
end  

/*** CARPETA CREADA PARA EL DROPBOX EN DROPBOX ***/
DECLARE @RUTA_DROPBOX VARCHAR(500)
DECLARE @NombreDROPBOX VARCHAR(10) 
  
set @NombreDROPBOX = 'ASISTENCIA'   
set @RUTA_DROPBOX  ='C:\Users\PC1\Dropbox\'+@NombreDROPBOX    

DECLARE @ExisteD int              
EXEC master..xp_fileexist @RUTA_DROPBOX , @ExisteD OUT              

IF @ExisteD = 0              
begin              
DECLARE @FOLDER_ORIGEN_D nvarchar(555)              
set @FOLDER_ORIGEN_D  ='mkdir'+' '+@RUTA_DROPBOX              
EXEC master..xp_cmdshell @FOLDER_ORIGEN_D, no_output              
end  

--1.- FIN
/*----------------------------------------------------------------------------------------------------------*/
/*******************************| VERIFICACION DE CARPETA DROPBOX EN UNIDAD E |******************************/
/*----------------------------------------------------------------------------------------------------------*/

/*********************************************************************************************************************************************************************************************/

--2.- INICIO
/*----------------------------------------------------------------------------------------------------------*/
/*******************************| LIMPIAMOS REGISTROS ANTIGUOS EN EL DROPBOX |*******************************/
/*----------------------------------------------------------------------------------------------------------*/

DECLARE @xRutDir nvarchar(500)
DECLARE @xCadenaDEL nvarchar(500)

set @xRutDir = 'C:\Users\PC1\Dropbox\ASISTENCIA\'
set @xCadenaDEL = 'del'+' '+ @xRutDir+'*.txt'

exec master..xp_cmdshell @xCadenaDEL

--2.- FIN 
/*----------------------------------------------------------------------------------------------------------*/
/*******************************| LIMPIAMOS REGISTROS ANTIGUOS EN EL DROPBOX |*******************************/
/*----------------------------------------------------------------------------------------------------------*/

/*********************************************************************************************************************************************************************************************/

 --3.- INICIO
/*----------------------------------------------------------------------------------------------------------*/
/*******************************| LIMPIAMOS REGISTROS ANTIGUOS EN EL DROPBOX |*******************************/
/*----------------------------------------------------------------------------------------------------------*/

-- PARA LA TABLA DE ASISTENCIA_TEMP  
exec master..xp_cmdshell 'bcp "select COD_ASI_TEM, COD_PER_EMP, HORA_ENT, HORA_SAL, HORA_ENT_REF, HORA_SAL_REF, COMENTARIO, HORAS_REF, HORAS, FECHA, EST_REF, EST_ASIS, EMP_COD, PER_COD, LOC_COD, COD_LOC_PER, COD_ASI from [AMRRHH_CIX].dbo.ASISTENCIA_TEMP WHERE FECHA = convert(char(10), GETDATE(), 120)" queryout "E:\DROPBOX\ASISTENCIA_TEMP.txt" -S ASISTENCIA-CIX\ASIS_CIX -U sa -P 123456 -c -t"|" -r,'    
    
-- PARA LA TABLA DE LOCAL_PERSONAL  
exec master..xp_cmdshell 'bcp "SELECT COD_LOC_PER, LOC_COD, PER_COD FROM [AMRRHH_CIX].dbo.LOCAL_PERSONAL" queryout "E:\DROPBOX\LOCAL_PERSONAL.txt" -S ASISTENCIA-CIX\ASIS_CIX -U sa -P 123456 -c -t"|" -r,'  
  
-- PARA LA TABLA PERSONAL  
exec master..xp_cmdshell 'bcp "SELECT PER_COD, PER_APE_PAT, PER_APE_MAT, PER_NOM, PER_FEC_NAC, PER_SEX, EC_COD, PER_DIR, TDOC_COD, NRO_DOC, PER_FEC_ING, BA_COD, PER_NUM_CTA, RGP_COD, NUM_HIJOS, LOC_COD, AREA_COD, COD_TCON, CC_COD, CAR_COD, PER_FOTO, PER_EST, FEC_REG, FEC_MOD, USU_REG, USU_MOD, CIERRE, NULL Template, NULL Template10, ID_PERSONAL, MAR_HUELLA, MAR_DNI FROM [AMRRHH_CIX].dbo.PERSONAL" queryout "E:\DROPBOX\PERSONAL.txt" -S ASISTENCIA-CIX\ASIS_CIX -U sa -P 123456 -c -t"|" -r,'  


--3.- FIN
/*----------------------------------------------------------------------------------------------------------*/
/******************************| EJECUCION PARA GUARDAR LA CONSULTA EN UN TXT |******************************/
/*----------------------------------------------------------------------------------------------------------*/

/*********************************************************************************************************************************************************************************************/

 --4.- INICIO
/*----------------------------------------------------------------------------------------------------------*/
/**********************************| EJECUCION PARA EL COPIADO AL DROPBOX |**********************************/
/*----------------------------------------------------------------------------------------------------------*/  

-- USANDO DROPBOX (COPIAR ARCHIVOS GENERADOS EN UNA CARPETA DIFERENTE PARA LUEGO COPIARLOS AHI)

declare @xRutDropbox nvarchar(500)
declare @xRutOrigenCIX nvarchar(500)
declare @xCopyFinal nvarchar(500)

set @xRutDropbox = 'C:\Users\PC1\Dropbox\ASISTENCIA\'
set @xRutOrigenCIX = 'E:\DROPBOX\*.txt'
set @xCopyFinal = 'copy' + ' '+@xRutOrigenCIX+' '+@xRutDropbox

exec master..xp_cmdshell @xCopyFinal

 --4.- FIN
/*----------------------------------------------------------------------------------------------------------*/
/**********************************| EJECUCION PARA EL COPIADO AL DROPBOX |**********************************/
/*----------------------------------------------------------------------------------------------------------*/  

/*********************************************************************************************************************************************************************************************/
