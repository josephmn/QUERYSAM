
declare @datadiff nvarchar(max)
declare @fileDate varchar(8)
declare @hora CHAR(6)

declare @ruta nvarchar(max)
declare @send nvarchar(max)

SET @fileDate = CONVERT(VARCHAR(20), GETDATE(), 112)
SET @hora = (REPLACE(CONVERT(VARCHAR(8),getdate(),108),':',''))

set @ruta = 'D:\bd_prueba\Diferencial_Asistencia\ASISTENCIA_'+@fileDate+'_'+@hora+'.BAK'
set @send = 'ASISTENCIA_AM-Full Database Backup'
--set @datadiff = '''BACKUP DATABASE [ASISTENCIA_AM] TO DISK = N''D:\bd_prueba\Diferencial_Asistencia\ASISTENCIA_AM_'+@fileDate+'_'+@hora+'.BAK'' WITH  DIFFERENTIAL , NOFORMAT, NOINIT, NAME = N''ASISTENCIA_AM-Full Database Backup'', SKIP, NOREWIND, NOUNLOAD, STATS = 10'''

set @datadiff = 'BACKUP DATABASE [ASISTENCIA_AM] TO DISK = N'''+@ruta+''' WITH  DIFFERENTIAL , NOFORMAT, NOINIT, NAME = N'''+@send+''', SKIP, NOREWIND, NOUNLOAD, STATS = 10'

--set language english

--PRINT @databasebackupcode
execute sp_executesql @datadiff

--''BACKUP DATABASE [ASISTENCIA_AM] TO DISK = N''D:\bd_prueba\Diferencial_Asistencia\ASISTENCIA_AM_''20190306''_'093750'+.BAK'' WITH  DIFFERENTIAL , NOFORMAT, NOINIT, NAME = N'ASISTENCIA_AM-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10''

--'BACKUP DATABASE [ASISTENCIA_AM] TO DISK = N'D:\bd_prueba\Diferencial_Asistencia\ASISTENCIA_AM_'+@fileDate+'_'+@hora+'+.BAK' WITH  DIFFERENTIAL , NOFORMAT, NOINIT, NAME = N'ASISTENCIA_AM-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10'








