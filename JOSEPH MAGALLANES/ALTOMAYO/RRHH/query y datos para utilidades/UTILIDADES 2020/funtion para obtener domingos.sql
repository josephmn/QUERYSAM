CREATE FUNCTION devolver_domingos
(
@FechaIni datetime, 
@FechaFin datetime
)
RETURNS int
AS

BEGIN
	DECLARE @domingos int=0;
	WHILE @FechaIni <= @FechaFin
		BEGIN  
		   if datepart(dw, @FechaIni) in (1) 
		   SET @domingos=@domingos+1
		   set @FechaIni=dateadd(dd,1,@FechaIni)
		END  
	RETURN @domingos
END