CREATE PROC ASP_REVISAR_INTEGRIDAD
--Funcion : Revisar Historico Integridad vs Balanza AM
--Sistema : Solomon IV
--Usuario : Gasla Baudat Laisson
--Fecha   : 06/08/2018 
@Perpost char(6)

as
begin

if @Perpost   ='201801' 
       begin
           select 'AM'TIPO, PerPost ,TranType , suM(valor)Monto from (
             select perpost,batnbr,REFNBR,invtid,trantype,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor              
             from intran where invtid like '21008%' and   rlsed =1  AND perpost     ='201801' AND InvtID  ='21008' AND SiteID  ='limcen' --@Perpost
             group by batnbr,REFNBR,invtid,perpost,trantype 
             )x where valor <>0  group by PerPost ,TranType
             UNION ALL
             select 'HIST'TIPO,'201801'perpost ,'IN'TRANTYPE,PTDCOGS00 * -1 Monto  FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2018' UNION ALL
             select 'HIST'TIPO,'201801'perpost ,'TR'TRANTYPE,(PTDCostTrsfrIn00 - PTDCostTrsfrOut00) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2018' UNION ALL
             select 'HIST'TIPO,'201801'perpost ,'AJ'TRANTYPE,(PTDCostAdjd00) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2018'
       END
if @Perpost  = '201802'
       begin

             select 'AM'TIPO, PerPost ,TranType ,round( suM(valor) ,2)Monto from (
             select perpost,batnbr,REFNBR,invtid,(case when  trantype  ='CM' THEN 'IN' ELSE TranType END)TranType ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor        
             from intran where InvtID like '21008%' and   rlsed =1  AND perpost     ='201802' AND InvtID  ='21008' AND SiteID  ='limcen' --@Perpost
             group by batnbr,REFNBR,invtid,perpost,trantype 
             )x where valor <>0  group by PerPost ,TranType
             UNION ALL
             select 'HIST'TIPO,'201802'perpost ,'IN'TRANTYPE,PTDCOGS01 * -1 Monto  FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2018' UNION ALL
             select 'HIST'TIPO,'201802'perpost ,'TR'TRANTYPE,(PTDCostTrsfrIn01 - PTDCostTrsfrOut01) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2018' UNION ALL
             select 'HIST'TIPO,'201802'perpost ,'AJ'TRANTYPE,(PTDCostAdjd01) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2018'
       end
if @Perpost  = '201803'
       begin
             
			 select 'AM'TIPO, PerPost ,TranType ,round( suM(valor) ,2)Monto from (
             select perpost,batnbr,REFNBR,invtid,(case when  trantype  ='CM' THEN 'IN' ELSE TranType END)TranType ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor        
             from intran where invtacct like '2011%' and   rlsed =1  AND perpost     ='201803' AND InvtID  ='21008' AND SiteID  ='LIMCEN' --@Perpost
             group by batnbr,REFNBR,invtid,perpost,trantype 
             )x where valor <>0  group by PerPost ,TranType
             UNION ALL
             select 'HIST'TIPO,'201803'perpost ,'IN'TRANTYPE,PTDCOGS02 * -1 Monto  FROM ItemHist where SiteID  ='CFCUSCO1' AND InvtID  ='21008' AND FiscYr  ='2018' UNION ALL
             select 'HIST'TIPO,'201803'perpost ,'TR'TRANTYPE,(PTDCostTrsfrIn02 - PTDCostTrsfrOut02) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2018' UNION ALL
             select 'HIST'TIPO,'201803'perpost ,'AJ'TRANTYPE,(PTDCostAdjd02) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2018'

       end
if @Perpost  ='201804' 
       begin
             select 'AM'TIPO, PerPost ,TranType ,round( suM(valor) ,2)Monto from (
             select perpost,batnbr,REFNBR,invtid,(case when  trantype  ='CM' THEN 'IN' ELSE TranType END)TranType ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor        
             from intran where invtacct like '21%' and   rlsed =1  AND perpost     ='201804' AND InvtID  ='21008' AND SiteID  ='LIMCEN' --@Perpost
             group by batnbr,REFNBR,invtid,perpost,trantype 
             )x where valor <>0  group by PerPost ,TranType
             UNION ALL
             select 'HIST'TIPO,'201804'perpost ,'IN'TRANTYPE,PTDCOGS03 * -1 Monto  FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2018' UNION ALL
             select 'HIST'TIPO,'201804'perpost ,'TR'TRANTYPE,(PTDCostTrsfrIn03 - PTDCostTrsfrOut03) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2018' UNION ALL
             select 'HIST'TIPO,'201804'perpost ,'AJ'TRANTYPE,(PTDCostAdjd03) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2018'
       end
if @Perpost  = '201805'
       begin
             select 'AM'TIPO, PerPost ,TranType ,round( suM(valor) ,2)Monto from (
             select perpost,batnbr,REFNBR,invtid,(case when  trantype  ='CM' THEN 'IN' ELSE TranType END)TranType ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor        
             from intran where invtacct like '21%' and   rlsed =1  AND perpost     ='201705' AND InvtID  ='21008' AND SiteID  ='LIMCEN' --@Perpost
             group by batnbr,REFNBR,invtid,perpost,trantype 
             )x where valor <>0  group by PerPost ,TranType
             UNION ALL
             select 'HIST'TIPO,'201705'perpost ,'IN'TRANTYPE,PTDCOGS04 * -1 Monto  FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2017' UNION ALL
             select 'HIST'TIPO,'201705'perpost ,'TR'TRANTYPE,(PTDCostTrsfrIn04 - PTDCostTrsfrOut04) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2017' UNION ALL
             select 'HIST'TIPO,'201705'perpost ,'AJ'TRANTYPE,(PTDCostAdjd04) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2017'
       end
if @Perpost  ='201806'
       begin

             select 'AM'TIPO, PerPost ,TranType ,round( suM(valor) ,2)Monto from (
             select perpost,batnbr,REFNBR,invtid,(case when  trantype  ='CM' THEN 'IN' ELSE TranType END)TranType ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor        
             from intran where InvtID like '21008%' and   rlsed =1  AND perpost   ='201706' AND InvtID  ='21008' AND SiteID  ='LIMCEN' --@Perpost
             group by batnbr,REFNBR,invtid,perpost,trantype 
             )x where valor <>0  group by PerPost ,TranType
             UNION ALL
             select 'HIST'TIPO,'201706'perpost ,'IN'TRANTYPE,PTDCOGS05 * -1 Monto  FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2017' UNION ALL
             select 'HIST'TIPO,'201706'perpost ,'TR'TRANTYPE,(PTDCostTrsfrIn05 - PTDCostTrsfrOut05) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2017' UNION ALL
             select 'HIST'TIPO,'201706'perpost ,'AJ'TRANTYPE,(PTDCostAdjd05) Monto FROM ItemHist where SiteID  ='LIMCEN' AND InvtID  ='21008' AND FiscYr  ='2017'

		END
END





