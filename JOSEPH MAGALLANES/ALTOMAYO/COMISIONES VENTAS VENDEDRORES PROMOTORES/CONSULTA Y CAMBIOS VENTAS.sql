

select SlsperId, name, * from Salesperson where name like '%DEL PILAR%'

/*
463 --maicol
547 --wilmer meza
695 --evelyn lavalle
729 --jesualdo
769 --martin ballon
*/

-- SUPERVISORES
/*
694 -- LUIS ROJAS ORTEGA

*/
select SlsperId, user2, S4Future11, name, * from Salesperson where slsperid =  '709'
select SlsperId, user2, S4Future11, name, * from Salesperson where slsperid =  '724'

select SlsperId, user2, S4Future11, name, * from Salesperson where slsperid =  '679'



select SlsperId, user2, S4Future11, name, * from Salesperson
--update Salesperson set S4Future11 = '769' 
where SlsperId in ('775','678','575')



SELECT * FROM PersonalV

 insert into personalValue 
 (perid ,MontoQuintaExt,MontoRetenidoQuinta,BonoFuturoRQ,Slsperid,movilidadAdmin) 
 
 select  '45243562',0,0,0,'779',0



 SP_WHO

 SELECT * FROM rptruntime




 SELECT
    rpt_inct_cobranza."periodoPago", rpt_inct_cobranza."supervisor", rpt_inct_cobranza."name", rpt_inct_cobranza."cuota", rpt_inct_cobranza."cobrado", rpt_inct_cobranza."avance", rpt_inct_cobranza."InctCobranza"
FROM
    "AM2017APP"."dbo"."rpt_inct_cobranza" rpt_inct_cobranza
ORDER BY
    rpt_inct_cobranza."periodoPago" ASC



	    
CREATE  view [dbo].[rpt_inct_cobranza]          
as          
--select  periodoPago ,Periodo ,supervisor,s.name,round(convert(decimal,cuota),2)cuota,round(convert(decimal,cobrado),2)cobrado,        
--round(convert(decimal,avance),0)avance,isnull((select max(cobr) from NuevosIncentivos where  periodo= C.periodo and tipo = 10         
-- and SubTipo = 1  and porc <= round(avance,0)),0) InctCobranza          
--from vs_avanceCobranza C inner join salesperson S on C.supervisor = S.slsperid         
--where Periodo ='201706'        
        
select  periodoPago ,Periodo ,supervisor,s.name,      
round(convert(decimal,cuota),2)cuota,round(convert(decimal,cobrado),2)cobrado,        
round(convert(decimal,avance),2)avance,isnull((select max(cob) from NuevosIncentivosSem where  perpost = C.periodo and cod = 100  and porc <= round(avance,0)),0) InctCobranza          
from vs_avanceCobranza C inner join salesperson S on C.supervisor = S.slsperid         
--where Periodo ='201706'        
--select *from NuevosIncentivosSem        
--select *from avcobranza        
union all        
select periodoPago,perpost,Slsperid,CName,cuota,cobrado,(case when y.Slsperid ='100' and y.periodoPago='201802' then 100 else y.avance end) Avance,      
--isnull((select max(cob) from NuevosIncentivosSem where  perpost = y.perpost and cod = 100  and porc <= round(y.avance,2)),0) InctCobranza,      
(select  max(cob) from NuevosIncentivosSem N inner join       
xamPorIncentD X on X.user1 = N.cod and perpost = X.user3      
where    X.user3 =y.periodoPago   and x.Marca =y.Slsperid and X.tipo ='V' and X.cargo ='S' and X.Porcentaje =1      
and porc <= round(  (case when y.Slsperid ='100' and y.periodoPago='201802' then 100 else y.avance end) ,2))          
from (        
select periodoPago,perpost,Slsperid,CName,cuota,cobrado,(CASe when cuota > 0  then round((cobrado / cuota)*100 ,2)else 0  end ) Avance        
 from (        
SELECT  tb_CobrVendH."perpost"  periodoPago,tb_CobrVendH."perpost"+ 1 perpost,tb_CobrVendH."Slsperid",tb_CobrVendH."CName",sum(tb_CobrVendD."Total")cuota,  sum(vs_CobrVendPeriodo."pagoPeriodo")cobrado        
FROM        
    { oj (( vs_CobrVendPeriodo INNER JOIN  tb_CobrVendD ON        
        vs_CobrVendPeriodo."CustID" = tb_CobrVendD."CustID" AND        
    vs_CobrVendPeriodo."CName" = tb_CobrVendD."CName" AND        
    vs_CobrVendPeriodo."perpost" = tb_CobrVendD."perpost" AND        
    vs_CobrVendPeriodo."RefNbr" = tb_CobrVendD."RefNbr")        
     INNER JOIN  tb_CobrVendH ON        
        tb_CobrVendD."slsperidCob" = tb_CobrVendH."Slsperid" AND        
    tb_CobrVendD."perpost" = tb_CobrVendH."perpost")        
     INNER JOIN  ARDoc ON        
        tb_CobrVendD."CustID" = ARDoc."CustId" AND        
    tb_CobrVendD."RefNbr" = ARDoc."RefNbr"}        
WHERE        
    tb_CobrVendD."Incluir" = 1 AND    (ARDoc."BankAcct" LIKE '17%' OR    ARDoc."BankAcct" LIKE '13%' OR    ARDoc."BankAcct" LIKE '12%')        
    and tb_CobrVendH."perpost" >='201706'        
    group by tb_CobrVendH."perpost",tb_CobrVendH."Slsperid",tb_CobrVendH."CName"            
) x        
)y   


select perpost,cod,descr,opcion,porc,acl,ago,ade,atm,mon,kim,COB from INsemanalh h,INsemanald d where h.numid=d.numid and perpost = '201805'

