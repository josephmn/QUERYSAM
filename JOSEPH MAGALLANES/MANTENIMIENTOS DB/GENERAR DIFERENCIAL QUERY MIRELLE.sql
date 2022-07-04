
exec BACKUP_DIFERENCIALES_BD 'D:\bd_prueba\','Diferencial_Asistencia'


alter PROCEDURE [dbo].[BACKUP_DIFERENCIALES_BD]
@RutaOrigen varchar(MAX),
@SubCarpeta varchar(MAX)
as

/*--------------------------------------------------------------------
  Archivo ...... : pa_Backups_procesar_BACKUP_DIFERENCIAL
  Creado ....... : 07/08/2015	
  Versión ...... : 1.0
  Módulo ....... : SEGURIDAD DE LA INFORMACION
  Proyecto ..... : 
  Descripción .. : RESPALDOS DIFERENCIALES DIARIOS
---------------------------------------------------------------------
  LOG:
  FECHA       AUTOR  DESCRIPCION
  ---------- ------ --------------------------------------------------
  2015-09-21   MCC	CAMBIO DE NOMENCLATURA DE BACKUP

  ---------------------------------------------------------------------
*/

/* 
declare @SubCarpeta varchar(20)='BAK3_HIST'
exec pa_Backups_procesar_BACKUP_DIFERENCIAL 'BAK3_HIST'
*/

DECLARE @BackupArchivo varchar(255), @DB varchar(150), @Descripcion varchar(355), @ArchivoAuditoria varchar(150),
		@fechaOperacion datetime
DECLARE @Nombre varchar(150), @MediaName varchar(100), @BackupCarpeta nvarchar(200), @nombre_Ext varchar(35)

--DECLARACION DE SEMANA--------------------------------------------
declare @week as varchar(3)
set @week =DATEPART(week,getdate())
--select @week

--DECLARACION DE HORA--------------------------------------------
declare @hora varchar(5)
set @hora =replace(CONVERT(varchar, CURRENT_TIMESTAMP , 108),':','_')
--select @hora

---UBICACION-----------------------------------------------------
SET @BackupCarpeta= LTRIM(RTRIM(@RutaOrigen)) + LTRIM(RTRIM(@SubCarpeta)) + '\'

DECLARE CursorBasesDeDatos CURSOR FOR 
SELECT name FROM sys.databases
--WHERE name in ('HOGARURAL_BDCAPTURA')
--WHERE name not in ('tempdb','ReportServer$IVCENAGRO','ReportServer$IVCENAGROTempDB','master','model','msdb')
WHERE name in ('ASISTENCIA_AM')
and name not like 'TMP_%'
and is_read_only = 0
--name like 'HOGAR%' 
order by name 

OPEN CursorBasesDeDatos
FETCH next FROM CursorBasesDeDatos INTO @DB
WHILE @@fetch_status = 0

BEGIN
SET @Nombre = 'BACKUP DIARIO - <'+ LTRIM(RTRIM(@SubCarpeta)) + '>'
--SET @FECHA_C = CONVERT(VARCHAR,CURRENT_TIMESTAMP,112)
--select @nombre_Ext = master.[dbo].[fn_NombreBackup](GETDATE(),2)
IF @SubCarpeta <> 'BAK3_HIST'
	SET @BackupArchivo = @BackupCarpeta+'['+@@SERVERNAME+']-'+ @DB + '-[' +
		'SEM'+@week+'_'+convert(varchar(8),GETDATE(),112) +']-'+@hora + '_DIF.Bak'
ELSE
	SET @BackupArchivo = @BackupCarpeta+'['+@@SERVERNAME+']-'+ @DB + '-[' +
		'SEM'+@week+'_'+convert(varchar(8),GETDATE(),112) +']-'+@hora + '_DIF.Bak'


SET @Descripcion = 'BACKUP_DIFERENCIAL' 
SET @fechaOperacion  = CURRENT_TIMESTAMP


BACKUP DATABASE @DB TO DISK = @BackupArchivo 
	WITH NAME = @Nombre, DESCRIPTION = @Descripcion ,
	MEDIADESCRIPTION = @Descripcion , DIFFERENTIAL, STATS = 10

--INSERT INTO INEI_BDAUDITORIA..AUDI_BACKUPS
--SELECT @DB , @BackupArchivo , @Nombre, @Descripcion, @fechaOperacion  


FETCH next FROM CursorBasesDeDatos INTO @DB
END
CLOSE CursorBasesDeDatos
DEALLOCATE CursorBasesDeDatos

