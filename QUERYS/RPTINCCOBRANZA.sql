sp_helptext  rpt_inct_cobranza

CREATE view rpt_inct_cobranza    
as    
select periodoPago ,Periodo ,supervisor,s.name,round(convert(decimal,cuota),2)cuota,round(convert(decimal,cobrado),2)cobrado,  
round(convert(decimal,avance),0)avance,isnull((select max(cobr) from NuevosIncentivos where  periodo= C.periodo and tipo = 10   
 and SubTipo = 1  and porc <= round(avance,0)),0) InctCobranza    
from vs_avanceCobranza C inner join salesperson S on C.supervisor = S.slsperid 


select * from  NuevosIncentivos_Periodo

sp_helptext  NuevosIncentivos_Periodo
-------------------------
alter view NuevosIncentivos      
as      
-- val1 altomayo    
-- val2 montealto    
-- val3 kimbo    
select '201601' periodo,tipo,subTipo,porc,val1,val2,val3,COBR,BONO,user1,user2 from NuevosIncentivos_Periodo    
union all    
select '201602' periodo,tipo,subTipo,porc,val1,val2,val3,COBR,BONO,user1,user2 from NuevosIncentivos_Periodo    
union all    
select '201603' periodo,tipo,subTipo,porc,val1,val2,val3,COBR,BONO,user1,user2 from NuevosIncentivos_Periodo    
    
union all    
select '201604' periodo,tipo,subTipo,porc,val1,val2,val3,COBR,BONO,user1,user2 from NuevosIncentivos_Periodo    
union all    
select '201605' periodo,tipo,subTipo,porc,val1,val2,val3,COBR,BONO,user1,user2 from NuevosIncentivos_Periodo    
union all    
select '201606' periodo,tipo,subTipo,porc,val1,val2,val3,COBR,BONO,user1,user2 from NuevosIncentivos_Periodo_BONO    
union all    
select '201607' periodo,tipo,subTipo,porc,val1,val2,val3,COBR,BONO,user1,user2 from NuevosIncentivos_Periodo_BONO    
union all    
select '201608' periodo,tipo,subTipo,porc,val1,val2,val3,COBR,BONO,user1,user2 from NuevosIncentivos_Periodo_BONO    
union all     
select '201609' periodo,tipo,subTipo,porc,val1,val2,val3,COBR,BONO,user1,user2 from NuevosIncentivos_Periodo_BONO 
union all     
select '201610' periodo,tipo,subTipo,porc,val1,val2,val3,COBR,BONO,user1,user2 from NuevosIncentivos_Periodo_BONO 
  
--sp_helptext NuevosIncentivos_Periodo  
-------------------------

alter view vs_avanceCobranza      
as      
select '201605' periodoPago, '201606'  Periodo, '091' supervisor,'Alan Peralta Nieves'  nombre,318288.04  cuota,318388.04 cobrado,100.031418082816 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '006' supervisor,'ALEJANDRO PEREZ NORIEGA'  nombre,465288.73  cuota,469212.67 cobrado,100.84333441732 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '184' supervisor,'CARLOS RICARDO MORANTE CORDOVA'  nombre,410336.9  cuota,464947.63 cobrado,113.308754343078 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '553' supervisor,'Edgar Zeta Espinoza'  nombre,190511.03  cuota,190017.61 cobrado,99.7410018727 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '511' supervisor,'Hilda Rondon Flores'  nombre,430311.94  cuota,507901.9 cobrado,118.031096232189 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '100' supervisor,'Hipolito Tavara Palomino'  nombre,320542.09  cuota,507901.9 cobrado,158.450922934957 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '239' supervisor,'JOSE NAVARRO MORENO'  nombre,280064.9  cuota,280063.9 cobrado,99.9996429399043 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '554' supervisor,'LOURDES PAREDES'  nombre,718353.69  cuota,1088902.46 cobrado,151.583053746129 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '556' supervisor,'Mario Gutierrez'  nombre,113401.8  cuota,95967.16 cobrado,84.6257819540783 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '463' supervisor,'Maicol Gonzales'  nombre,992168  cuota,992168 cobrado,100 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '557' supervisor,'RENZO RIMBALDO SEMINARIO GODOS'  nombre,196107.69  cuota,290142.92 cobrado,147.950812127765 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '514' supervisor,'Yaqueline Valdivia Calle'  nombre,360107.69  cuota,290142.92 cobrado,80.5711535901941 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '549' supervisor,'Nohemi Fanola'  nombre,183690.7  cuota,183690.7 cobrado,100 avance  union all      
select '201605' periodoPago, '201606'  Periodo, '547' supervisor,'Wilmer Meza'  nombre,492519.31  cuota,492519.31 cobrado,100 avance     union all      
 select '201606' periodoPago, '201607'  Periodo, '091' supervisor,'Alan Peralta Nieves'  nombre,390527.56  cuota,459285.63 cobrado,118.00  avance  union all      
select '201606' periodoPago, '201607'  Periodo, '006' supervisor,'ALEJANDRO PEREZ NORIEGA'  nombre,355368.82  cuota,368125.92 cobrado,104.00  avance  union all      
select '201606' periodoPago, '201607'  Periodo, '184' supervisor,'CARLOS RICARDO MORANTE CORDOVA'  nombre,389996.71  cuota,460886.28 cobrado,118.00  avance  union all      
select '201606' periodoPago, '201607'  Periodo, '553' supervisor,'Edgar Zeta Espinoza'  nombre,291532.21  cuota,284453.44 cobrado,98.00  avance  union all      
select '201606' periodoPago, '201607'  Periodo, '511' supervisor,'Hilda Rondon Flores'  nombre,514135.49  cuota,581789.27 cobrado,113.00  avance  union all      
select '201606' periodoPago, '201607'  Periodo, '100' supervisor,'Hipolito Tavara Palomino'  nombre ,365986.86 cuota,385918.86 cobrado,105 avance  union all      
select '201606' periodoPago, '201607'  Periodo, '239' supervisor,'JOSE NAVARRO MORENO'  nombre,299156.90  cuota,304046.25 cobrado,102.00 avance  union all      
select '201606' periodoPago,'201607' Periodo, '554' supervisor,'LOURDES PAREDES' nombre,649651.84"cuota",1541954.95"cobrado",237.00 avance union all      
select '201606' periodoPago, '201607'  Periodo, '556' supervisor,'Mario Gutierrez'  nombre,211303.26 cuota,211303.26 cobrado,100 avance  union all      
select '201606' periodoPago, '201607'  Periodo, '463' supervisor,'Maicol Gonzales'  nombre,699788.17 cuota,699787.70 cobrado,100 avance  union all      
select '201606' periodoPago, '201607'  Periodo, '557' supervisor,'RENZO RIMBALDO SEMINARIO GODOS'  nombre,292197.25 cuota,292197.25 cobrado,100 avance  union all      
select '201606' periodoPago, '201607'  Periodo, '514' supervisor,'Yaqueline Valdivia Calle'  nombre,375856.42 cuota,375959.36 cobrado,100 avance  union all      
select '201606' periodoPago, '201607'  Periodo, '549' supervisor,'Nohemi Fanola'  nombre,141673.40 cuota,103516.85 cobrado,73 avance  union all      
select '201606' periodoPago, '201607'  Periodo, '547' supervisor,'Wilmer Meza'  nombre,274128.02 cuota,274128.02 cobrado,100 avance   union all        
    
    
select '201607' periodoPago, '201608'  Periodo, '091' supervisor,'ALAN PERALTA'  nombre,442983.24 cuota,442983.24 cobrado,100 avance  union all      
select '201607' periodoPago, '201608'  Periodo, '006' supervisor,'ALEJANDRO PEREZ'  nombre,313358.89 cuota,288484.95 cobrado,92.06 avance  union all      
select '201607' periodoPago, '201608'  Periodo, '184' supervisor,'CARLOS MORANTE'  nombre,273791.81 cuota,273791.81 cobrado,100 avance  union all      
select '201607' periodoPago, '201608'  Periodo, '553' supervisor,'EDGAR ZETA'  nombre,389876.45 cuota,369816.45 cobrado,94.85 avance  union all      
select '201607' periodoPago, '201608'  Periodo, '511' supervisor,'HILDA RONDON '  nombre,759988.82 cuota,730684.1 cobrado,96.14 avance  union all      
select '201607' periodoPago, '201608'  Periodo, '100' supervisor,'HIPOLITO TAVARA '  nombre,199015.65 cuota,183935.3 cobrado,92.42 avance  union all      
select '201607' periodoPago, '201608'  Periodo, '239' supervisor,'JOSE NAVARRO'  nombre,381728.69 cuota,261671.61 cobrado,68.55 avance  union all      
select '201607' periodoPago, '201608'  Periodo, '463' supervisor,'MAICOL GONZALES '  nombre,589071.89 cuota,589071.9 cobrado,100 avance  union all      
select '201607' periodoPago, '201608'  Periodo, '556' supervisor,'MARIO GUTIERREZ'  nombre,83529.94 cuota,83529.94 cobrado,100 avance  union all      
select '201607' periodoPago, '201608'  Periodo, '549' supervisor,'NOHEMI FANOLA'  nombre,343486.06 cuota,299818.91 cobrado,87.29 avance  union all      
select '201607' periodoPago, '201608'  Periodo, '557' supervisor,'RENZO SEMINARIO '  nombre,303695.01 cuota,303695.01 cobrado,100 avance  union all      
select '201607' periodoPago, '201608'  Periodo, '547' supervisor,'WILMER MEZA'  nombre,878016.04 cuota,878016.04 cobrado,100 avance  union all      
--select '201607' periodoPago,'201608' Periodo, '554' supervisor,'LOURDES PAREDES' nombre,658990.26 cuota,658990.26 cobrado,100 avance union all      
select '201607' periodoPago, '201608'  Periodo, '514' supervisor,'YAQUELINE VALDIVIA '  nombre,290474.76 cuota,290474.74 cobrado,100 avance    union all  
      
          
select '201608' periodoPago, '201609'  Periodo, '091' supervisor,'ALAN PERALTA'  nombre,249959.05 cuota,244919.41 cobrado,98.00 avance  union all      
select '201608' periodoPago, '201609'  Periodo, '006' supervisor,'ALEJANDRO PEREZ'  nombre,349679.07 cuota,331393.16 cobrado,95.00 avance  union all      
select '201608' periodoPago, '201609'  Periodo, '184' supervisor,'CARLOS MORANTE'  nombre,390834.02 cuota,390834.02 cobrado,100 avance  union all      
select '201608' periodoPago, '201609'  Periodo, '553' supervisor,'EDGAR ZETA'  nombre,386550.88 cuota,338251.3 cobrado,88.00 avance  union all      
select '201608' periodoPago, '201609'  Periodo, '511' supervisor,'HILDA RONDON '  nombre,698533.73 cuota,698533.73 cobrado,100 avance  union all      
select '201608' periodoPago, '201609'  Periodo, '100' supervisor,'HIPOLITO TAVARA '  nombre,206396.66 cuota,147474.85 cobrado,71.00 avance  union all      
select '201608' periodoPago, '201609'  Periodo, '239' supervisor,'JOSE NAVARRO'  nombre,302872.25 cuota,275430.36 cobrado,91 avance  union all      
select '201608' periodoPago, '201609'  Periodo, '463' supervisor,'MAICOL GONZALES '  nombre,1043486.25 cuota,1043486.25 cobrado,100 avance  union all  
select '201608' periodoPago, '201609'  Periodo, '556' supervisor,'MARIO GUTIERREZ'  nombre,227248.15 cuota,109704.08 cobrado,48 avance  union all      
select '201608' periodoPago, '201609'  Periodo, '549' supervisor,'NOHEMI FANOLA'  nombre,187323.39 cuota,149945.22 cobrado,80.00 avance  union all      
select '201608' periodoPago, '201609'  Periodo, '557' supervisor,'RENZO SEMINARIO '  nombre,424552.04 cuota,424552.04 cobrado,100 avance  union all      
select '201608' periodoPago, '201609'  Periodo, '547' supervisor,'WILMER MEZA'  nombre,536760.08 cuota,536760.08 cobrado,100 avance  union all      
select '201608' periodoPago, '201609' Periodo, '514' supervisor,'YAQUELINE VALDIVIA '  nombre,313949.53 cuota,300045.14 cobrado,96 avance    union all  
select '201608' periodoPago, '201609' Periodo, '554' supervisor,'LOURDES PAREDES' nombre,664543.92 cuota,664543.92 cobrado,100 avance    union all      

--
select '201609' periodoPago, '201610'  Periodo, '091' supervisor,'ALAN PERALTA'  nombre,255916.99 cuota,248829.91 cobrado,97.00 avance  union all      
select '201609' periodoPago, '201610'  Periodo, '006' supervisor,'ALEJANDRO PEREZ'  nombre,488053.15 cuota,395175.61 cobrado,81.00 avance  union all      
select '201609' periodoPago, '201610'  Periodo, '184' supervisor,'CARLOS MORANTE'  nombre,252981.96 cuota,252981.96 cobrado,100 avance  union all      
select '201609' periodoPago, '201610'  Periodo, '553' supervisor,'EDGAR ZETA'  nombre,393556.23 cuota,389594.63 cobrado,99.00 avance  union all   
select '201609' periodoPago, '201610'  Periodo, '511' supervisor,'HILDA RONDON '  nombre,846631.94 cuota,805662.79 cobrado,95 avance  union all      
select '201609' periodoPago, '201610'  Periodo, '100' supervisor,'HIPOLITO TAVARA '  nombre,203082.82 cuota,196641.18 cobrado,97.00 avance  union all   
select '201609' periodoPago, '201610'  Periodo, '239' supervisor,'JOSE NAVARRO'  nombre,406485.79 cuota,400166.16 cobrado,98 avance  union all      
select '201609' periodoPago, '201610'  Periodo, '463' supervisor,'MAICOL GONZALES '  nombre,702663.84 cuota,702663.84 cobrado,100 avance  union all  
select '201609' periodoPago, '201610'  Periodo, '556' supervisor,'MARIO GUTIERREZ'  nombre,342222.96 cuota,155588.61 cobrado,45 avance  union all   
select '201609' periodoPago, '201610'  Periodo, '549' supervisor,'NOHEMI FANOLA'  nombre,360939.03 cuota,353859.03 cobrado,98.00 avance  union all      
select '201609' periodoPago, '201610'  Periodo, '557' supervisor,'RENZO SEMINARIO '  nombre,493808.14 cuota,493807.64 cobrado,100 avance  union all      
select '201609' periodoPago, '201610'  Periodo, '547' supervisor,'WILMER MEZA'  nombre,958600.58 cuota,958600.58 cobrado,100 avance  union all      
select '201609' periodoPago, '201610'  Periodo, '514' supervisor,'YAQUELINE VALDIVIA '  nombre,226978.09 cuota,226978.09 cobrado,100 avance  union all  
select '201609' periodoPago, '201610'  Periodo, '554' supervisor,'LOURDES PAREDES' nombre,22304.42 cuota,22304.42 cobrado,100 avance        




  insert into 