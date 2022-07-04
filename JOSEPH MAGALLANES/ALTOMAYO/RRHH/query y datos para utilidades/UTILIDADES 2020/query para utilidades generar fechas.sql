
SELECT DATEPART(WEEKDAY,'2021-01-03')


SELECT * FROM zGrupoFechaSemanal

SELECT (DATEDIFF(DAY,'2021-01-01','2021-01-31')+1)



SELECT DATEPART(yy, '2021-01-01')
SELECT DATEPART(MM, '2021-01-01')
SELECT DATENAME(MM, '2021-01-01')

-- drop table DiaUtilidades
create table DiaUtilidades
(
fecha date,
dia int,
mes int,
ahio int,
numerosemana int,
nombredia varchar(20)
)

-- truncate table DiaUtilidades
declare @begdate as datetime
declare @enddate as datetime
declare @diff as int

set @begdate = (select '2020-01-01')
set @enddate = (select '2020-12-31')
set @diff = datediff(day, @begdate ,@enddate)

while (@begdate <= @enddate) --insertar el registro hasta que fecha inicio y fin sean iguales
begin
        insert into DiaUtilidades 
		(fecha, dia, mes, ahio, numerosemana, nombredia)
        values  
		(@begdate, DATEPART(DAY,@begdate), DATEPART(MONTH,@begdate), DATEPART(YEAR,@begdate), DATEPART(WEEKDAY,@begdate), '')

	set @begdate = dateadd(day,1,@begdate) --vamos incrementando los días
end


--update DiaUtilidades set dia = DATEPART(DAY,fecha)
--update DiaUtilidades set mes = DATEPART(MONTH,fecha)
--update DiaUtilidades set ahio = DATEPART(YEAR,fecha)
--update DiaUtilidades set numerosemana = DATEPART(WEEKDAY,fecha)


select count(*) from DiaUtilidades
select count(*) from DiaUtilidades where numerosemana = 1


select (select count(*) from DiaUtilidades) - (select count(*) from DiaUtilidades where numerosemana = 1)


select B.fecha, A.* 
from PAAsistD A
INNER JOIN PAAsistH B ON A.asistid = B.asistid
WHERE B.perpost = '202001' AND perid = '72130767'






