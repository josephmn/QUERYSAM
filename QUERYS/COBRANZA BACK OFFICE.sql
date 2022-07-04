


sp_helptext xam_incent_bo_semana


CREATE view [dbo].[xam_Incent_BO_Semana]  
as  
  
select Linea_Negocio,semana,NomSemana, ZONA, Supervisor,NombSup, marca,DESCR,'1 Cuota' DatoDesc,valorVentaP Dato from xam_Incent_BO_Semana_Det  union all  
select Linea_Negocio,semana,NomSemana, ZONA, Supervisor,NombSup, marca,DESCR,'2 Cierre' DatoDesc,ValorventaV Dato from xam_Incent_BO_Semana_Det  union all  
select Linea_Negocio,semana,NomSemana, ZONA, Supervisor,NombSup, marca,DESCR,'3 Avance' DatoDesc,avance Dato from xam_Incent_BO_Semana_Det   union all  
select Linea_Negocio,semana,NomSemana, ZONA, Supervisor,NombSup, marca,DESCR,'4 Incentivo' DatoDesc,MontoInctMarca Dato from xam_Incent_BO_Semana_Det   


sp_helptext  xam_Incent_BO_Semana_Det

CREATE view [dbo].[xam_Incent_BO_Semana_Det]    
as    
select X.Linea_Negocio,X.periodo semana,(case when S.user6 in ('CATE','LIMA') THEN 'LIMA' ELSE 'LIMA' END) ZONA,    
'' Supervisor,'Andy' NombSup,M.idmarca marca,M.DESCR,sum(valorVentaP)valorVentaP,sum(ValorventaV)ValorventaV,      
(case when isnull(sum(valorVentaP),0) > 0 then  ((sum(ValorventaV) / sum(valorVentaP))*100) else 0 end ) avance,      
(case when isnull(sum(valorVentaP),0) > 0 then isnull((select top 1 monto from xamPorIncentD where  Tipo ='V' and cargo='S'   and rtrim(user2)= rtrim(X.periodo)      
order by Porcentaje desc ),0)      
 else 0 end)  MontoInct  ,    
isnull((select max(incentivo) from  tb_IncenSemanalLineas y where semana = x.periodo  AND M.idmarca =Marca  and cod='103' and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100)),0)  MontoInctMarca ,    
--isnull((case     
--when M.idmarca ='ACL' then (select max(ACL) from  IncenSemanalLineasBO where semana = x.periodo   and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100))     
--when M.idmarca ='AGO' then (select max(AGO) from  IncenSemanalLineasBO where semana = x.periodo    and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100))     
--when M.idmarca ='ATM' then (select max(ATM) from  IncenSemanalLineasBO where semana = x.periodo   and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100))     
--when M.idmarca ='MON' then (select max(MON) from  IncenSemanalLineasBO where semana = x.periodo   and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100))     
--when M.idmarca ='KIM' then (select max(KIM) from  IncenSemanalLineasBO where semana = x.periodo   and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100))     
-- end),0) MontoInctMarca,    
 rtrim(X.periodo) +  ' ' + right('00'+ltrim(X.periodo),2) + (select '  ( '+left(convert(varchar, fech_ini_sem, 100),12) + ' - ' +   left(convert(varchar, fech_fin_sem, 100),12) + ')' from fincom where numsemana = X.periodo) NomSemana    
from xam_Incent_Cuotas X       
inner join XamMarcas M on X.marca = M.idmarca      
inner join salesperson V on V.slsperid = X.slsperid      
inner join salesperson S on S.slsperid = V.s4future11      
left join (select distinct cod,Descr,semana,slsperid,referencia,marca from tb_IncenSemanalLineas where cod ='100') I on I.referencia =S.slsperid  and x.periodo = semana  and x.marca = I.marca    
--WHERE S.slsperid <>'091'      
--where X.periodo <=100    
GROUP BY X.Linea_Negocio,X.periodo,(case when S.user6 in ('CATE','LIMA') THEN 'LIMA' ELSE 'LIMA' END),M.idmarca,M.DESCR 



sp_helptext  xam_Incent_Cuotas




CREATE view xam_Incent_Cuotas                  
as                  
select 'ALTOMAYO'Linea_Negocio,                  
(case when perpost is null then S.Periodo else perpost end )  periodo,                  
(case when slsperid is null then S.perId else slsperid end ) slsperid,                  
(case when x.Zona is null then s.Zona else x.Zona end ) Zona,                  
(case when x.marca is null then S.marca else x.marca end )marca,isnull(ValorventaV,0) ValorventaV ,                   
dbo.f_ObtenerCuotaVendMarca ((case when slsperid is null then S.perId else slsperid end ),(case when x.Zona is null then s.Zona else x.Zona end ),                  
(case when perpost is null then S.Periodo else perpost end ),(case when x.marca is null then S.marca else x.marca end )) valorVentaP                  
 from                   
(                
               
select V.perpost ,V.slsperid,C.user1 Zona,                  
(case                 
when I.user1='ALT' then (case  when  A.ProdLineId in('SCL') then 'ACL' when  A.ProdLineId in('SDE') then 'ADE'  when A.ProdLineId in('SGO') then 'AGO'  when A.ProdLineId in('TOM') then 'ATM'   else A.ProdLineId end)                 
when I.user1 is null then 'OTR'                 
else I.user1 end  ) marca,                 
sum((case when ShipperID <> '' then Totinvcline else (case when doctype ='CM' then (ValorVta ) *-1 else (ValorVta ) end ) end)) ValorventaV                  
 from tb_ventas V left join Customer C on V.custid = C.custid                  
left join inventory I on I.invtid = V.Producto                   
left join inventoryAdg A on I.invtid = A.invtId                
where                 
--v.slsperid ='549'  and                 
left(InvcNbr,1) <>'P'    --and V.perpost in ('201605','201606','201607','201608')      
and v.InvcNbr not in (Select RefNbr from ARDoc where BankAcct like '%15%' or  BankAcct like '%16%' or  BankAcct like '%17%' )  
    --and V.perpost ='201701'          
group by V.perpost,V.slsperid,C.user1,I.user1  ,(case                 
when I.user1='ALT' then (case  when  A.ProdLineId in('SCL') then 'ACL' when  A.ProdLineId in('SDE') then 'ADE'  when A.ProdLineId in('SGO') then 'AGO'  when A.ProdLineId in('TOM') then 'ATM'   else A.ProdLineId end)                 
when I.user1 is null then 'OTR'                 
else I.user1 end  )                 
                  
) X                  
 full join (select *from vs_CuotasPVFD )  S                  
on S.Periodo = X.perpost and S.perId = X.slsperid and S.zona= X.Zona and S.marca = X.marca                
      --WHERE slsperid ='100'      
            
--union all          
    
--select 'ALTOMAYO'Linea_Negocio,                  
--(case when x.semana is null then S.semana else x.semana end )  periodo,                  
--(case when slsperid is null then S.perId else slsperid end ) slsperid,                  
--(case when x.Zona is null then s.Zona else x.Zona end ) Zona,                  
--(case when x.marca is null then S.marca else x.marca end )marca,isnull(ValorventaV,0) ValorventaV,                   
--dbo.f_ObtenerCuotaVendMarca ((case when slsperid is null then S.perId else slsperid end ),(case when x.Zona is null then s.Zona else x.Zona end ),           
--(case when x.semana is null then S.semana else x.semana end ),(case when x.marca is null then S.marca else x.marca end )) valorVentaP            
--from           
--(          
--select DATEPART(wk,invcdate) semana,V.slsperid,C.user1 Zona,                  
--(case                 
--when I.user1='ALT' then (case  when  A.ProdLineId in('SCL') then 'ACL'  when  A.ProdLineId in('SDE') then 'ADE' when A.ProdLineId in('SGO') then 'AGO'  when A.ProdLineId in('TOM') then 'ATM'   else A.ProdLineId end)     when I.user1 is null then 'OTR'  
  
               
--else I.user1 end  ) marca,                 
--sum((case when ShipperID <> '' then Totinvcline else (case when doctype ='CM' then (ValorVta ) *-1 else (ValorVta ) end ) end)) ValorventaV                  
-- from tb_ventas V left join Customer C on V.custid = C.custid                  
--left join inventory I on I.invtid = V.Producto                   
--left join inventoryAdg A on I.invtid = A.invtId                
--where                 
----v.slsperid ='001'  and                 
--left(InvcNbr,1) <>'P'    and DATEPART(wk,invcdate)>='32'      --and V.slsperid ='091'          
-- AND (InvcNbr NOT IN (SELECT  RefNbr FROM  dbo.Artran WHERE  (LEFT(Acct, 2) IN ('75', '76', '77'))))          
--and doctype <>'CM' and (v.TipoDoc in ('01','03','07','08')    OR v.custid in ('88888888888') and v.TipoDoc='OD')              
        
--group by DATEPART(wk,invcdate),V.slsperid,C.user1,I.user1  ,(case                 
--when I.user1='ALT' then (case  when  A.ProdLineId in('SCL') then 'ACL' when  A.ProdLineId in('SDE') then 'ADE' when A.ProdLineId in('SGO') then 'AGO'  when A.ProdLineId in('TOM') then 'ATM'   else A.ProdLineId end)                 
--when I.user1 is null then 'OTR'                 
--else I.user1 end  )                 
--) x full join (select *from vs_CuotasPVFD ) S on s.semana = x.semana and S.perId = X.slsperid and S.zona= X.Zona and S.marca = X.marca            
----where s.Periodo <100           
        
        
        
        
 select Linea_Negocio,semana,NomSemana, ZONA, Supervisor,NombSup, marca,DESCR,'4 Incentivo' DatoDesc,MontoInctMarca Dato from xam_Incent_BO_Semana_Det   
        
                   
                   
                   
    sp_helptext  xam_Incent_BO_Semana_Det
    alter view [dbo].[xam_Incent_BO_Semana_Det]    
as    
select X.Linea_Negocio,X.periodo semana,(case when S.user6 in ('CATE','LIMA') THEN 'LIMA' ELSE 'LIMA' END) ZONA,    
'' Supervisor,'Andy' NombSup,M.idmarca marca,M.DESCR,sum(valorVentaP)valorVentaP,sum(ValorventaV)ValorventaV,      
(case when isnull(sum(valorVentaP),0) > 0 then  ((sum(ValorventaV) / sum(valorVentaP))*100) else 0 end ) avance,      
(case when isnull(sum(valorVentaP),0) > 0 then isnull((select top 1 monto from xamPorIncentD where  Tipo ='V' and cargo='S'   and rtrim(user2)= rtrim(X.periodo)      
order by Porcentaje desc ),0)      
 else 0 end)  MontoInct  ,    
isnull((select max(incentivo) from  tb_IncenSemanalLineas y where semana = x.periodo  AND M.idmarca =Marca  and cod='103' and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100)),0)  MontoInctMarca ,    
--isnull((case     
--when M.idmarca ='ACL' then (select max(ACL) from  IncenSemanalLineasBO where semana = x.periodo   and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100))     
--when M.idmarca ='AGO' then (select max(AGO) from  IncenSemanalLineasBO where semana = x.periodo    and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100))     
--when M.idmarca ='ATM' then (select max(ATM) from  IncenSemanalLineasBO where semana = x.periodo   and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100))     
--when M.idmarca ='MON' then (select max(MON) from  IncenSemanalLineasBO where semana = x.periodo   and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100))     
--when M.idmarca ='KIM' then (select max(KIM) from  IncenSemanalLineasBO where semana = x.periodo   and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100))     
-- end),0) MontoInctMarca,    
 rtrim(X.periodo) +  ' ' + right('00'+ltrim(X.periodo),2) + (select '  ( '+left(convert(varchar, fech_ini_sem, 100),12) + ' - ' +   left(convert(varchar, fech_fin_sem, 100),12) + ')' from fincom where numsemana = X.periodo) NomSemana    
from xam_Incent_Cuotas X       
inner join XamMarcas M on X.marca = M.idmarca      
inner join salesperson V on V.slsperid = X.slsperid      
inner join salesperson S on S.slsperid = V.s4future11      
left join (select distinct cod,Descr,semana,slsperid,referencia,marca from tb_IncenSemanalLineas where cod ='100') I on I.referencia =S.slsperid  and x.periodo = semana  and x.marca = I.marca    
--WHERE S.slsperid <>'091'      
--where X.periodo <=100    
GROUP BY X.Linea_Negocio,X.periodo,(case when S.user6 in ('CATE','LIMA') THEN 'LIMA' ELSE 'LIMA' END),M.idmarca,M.DESCR 


select monto from xamPorIncentD where  Tipo ='V' and cargo='S'   and rtrim(user3)= rtrim('201702')     


select * from  xamPorIncentD


select * from  tb_IncenSemanalLineas y 
where semana = '201701'   and cod='103' 
and porc <=((case when sum(valorVentaP) = 0 then 0 else (sum(ValorventaV)/sum(valorVentaP)) end )*100)),0)  MontoInctMarca



insert into tb_IncenSemanalLineas (semana,Slsperid,tipo,cargo,cod,descr,opcion,porc,Marca,incentivo,referencia)
select '201702',Slsperid,tipo,cargo,cod,descr,opcion,porc,Marca,incentivo,referencia from tb_IncenSemanalLineas where semana = '201701'   and cod='103' 