



---------------------------------------------------------------------------------
-- REPORTE DE INCENTIVOS COMISIONES     VENDEDORES                   ------------
---------------------------------------------------------------------------------
SELECT
    xam_Incent_Marc."Linea_Negocio", xam_Incent_Marc."periodo", xam_Incent_Marc."zona", xam_Incent_Marc."Supervisor", xam_Incent_Marc."NombSup", xam_Incent_Marc."slsperid", xam_Incent_Marc."NombVend", xam_Incent_Marc."DESCR", xam_Incent_Marc."valorVentaP", xam_Incent_Marc."ValorventaV", xam_Incent_Marc."avance", xam_Incent_Marc."MontoInctMarca"
FROM
    "AM2016APP"."dbo"."xam_Incent_Marc" xam_Incent_Marc WHERE xam_Incent_Marc."periodo" ='201605' AND xam_Incent_Marc."Supervisor"  = '553'
ORDER BY
    xam_Incent_Marc."Linea_Negocio" ASC,
    xam_Incent_Marc."periodo" ASC


---------------------------------------------------------------------------------
-- REPORTE DE INCENTIVOS COMISIONES     SUPERVISORES                 ------------
---------------------------------------------------------------------------------

SELECT
    xam_Incent_Sup."Linea_Negocio", xam_Incent_Sup."periodo", xam_Incent_Sup."Supervisor", xam_Incent_Sup."NombSup", xam_Incent_Sup."DESCR", xam_Incent_Sup."valorVentaP", xam_Incent_Sup."ValorventaV", xam_Incent_Sup."avance", xam_Incent_Sup."MontoInctMarca"
FROM
    "AM2016APP"."dbo"."xam_Incent_Sup" xam_Incent_Sup WHERE  xam_Incent_Sup."periodo" ='201605' AND xam_Incent_Sup."Supervisor" ='553'
ORDER BY
    xam_Incent_Sup."Linea_Negocio" ASC,
    xam_Incent_Sup."periodo" ASC
    
    
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

sp_helptext xam_Incent_Marc
select *from xam_Incent_Marc_O --where slsperid not in (select marca from xamPorIncentD)  


sp_helptext  xam_Incent_Marc_O

alter view [dbo].[xam_Incent_Marc_O]    
as    
-- Nueva Logica    
-- FUERZA DIRECTA <> PIURA    
SELECT Linea_Negocio,periodo,zona, Supervisor, NombSup,slsperid,NombVend,TipoMarca marca,TipoMarca DESCR,valorVentaP,ValorventaV,avance,MontoInct,    
--(case when marca ='ALT' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then (MontoInct) * 1.2   else 0 end )     
--      when marca ='MON' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then (MontoInct) * 1.2   else 0 end )     
--      when marca ='KIM' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then (MontoInct) * 1.2   else 0 end )     
--   else 0 end ) MontoInctMarca    
isnull((case when TipoMarca ='MON-KIM' then (select max(val1) from  NuevosIncentivos where tipo = 5 and SubTipo = 1 and porc <=(avance))   
else (select max(val2) from  NuevosIncentivos where tipo = 5 and SubTipo = 1 and porc <=(avance)) end),0) MontoInctMarca  
 FROM     
(  
select X.Linea_Negocio,X.periodo,S.user6 zona ,S.slsperid AS Supervisor,S.name NombSup,V.slsperid,V.name NombVend,(case when M.idmarca  in ('MON','KIM') then 'MON-KIM' when M.idmarca in ('ALT') then 'ALT' end  ) marca,--M.DESCR,  
(case when M.idmarca  in ('MON','KIM') then 'MON-KIM' when M.idmarca in ('ALT') then 'ALT' end  ) TipoMarca,  
sum(valorVentaP)valorVentaP,sum(ValorventaV)ValorventaV,    
(case when isnull(sum(valorVentaP),0) > 0 then  ((sum(ValorventaV) / sum(valorVentaP))*100) else 0 end ) avance,    
--(case when isnull(sum(valorVentaP),0) > 0 then isnull((select top 1 monto from xamPorIncentD where  Tipo ='V' and cargo='V' and marca =M.DESCR and  Porcentaje  = '120' order by Porcentaje desc ),0)    
--else 0 end)    
0 MontoInct    
from xam_Incent_Cuotas X     
left join XamMarcas M on X.marca = M.idmarca    
left join salesperson V on V.slsperid = X.slsperid    
inner join salesperson S on S.slsperid = V.s4future11    
where S.user6 <> 'PITU'   --and x.periodo ='201411'  and V.slsperid='230'  
GROUP BY X.Linea_Negocio,X.periodo,S.user6 ,S.slsperid,S.name,V.slsperid,V.name,(case when M.idmarca  in ('MON','KIM') then 'MON-KIM' when M.idmarca in ('ALT') then 'ALT' end  )  
) A where   slsperid   not in ('352','006','239','184') and  slsperid   not in (select marca from xamPorIncentD )    
    
union    all  
  
SELECT Linea_Negocio,periodo,zona, Supervisor, NombSup,slsperid,NombVend,TipoMarca marca,TipoMarca DESCR,valorVentaP,ValorventaV,avance,MontoInct,    
--(case when marca ='ALT' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then (MontoInct) * 1.2   else 0 end )     
--      when marca ='MON' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then (MontoInct) * 1.2   else 0 end )     
--      when marca ='KIM' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then (MontoInct) * 1.2   else 0 end )     
--   else 0 end ) MontoInctMarca    
isnull((case when TipoMarca ='MON-KIM' then (select max(val1) from  NuevosIncentivos where tipo = 5 and SubTipo = 2 and porc <=(avance))   
else (select max(val2) from  NuevosIncentivos where tipo = 5 and SubTipo = 2 and porc <=(avance)) end),0) MontoInctMarca  
 FROM     
(  
select X.Linea_Negocio,X.periodo,S.user6 zona ,S.slsperid AS Supervisor,S.name NombSup,V.slsperid,V.name NombVend,(case when M.idmarca  in ('MON','KIM') then 'MON-KIM' when M.idmarca in ('ALT') then 'ALT' end  ) marca,--M.DESCR,  
(case when M.idmarca  in ('MON','KIM') then 'MON-KIM' when M.idmarca in ('ALT') then 'ALT' end  ) TipoMarca,  
sum(valorVentaP)valorVentaP,sum(ValorventaV)ValorventaV,    
(case when isnull(sum(valorVentaP),0) > 0 then  ((sum(ValorventaV) / sum(valorVentaP))*100) else 0 end ) avance,    
--(case when isnull(sum(valorVentaP),0) > 0 then isnull((select top 1 monto from xamPorIncentD where  Tipo ='V' and cargo='V' and marca =M.DESCR and  Porcentaje  = '120' order by Porcentaje desc ),0)    
--else 0 end)    
0 MontoInct    
from xam_Incent_Cuotas X     
left join XamMarcas M on X.marca = M.idmarca    
left join salesperson V on V.slsperid = X.slsperid    
inner join salesperson S on S.slsperid = V.s4future11    
where S.user6 <> 'PITU'   --and x.periodo ='201411'  and V.slsperid='230'  
GROUP BY X.Linea_Negocio,X.periodo,S.user6 ,S.slsperid,S.name,V.slsperid,V.name,(case when M.idmarca  in ('MON','KIM') then 'MON-KIM' when M.idmarca in ('ALT') then 'ALT' end  )  
) A where   slsperid    in ('157') --and  slsperid   not in (select marca from xamPorIncentD )    
    
union    all  
  
--PIURA    
SELECT Linea_Negocio,periodo,zona, Supervisor, NombSup,slsperid,NombVend,TipoMarca marca,TipoMarca DESCR,valorVentaP,ValorventaV,avance,MontoInct,    
--(case when marca ='ALT' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then (MontoInct) * 1.2  else 0 end )     
--      when marca ='MON' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then (MontoInct) * 1.2  else 0 end )     
--      when marca ='KIM' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then (MontoInct) * 1.2  else 0 end )     
--   else 0 end ) MontoInctMarca  ,  
(case when TipoMarca ='ALT-MON' then (select max(val1) from  NuevosIncentivos where tipo = 5 and SubTipo = 1 and porc <=(avance))   
else (select max(val2) from  NuevosIncentivos where tipo = 5 and SubTipo = 1 and porc <=(avance)) end) MontoInctMarca  
 FROM     
(    
select X.Linea_Negocio,X.periodo,S.user6 zona ,S.slsperid AS Supervisor,S.name NombSup,V.slsperid,V.name NombVend,(case when M.idmarca  in ('ALT','MON') then 'ALT-MON' when M.idmarca in ('KIM') then 'KIM' end  ) marca,--M.DESCR,  
(case when M.idmarca  in ('ALT','MON') then 'ALT-MON' when M.idmarca in ('KIM') then 'KIM' end  ) TipoMarca,  
sum(valorVentaP)valorVentaP,sum(ValorventaV)ValorventaV,    
(case when isnull(sum(valorVentaP),0) > 0 then  ((sum(ValorventaV) / sum(valorVentaP))*100) else 0 end ) avance,    
--(case when isnull(sum(valorVentaP),0) > 0 then isnull((select top 1 monto from xamPorIncentD where  Tipo ='V' and cargo='V' and marca =M.DESCR and  Porcentaje  = '110' order by Porcentaje desc ),0)    
-- else 0 end)   
0 MontoInct    
from xam_Incent_Cuotas X     
left join XamMarcas M on X.marca = M.idmarca    
left join salesperson V on V.slsperid = X.slsperid    
inner join salesperson S on S.slsperid = V.s4future11    
where S.user6 = 'PITU'   and   v.slsperid  not in ('518','557') --and x.periodo ='201411' --and V.slsperid='442'  
GROUP BY X.Linea_Negocio,X.periodo,S.user6 ,S.slsperid,S.name,V.slsperid,V.name,(case when M.idmarca  in ('ALT','MON') then 'ALT-MON' when M.idmarca in ('KIM') then 'KIM' end  )--M.idmarca,M.DESCR    
) A    
  
/**/  
  
--select  Linea_Negocio,periodo,zona, Supervisor, NombSup,TipoMarca marca ,TipoMarca DESCR,  
--sum(valorVentaP)valorVentaP,sum(ValorventaV)ValorventaV, (case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100 avance,0 MontoInct,  
--(case when TipoMarca ='ALT-MON' then (select max(val1) from  NuevosIncentivos where tipo = x.tipo and SubTipo = x.SubTipo and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100))   
--else (select max(val2) from  NuevosIncentivos where tipo = x.tipo and porc <=(((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end ))*100)) end) MontoInctMarca  
--from (  
--select Linea_Negocio,periodo,zona, Supervisor, NombSup,s.marca,DESCR,valorVentaP,ValorventaV,avance,MontoInct,MontoInctMarca ,  
--(case when s.marca in ('ALT','MON') then 'ALT-MON' when s.marca in ('KIM') then 'KIM' end  ) TipoMarca,D.user1 Tipo, D.user5 SubTipo  
--from tbxam_Incent_SupDet S inner join xamPorIncentD D on rtrim(D.marca) = rtrim(S.Supervisor)   
--where  D.user1 = 4 and D.user5=1 and s.marca in ('ALT','KIM','MON')--Supervisor  in ('463') and periodo ='201408' and  
--) X  
--group by Linea_Negocio,periodo,zona, Supervisor, NombSup,TipoMarca,Tipo,SubTipo  
  
/**/  
    
--union     
---- viajeros centros    
--SELECT Linea_Negocio,periodo,zona, Supervisor, NombSup,slsperid,NombVend,marca,DESCR,valorVentaP,ValorventaV,avance,MontoInct,    
--(case when marca ='ALT' then (case when round(avance,2) >= 80 and round(avance,2) <= 100 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) > 100 and round(avance,2) < 120  then    
--round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then  (MontoInct) * 1.2  else 0  end )     
--      when marca ='MON' then (case when round(avance,2) >= 80 and round(avance,2) <= 100 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) > 100 and round(avance,2) < 120  then   round((MontoInct) * (round(round(avance,2),2)/  
--  
--100),0) when round(avance,0) >= 120 then (MontoInct) * 1.2   else 0  end )     
--      when marca ='KIM' then (case when round(avance,2) >= 80 and round(avance,2) <= 100 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) > 100 and round(avance,2) < 120  then    
--round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then   (MontoInct) * 1.2  else 0  end    
-- )     
--   else 0 end ) MontoInctMarca    
-- FROM     
--(    
--    
--select X.Linea_Negocio,X.periodo,S.user6 zona ,S.slsperid AS Supervisor,S.name NombSup,V.slsperid,V.name NombVend,M.idmarca marca,M.DESCR,sum(valorVentaP)valorVentaP,sum(ValorventaV)ValorventaV,    
--(case when isnull(sum(valorVentaP),0) > 0 then  ((sum(ValorventaV) / sum(valorVentaP))*100) else 0 end ) avance,    
--(case when isnull(sum(valorVentaP),0) > 0 then isnull((select top 1 monto from xamPorIncentD where  Tipo ='V' and cargo='V' and marca =M.DESCR and  Porcentaje  = '130' order by Porcentaje desc ),0)    
-- else 0 end)  MontoInct    
--from xam_Incent_Cuotas X     
--left join XamMarcas M on X.marca = M.idmarca    
--left join salesperson V on V.slsperid = X.slsperid    
--inner join salesperson S on S.slsperid = V.s4future11    
--where S.user6 <> 'PITU'    
--GROUP BY X.Linea_Negocio,X.periodo,S.user6 ,S.slsperid,S.name,V.slsperid,V.name,M.idmarca,M.DESCR    
---- para viajeros    
--) A where   slsperid  in ('157','352')    
    
--union     
--    
--SELECT Linea_Negocio,periodo,zona, Supervisor, NombSup,slsperid,NombVend,marca,DESCR,valorVentaP,ValorventaV,avance,MontoInct,    
--(case when marca ='ALT' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then (MontoInct) * 1.2  else 0 end )     
--      when marca ='MON' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then  (MontoInct) * 1.2  else 0 end )     
--      when marca ='KIM' then (case when round(avance,2) >= 80 and round(avance,2) < 120 then round((MontoInct) * (round(round(avance,2),2)/100),2) when round(avance,2) >= 120 then  (MontoInct) * 1.2  else 0 end )     
--   else 0 end ) MontoInctMarca    
-- FROM     
--(      
--select X.Linea_Negocio,X.periodo,S.user6 zona ,S.slsperid AS Supervisor,S.name NombSup,V.slsperid,V.name NombVend,M.idmarca marca,M.DESCR,sum(valorVentaP)valorVentaP,sum(ValorventaV)ValorventaV,    
--(case when isnull(sum(valorVentaP),0) > 0 then  ((sum(ValorventaV) / sum(valorVentaP))*100) else 0 end ) avance,    
--(case when isnull(sum(valorVentaP),0) > 0 then isnull((select top 1 monto from xamPorIncentD where  Tipo ='V' and cargo='V' and marca =M.DESCR and  Porcentaje  = '140' order by Porcentaje desc ),0)    
-- else 0 end)  MontoInct    
--from xam_Incent_Cuotas X     
--left join XamMarcas M on X.marca = M.idmarca    
--left join salesperson V on V.slsperid = X.slsperid    
--inner join salesperson S on S.slsperid = V.s4future11    
--where S.user6 <> 'PITU'    
--GROUP BY X.Linea_Negocio,X.periodo,S.user6 ,S.slsperid,S.name,V.slsperid,V.name,M.idmarca,M.DESCR    
---- para viajeros    
--) A where   slsperid  in ('006','239','184')    
--   
  
  