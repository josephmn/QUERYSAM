USE MASTER
GO

declare @cadena1 varchar(10), @conjunto varchar(100)

set @cadena1 = (select 'AM'+CONVERT(VARCHAR(10),YEAR(GETDATE()),105)+'APP')

PRINT @CADENA1


set @conjunto = (select 'select * from [ALTOMAYO-DATA].'+@cadena1+'.dbo.State')

print @conjunto


--EXEC XCMD_SHELL @conjunto