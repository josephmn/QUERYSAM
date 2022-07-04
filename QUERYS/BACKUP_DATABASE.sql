set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BACKUP_AM2015APP]
AS
BEGIN TRY
		SET NOCOUNT ON
BEGIN
--Here is an alternative method using an indentity field on the temp table to prevent unnecessary select / update statements in the while loop!
DECLARE @name VARCHAR(50), -- database name
@path VARCHAR(256), -- path for backup files
@fileName VARCHAR(256), -- filename for backup
@fileDate VARCHAR(20), -- used for file name
@backupCount INT

CREATE TABLE [dbo].#tempBackup (intID INT IDENTITY (1, 1), name VARCHAR(200))
SET @path = 'E:\BACKUPS\'
-- Includes the date in the filename
SET @fileDate = CONVERT(VARCHAR(20), GETDATE(), 112)
-- Includes the date and time in the filename
--SET @fileDate = CONVERT(VARCHAR(20), GETDATE(), 112) + '_' + REPLACE(CONVERT(VARCHAR(20), GETDATE(), 108), ':', '')
INSERT INTO [dbo].#tempBackup (name)
SELECT name
FROM master.dbo.sysdatabases
WHERE name  IN ('AM2015APP')
SELECT TOP 1 @backupCount = intID FROM [dbo].#tempBackup ORDER BY intID DESC
IF ((@backupCount IS NOT NULL) AND (@backupCount > 0))
BEGIN
DECLARE @currentBackup INT

SET @currentBackup = 1
WHILE (@currentBackup <= @backupCount)
BEGIN
SELECT
@name = name,
@fileName = @path + name + '_' + @fileDate + '.BAK' -- Unique FileName
--@fileName = @path + @name + '.BAK' -- Non-Unique Filename
FROM [dbo].#tempBackup
WHERE intID = @currentBackup
-- does not overwrite the existing file
BACKUP DATABASE @name TO DISK = @fileName
-- overwrites the existing file (Note: remove @fileDate from the fileName so they are no longer unique
--BACKUP DATABASE @name TO DISK = @fileName WITH INIT
SELECT @filename AS DIRECCION ,@name+'_'+@fileDate+'.BAK' AS NOMBRE

SET @currentBackup = @currentBackup + 1
END
END
DROP TABLE [dbo].#tempBackup
END
SET NOCOUNT OFF
END TRY
BEGIN CATCH
	DECLARE @ErrorMessage VARCHAR(4000), @ErrorNumber INT, @ErrorSeverity INT,
	@ErrorState INT, @ErrorLine INT, @ErrorProcedure VARCHAR(200);		
	SELECT @ErrorNumber = ERROR_NUMBER(), 
	@ErrorSeverity = ERROR_SEVERITY(),
	@ErrorState = ERROR_STATE(),
	@ErrorLine = ERROR_LINE(),
	@ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-');
	SELECT @ErrorMessage = N'Error:%d|Nivel %d|Estado %d|Procedimiento %s|Linea %d|' + 
							'Mensaje: '+ ERROR_MESSAGE()
	RAISERROR(@ErrorMessage, @ErrorSeverity, 1, @ErrorNumber, 
		@ErrorSeverity,@ErrorState, @ErrorProcedure, @ErrorLine)
		SELECT 'NO GENERADO' AS NO_GENERADO, @ErrorMessage AS ERROR_MENS
END CATCH



