




sp_helptext rpt_inct_cobranza

select periodoPago ,Periodo ,supervisor,s.name,round(convert(decimal,cuota),2)cuota,round(convert(decimal,cobrado),2)cobrado,round(convert(decimal,avance),0)avance,
isnull((select max(cobr) 
from NuevosIncentivos where  periodo= C.periodoPago and tipo = 10 
 and SubTipo = 1  and porc <= round(avance,0)),0) InctCobranza  
from vs_avanceCobranza C  inner join salesperson S on C.supervisor = S.slsperid  
and periodoPago = '201605' and periodo ='201606'




select periodoPago ,Periodo ,supervisor,s.name,round(convert(decimal,cuota),2)cuota,round(convert(decimal,cobrado),2)cobrado,round(convert(decimal,avance),0)avance,
isnull((select max(cobr) 
from NuevosIncentivos where   tipo = 10 
 and SubTipo = 1  and porc <= round(avance,0)),0) InctCobranza  
from vs_avanceCobranza C  inner join salesperson S on C.supervisor = S.slsperid  
and periodoPago = '201605' and periodo ='201606'

select * from vs_avanceCobranza