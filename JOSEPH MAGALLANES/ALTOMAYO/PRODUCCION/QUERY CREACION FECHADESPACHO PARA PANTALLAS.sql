--truncate table fechadespacho
--go
--paso 1
declare @FechaIni smalldatetime
declare @FechaFin smalldatetime
declare @Cdias int 
declare @Csemana int 
set @Cdias  = 0 
set @Csemana  = 1 

DECLARE CUR_MITABLA CURSOR FOR
SELECT '2019-01-01'FechaInicio,'2019-12-31'FechaFin
OPEN CUR_MITABLA 
FETCH CUR_MITABLA INTO @FechaIni,@FechaFin
      WHILE (@@FETCH_STATUS = 0 )
      BEGIN -- WHILE    
    WHILE (@FechaIni <=@FechaFin)      
      BEGIN  
      print @fechaini + ''
        set @Cdias  = @Cdias  +1    
        if @Cdias = 8  
        begin
        set @Cdias  = 1         
        set @Csemana  = @Csemana + 1 
        end
                    
        insert into FechaDespacho (FechaAct,NroSemana)
        values (@FechaIni , @Csemana)      
        select @FechaIni = (select dateadd(day,1,@FechaIni))       
      END

      FETCH CUR_MITABLA INTO @FechaIni,@FechaFin
      END-- END WHILE
CLOSE CUR_MITABLA
DEALLOCATE CUR_MITABLA
select * from  FechaDespacho
-- paso 2
update H set H.descr = Descri
from fechadespacho H
inner join (
select nrosemana, MIN(fechaact)desde, MAX(fechaact)hasta ,(
'del '  + SUBSTRING( LEFT(CONVERT(VARCHAR,MIN( fechaact), 120), 10),6,5) + 
 ' hasta '+ SUBSTRING( LEFT(CONVERT(VARCHAR,MAX( fechaact), 120), 10),6,5) )Descri
from fechadespacho
group by nrosemana
)X on H.nrosemana  = X.nrosemana
