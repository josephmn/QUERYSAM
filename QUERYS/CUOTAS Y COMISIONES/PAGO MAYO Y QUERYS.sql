alter view rpt_inct_cobranza  
as  
select periodoPago ,Periodo ,supervisor,s.name,round(convert(decimal,cuota),2)cuota,round(convert(decimal,cobrado),2)cobrado,round(convert(decimal,avance),0)avance,
isnull((select max(cobr) from NuevosIncentivos where  periodo= C.periodo and tipo = 10 
 and SubTipo = 1  and porc <= round(avance,0)),0) InctCobranza  
from vs_avanceCobranza C inner join salesperson S on C.supervisor = S.slsperid  





sp_helptext  vs_avanceCobranza

select '201606' periodoPago, '201607'  Periodo, '091' supervisor,'Alan Peralta Nieves'  nombre,318288.04  cuota,318388.04 cobrado,100.031418082816 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '006' supervisor,'ALEJANDRO PEREZ NORIEGA'  nombre,465288.73  cuota,469212.67 cobrado,100.84333441732 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '184' supervisor,'CARLOS RICARDO MORANTE CORDOVA'  nombre,410336.9  cuota,464947.63 cobrado,113.308754343078 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '553' supervisor,'Edgar Zeta Espinoza'  nombre,190511.03  cuota,190017.61 cobrado,99.7410018727 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '511' supervisor,'Hilda Rondon Flores'  nombre,430311.94  cuota,507901.9 cobrado,118.031096232189 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '100' supervisor,'Hipolito Tavara Palomino'  nombre,320542.09  cuota,507901.9 cobrado,158.450922934957 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '239' supervisor,'JOSE NAVARRO MORENO'  nombre,280064.9  cuota,280063.9 cobrado,99.9996429399043 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '554' supervisor,'LOURDES PAREDES'  nombre,718353.69  cuota,1088902.46 cobrado,151.583053746129 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '556' supervisor,'Mario Gutierrez'  nombre,113401.8  cuota,95967.16 cobrado,84.6257819540783 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '463' supervisor,'Maicol Gonzales'  nombre,992168  cuota,992168 cobrado,100 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '557' supervisor,'RENZO RIMBALDO SEMINARIO GODOS'  nombre,196107.69  cuota,290142.92 cobrado,147.950812127765 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '514' supervisor,'Yaqueline Valdivia Calle'  nombre,360107.69  cuota,290142.92 cobrado,80.5711535901941 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '549' supervisor,'Nohemi Fanola'  nombre,183690.7  cuota,183690.7 cobrado,100 avance  union all  
select '201606' periodoPago, '201607'  Periodo, '547' supervisor,'Wilmer Meza'  nombre,492519.31  cuota,492519.31 cobrado,50 avance    
  
  
  
 