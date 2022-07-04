
-- delete from FechaPlanProduccion where fechaact > = '2021-01-03'
-- truncate table FechaPlanProduccion
select * from FechaPlanProduccion

--truncate table FechaPlanProduccion
--drop table FechaPlanProduccion
--PASO 1
declare @FechaIni smalldatetime
declare @FechaFin smalldatetime
declare @FechaCorta Char(8)
declare @Cdias int 
declare @Csemana int 
set @FechaCorta = '20210104'
set @Cdias  = 0 
set @Csemana  = 2

DECLARE CUR_MITABLA CURSOR FOR
SELECT '2021-01-04'FechaInicio,'2021-12-31'FechaFin
OPEN CUR_MITABLA 
	FETCH CUR_MITABLA INTO @FechaIni,@FechaFin
      WHILE (@@FETCH_STATUS = 0 )
      BEGIN -- WHILE    
			WHILE (@FechaIni <= @FechaFin)      
			BEGIN  
			print @fechaini + ''
			set @Cdias  = @Cdias  +1    
			if @Cdias = 8  
				begin
					set @Cdias  = 1         
					set @Csemana  = @Csemana + 1 
				end
                    
				insert into FechaPlanProduccion (FechaAct,NroSemana,Descr,FechaCorta)
				values (@FechaIni , @Csemana,'',@FechaCorta)      
        
				select @FechaIni = (select dateadd(day,1,@FechaIni))
				Select @FechaCorta = (select CONVERT(VARCHAR(20), @FechaIni, 112))       
			END

	FETCH CUR_MITABLA INTO @FechaIni,@FechaFin
    END-- END WHILE
CLOSE CUR_MITABLA
DEALLOCATE CUR_MITABLA
--select * from  FechaPlanProduccion

--PASO 2
update H set 
--select 
H.descr = Descri, H.FechaInicio = x.FechaInicio , H.FechaFin = x.FechaFin
from FechaPlanProduccion H
inner join (

select nrosemana, MIN(fechaact)desde, MAX(fechaact)hasta, (
'del ' + SUBSTRING(LEFT(CONVERT(VARCHAR,MIN(fechaact), 120), 10),9,5) +'-'+ SUBSTRING(LEFT(CONVERT(VARCHAR,MIN(fechaact), 120), 10),6,2)+
 ' hasta '+ SUBSTRING(LEFT(CONVERT(VARCHAR,MAX( fechaact), 120), 10),9,5) +'-'+ SUBSTRING(LEFT(CONVERT(VARCHAR,MAX( fechaact), 120), 10),6,2) 
 )Descri , MIN(fechaact)FechaInicio, MAX(fechaact)FechaFin
from FechaPlanProduccion --where NroSemana in (1,2)
group by nrosemana 

)X on H.nrosemana  = X.nrosemana 

--sp_help FechaPlanProduccion


--update H set H.descr = Descri
--from fechadespacho H
--inner join (
--select nrosemana, MIN(fechaact)desde, MAX(fechaact)hasta ,(
--'del '  + SUBSTRING( LEFT(CONVERT(VARCHAR,MIN( fechaact), 120), 10),6,5) + 
-- ' hasta '+ SUBSTRING( LEFT(CONVERT(VARCHAR,MAX( fechaact), 120), 10),6,5) )Descri
--from fechadespacho
--group by nrosemana
--)X on H.nrosemana  = X.nrosemana


select  * into FechaPlanProducciontemp1  from  FechaPlanProduccion

--drop table FechaPlanProducciontemp

select  * from  FechaPlanProducciontemp 
insert into FechaPlanProduccion  ( FechaAct, NroSemana, Descr, FechaCorta, FechaInicio, FechaFin, user1, user2, user3)
select   FechaAct, NroSemana, Descr, FechaCorta, FechaInicio, FechaFin, user1, user2, user3  from FechaPlanProducciontemp 



