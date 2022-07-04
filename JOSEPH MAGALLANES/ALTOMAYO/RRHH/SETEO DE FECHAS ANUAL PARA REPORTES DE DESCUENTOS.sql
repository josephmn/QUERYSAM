
--INSERT INTO zGrupoFechaSemanal
--([NroSemana], [Descr], [FechaCorta1], [FechaCorta2], [FechaCorta3], [FechaCorta4], [FechaCorta5], [FechaCorta6], [FechaCorta7], [Date1], 
--[Date2], [Date3], [Date4], [Date5], [Date6], [Date7], [User1], [User2], [User3], [User4], [User5])

--SELECT [NroSemana], [Descr], [FechaCorta1], [FechaCorta2], [FechaCorta3], [FechaCorta4], [FechaCorta5], [FechaCorta6], [FechaCorta7], [Date1], 
--[Date2], [Date3], [Date4], [Date5], [Date6], [Date7], [User1], [User2], [User3], [User4], [User5] FROM zGrupoFechaSemanal2


INSERT INTO zGrupoFechaSemanal
([NroSemana], [Descr], [FechaCorta1], [FechaCorta2], [FechaCorta3], [FechaCorta4], [FechaCorta5], [FechaCorta6], [FechaCorta7], [Date1], 
[Date2], [Date3], [Date4], [Date5], [Date6], [Date7], [User1], [User2], [User3], [User4], [User5])

SELECT [NroSemana], [Descr], [FechaCorta1], [FechaCorta2], [FechaCorta3], [FechaCorta4], [FechaCorta5], [FechaCorta6], [FechaCorta7], [Date1], 
[Date2], [Date3], [Date4], [Date5], [Date6], [Date7], [User1], [User2], [User3], [User4], [User5] FROM [AM2021APP]..zGrupoFechaSemanal

--DROP TABLE zGrupoFechaSemanal2

--SELECT * INTO zGrupoFechaSemanal2 FROM zGrupoFechaSemanal
--truncate table zGrupoFechaSemanal
--update zGrupoFechaSemanal set NroSemana = 1, FECHACORTA1 = '', FECHACORTA2 = '', DATE1 = '', DATE2 = ''

-- PASO 1 . -  CREAR LOS DATOS PARA LA INSERSION DEL NUEVO AÑO 2019

declare @NroSemana int
declare @FechaIni smalldatetime
declare @FechaFin smalldatetime
declare @FechaCorta Char(8)
declare @Cdias int 
declare @Csemana int 
--set @FechaCorta = '20200106'
set @Cdias  = 0 
set @Csemana  = 2

DECLARE CUR_MITABLA CURSOR FOR
SELECT DISTINCT CAST(NroSemana as int) NroSemana, FechaInicio, FechaFin FROM FechaPlanProduccion where NroSemana >= 2 --ORDER BY CAST(NroSemana as int) ASC
--SELECT '1' NroSemana, '2019-12-30'FechaInicio,'2020-01-05'FechaFin
OPEN CUR_MITABLA 
	FETCH CUR_MITABLA INTO @Nrosemana, @FechaIni,@FechaFin
      WHILE (@@FETCH_STATUS = 0 )
      BEGIN -- WHILE    
			--WHILE (@FechaIni <= @FechaFin)      
			--BEGIN  
			
			--print @fechaini + ''

			--set @Cdias  = @Cdias  +1    
			--if @Cdias = 8  
			--	begin
			--		set @Cdias  = 1         
			--		set @Csemana  = @Csemana + 1 
			--	end
			--select NroSemana, Descr, FechaCorta1, FechaCorta2, FechaCorta3, FechaCorta4, FechaCorta5, FechaCorta6, FechaCorta7, 
			--Date1, Date2, Date3, Date4, Date5, Date6, Date7 from zGrupoFechaSemanal ORDER BY NroSemana ASC

			SET LANGUAGE SPANISH

			insert into zGrupoFechaSemanal 
			(NroSemana, Descr, FechaCorta1, FechaCorta2, FechaCorta3, FechaCorta4, FechaCorta5, FechaCorta6, FechaCorta7, Date1, Date2, Date3, Date4, Date5, Date6, Date7, User1)

			select DATEPART(WEEK,@FechaIni), '', 
			DATENAME(WEEKDAY,@FechaIni)+' '+LEFT(CONVERT(VARCHAR(10),@FechaIni,103),5) FechaCorta1, 
			DATENAME(WEEKDAY,dateadd(day,1,@FechaIni))+' '+LEFT(CONVERT(VARCHAR(10),dateadd(day,1,@FechaIni),103),5) FechaCorta2, 
			DATENAME(WEEKDAY,dateadd(day,2,@FechaIni))+' '+LEFT(CONVERT(VARCHAR(10),dateadd(day,2,@FechaIni),103),5) FechaCorta3, 
			DATENAME(WEEKDAY,dateadd(day,3,@FechaIni))+' '+LEFT(CONVERT(VARCHAR(10),dateadd(day,3,@FechaIni),103),5) FechaCorta4, 
			DATENAME(WEEKDAY,dateadd(day,4,@FechaIni))+' '+LEFT(CONVERT(VARCHAR(10),dateadd(day,4,@FechaIni),103),5) FechaCorta5, 
			DATENAME(WEEKDAY,dateadd(day,5,@FechaIni))+' '+LEFT(CONVERT(VARCHAR(10),dateadd(day,5,@FechaIni),103),5) FechaCorta6, 
			DATENAME(WEEKDAY,dateadd(day,6,@FechaIni))+' '+LEFT(CONVERT(VARCHAR(10),dateadd(day,6,@FechaIni),103),5) FechaCorta7, 
			@FechaIni Date1, 
			dateadd(day,1,@FechaIni) Date2, 
			dateadd(day,2,@FechaIni) Date3, 
			dateadd(day,3,@FechaIni) Date4, 
			dateadd(day,4,@FechaIni) Date5, 
			dateadd(day,5,@FechaIni) Date6, 
			dateadd(day,6,@FechaIni) Date7,
			YEAR(GETDATE())
			--from zGrupoFechaSemanal

			select @FechaIni = (select dateadd(day,1,@FechaIni))
			Select @FechaCorta = (select CONVERT(VARCHAR(20), @FechaIni, 112))  

			--END
	   FETCH CUR_MITABLA INTO @Nrosemana, @FechaIni, @FechaFin
      END -- END WHILE
CLOSE CUR_MITABLA
DEALLOCATE CUR_MITABLA


-- PASO 2 . - UPDATE PARA COLOCAR LA DESCRIPCION DE LAS FECHAS POR SEMANA

select * 
-- UPDATE A SET A.Descr = B.descripcion
from zGrupoFechaSemanal A inner join 
(
SELECT NroSemana, Date1, Date7, 'Del ' + LEFT(CONVERT(VARCHAR(10),Date1,103),5)+' hasta '+LEFT(CONVERT(VARCHAR(10),Date7,103),5) descripcion
FROM zGrupoFechaSemanal
) B on A.NroSemana = B.NroSemana

-- PASO 4 . - VERIFICAMOS CON UN SELECT
--update zGrupoFechaSemanal set FECHACORTA6 = '', FECHACORTA7 = '', DATE6 = '', DATE7 = ''
----update zGrupoFechaSemanal set NroSemana = 1, FECHACORTA1 = '', FECHACORTA2 = '', FECHACORTA3 = '', FECHACORTA4 = '', DATE1 = '', DATE2 = '', DATE3 = '', DATE4 = ''
--WHERE NroSemana = 53

-- UPDATE zGrupoFechaSemanal SET USER1 = 2020 WHERE USER1 IS NULL

SELECT * FROM zGrupoFechaSemanal
