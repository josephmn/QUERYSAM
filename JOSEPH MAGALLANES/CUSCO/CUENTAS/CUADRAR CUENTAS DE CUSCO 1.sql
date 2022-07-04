





--ACTU_COST_TR '027028','I250219',14.0000

--ACTU_COST_SI '011674','I250166', 16.50

--ACTU_COST_KIT '026758','I250219',14.0000

--ACTU_COST_venta '032313','','I213438',1.321830


SELECT*  FROM INTRAN WHERE KITID  ='I213671' AND BatNbr < '025214' ORDER BY BatNbr ASC 
SELECT*  FROM INTRAN WHERE KITID  ='I213671' AND PerPost  ='201806' ORDER BY BatNbr ASC 



 SELECT BatNbr ,*  FROM POTran S  WHERE InvtId  ='I250219' ORDER BY S.BatNbr ASC

  I250219


-----------PARA LA 20
select 'AR'module ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor 
from intran where   invtid  like '21%'and perpost <='201805'   --and batnbr ='002019' --andand --invtid ='20267' and 
union all
select 'GL',sum(DRAmt)- sum(CrAmt) from gltran where acct  in ( '211101' ) AND POSTED ='p' and perpost <='201805'--and  module ='in' and batnbr ='002019'  


select * from gltran where 


-----------PARA LA 21
select 'AR'module ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor 
from intran where   invtid  like '21%'and perpost <='201804'   --and batnbr ='002019' --andand --invtid ='20267' and 
union all
select 'GL',sum(DRAmt)- sum(CrAmt) from gltran where acct  in('211101') AND POSTED ='p' and perpost <='201804'--and  module ='in' and batnbr ='002019'  


select InvtMult ,* from intran where RefNbr  ='B050046553'




---------DETALLE 20 ----
SELECT  'IN'Module,vr_10630."perpost",vr_10630.BatNbr ,vr_10630.RefNbr,vr_10630."InvtID",vr_10630."trantype",
ISNULL(  ROUND(  sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then vr_10630.TranAmt * vr_10630.InvtMult else vr_10630.ExtCost * vr_10630.InvtMult end  )),2) ,0) valor ,
sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then vr_10630.QTY * vr_10630.Unitprice * vr_10630.InvtMult else 0 end  )) valor2   
	FROM { oj ((("AM2018APP"."dbo"."vr_10630" vr_10630 INNER JOIN "AM2018APP"."dbo"."RptCompany" RptCompany ON vr_10630."CpnyID" = RptCompany."CpnyID" 
	AND vr_10630."RI_ID" = RptCompany."RI_ID")  INNER JOIN "AM2018APP"."dbo"."Inventory" Inventory ON vr_10630."InvtID" = Inventory."InvtID")
    LEFT OUTER JOIN "AM2018APP"."dbo"."ItemSite" ItemSite ON vr_10630."InvtID" = ItemSite."InvtID" AND vr_10630."SiteID" = ItemSite."SiteID") 
	INNER JOIN "AM2018APP"."dbo"."InventoryADG" InventoryADG ON Inventory."InvtID" = InventoryADG."InvtID"} WHERE (vr_10630.InvtID like '21%')
	and vr_10630.PerPost   <= '201807' --AND vr_10630."BatNbr" ='004314'
	group by vr_10630."BatNbr", vr_10630."RefNbr",vr_10630."InvtID",vr_10630."PerPost",vr_10630."TranType"
union all	
select 'GL',perpost,batnbr,REFNBR,acct,trantype,ROUND( sum(DRAmt)- sum(CrAmt),2) ,ROUND( sum(curyDRAmt)- sum(curyCrAmt)  ,2)
from gltran G where acct IN  ('211101') and perpost  <='201807' and G.posted ='P'  --and batnbr ='004314'-- and trandesc  ='CARNE MOLIDA'  
--and  module ='IN' --and batnbr ='003812'  --and
group by perpost,acct,batnbr,REFNBR,trantype





--------------PARA LA 21
SELECT  'IN'Module,vr_10630."perpost",vr_10630.BatNbr ,vr_10630.RefNbr,vr_10630."InvtID",vr_10630."trantype",
ISNULL(  ROUND(  sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then vr_10630.TranAmt * vr_10630.InvtMult else vr_10630.ExtCost * vr_10630.InvtMult end  )),2) ,0) valor ,
sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then vr_10630.QTY * vr_10630.Unitprice * vr_10630.InvtMult else 0 end  )) valor2   
	FROM { oj ((("AM2018APP"."dbo"."vr_10630" vr_10630 INNER JOIN "AM2018APP"."dbo"."RptCompany" RptCompany ON vr_10630."CpnyID" = RptCompany."CpnyID" 
	AND vr_10630."RI_ID" = RptCompany."RI_ID")  INNER JOIN "AM2018APP"."dbo"."Inventory" Inventory ON vr_10630."InvtID" = Inventory."InvtID")
    LEFT OUTER JOIN "AM2018APP"."dbo"."ItemSite" ItemSite ON vr_10630."InvtID" = ItemSite."InvtID" AND vr_10630."SiteID" = ItemSite."SiteID") 
	INNER JOIN "AM2018APP"."dbo"."InventoryADG" InventoryADG ON Inventory."InvtID" = InventoryADG."InvtID"} WHERE (vr_10630.InvtID like '24%')
	and vr_10630.PerPost   <= '201807'-- AND RefNbr  ='00000060'  and trandesc  ='CARNE MOLIDA'   
	group by vr_10630."BatNbr", vr_10630."RefNbr",vr_10630."InvtID",vr_10630."PerPost",vr_10630."TranType"
union all	
select 'GL',perpost,batnbr,REFNBR,acct,trantype,ROUND( sum(DRAmt)- sum(CrAmt),2) ,ROUND( sum(curyDRAmt)- sum(curyCrAmt)  ,2)
from gltran G where acct IN  ('241101') and perpost  <='201807' and G.posted ='P' --and RefNbr   ='00000060' and batnbr ='008716' and trandesc  ='CARNE MOLIDA'  
--and  module ='IN' --and batnbr ='003812'  --and
group by perpost,acct,batnbr,REFNBR,trantype




select RefNbr,* from intran where BatNbr  ='004314'
select RefNbr,* from GLTran  where BatNbr  ='004314' and Module  ='IN'








004722    

004680    
004314


select y.InvcNbr ,y.cantEmb ,x.CANTIDAD  from (
SELECT INBatNbr  ,InvcNbr ,D.InvtID ,suM(QtyShip)cantEmb FROM SOShipHeader H
inner join SOShipLine D on H.ShipperID  = D.ShipperID where H.Cancelled   = 0 AND h.PerPost  ='201807' AND INBatNbr  ='007178'
group by  INBatNbr ,InvcNbr,D.InvtId
)y

inner join (
SELECT BatNbr ,RefNbr  ,InvtID ,SUM(QTY)CANTIDAD FROM INTRAN WHERE BatNbr   ='007178' AND RefNbr NOT IN (SELECT REFNBR FROM gltran WHERE MODULE  ='in' and perpost ='201807' )
and TranType  <>'CG'
GROUP BY BatNbr ,RefNbr ,TranType ,InvtID 
)X on y.INBatNbr  = x.BatNbr and y.InvcNbr  = x.RefNbr and y.InvtID  = x.InvtID 
where    Y.cantEmb <> X.CANTIDAD 



7178
606





select TranType ,* from INTran where RefNbr  = '000606' and BatNbr  ='007178' and InvtID  ='24008'

select TranType ,* from GLTran where RefNbr  = '000606' and BatNbr  ='007178' and TranDesc   ='24008' and Acct  ='241101'

select TranType ,* from GLTran where RefNbr  = '000606' and BatNbr  ='007178' and Acct  ='241101'

select TranType ,* from GLTran where TranDesc  ='GFMOL' and TranType  ='AS'

GFMOL

GEMP                          

SELECT Acct ,InvtID,InvtAcct ,* FROM INTRAN WHERE TranType  ='AS' AND InvtID   ='GFMOL'

    

select TranType ,* from GLTran where TranDesc  ='GFMOL' anD BatNbr  ='008311'


select TranType ,* from GLTran where  BatNbr  ='008311' AND Module  ='IN'



select TranType ,TranDesc ,* from GLTran where RefNbr  = '000606' and BatNbr  ='007178' --and Acct  ='241101'

update INTran set Acct  ='711102' , InvtAcct  ='711102' where RefNbr  = '000606' and BatNbr  ='007178' and TranDesc in ('GEMP','GM21039')
update gltran set Acct  ='711102' where RefNbr  = '000606' and BatNbr  ='007178' and Module  ='IN' AND TranDesc in ('GEMP','GM21039')


select TranType ,TranDesc ,* from GLTran where RefNbr  = '000606' and BatNbr  ='007178' --and Acct  ='241101'







select TranDesc, extcost,tranamt,invtid  from intran  g where RefNbr  ='AI00000028' and InvtID in ('I210401','I210402','I210406','I210407','I210734','I210735','I210736','I213040')
and InvtAcct  ='201101'
select g.TranDesc,SUM( g.CrAmt)  ,sum(g.DrAmt) , SUM(g.dramt ) - SUM(g.crAmt ),LineId  from GLTran  g where RefNbr  ='AI00000028' and TranDesc 
in (select TranDesc from intran  g where RefNbr  ='AI00000028' and InvtID in ('I210401','I210402','I210406','I210407','I210734','I210735','I210736','I213040'))
and Acct  ='201101'
group by  g.TranDesc,LineId

select g.TranDesc,SUM( g.CrAmt)  ,sum(g.DrAmt) , SUM(g.dramt ) - SUM(g.crAmt )  from GLTran  g where RefNbr  ='AI00000028' and TranDesc 
in (select TranDesc from intran  g where RefNbr  ='AI00000028' and InvtID in ('I210401','I210402','I210406','I210407','I210734','I210735','I210736','I213040'))
and Acct  ='201101'
group by  g.TranDesc


update GLTran set crAmt  = drAmt,drAmt  = 0  where Module  ='IN' AND  RefNbr  ='AI00000028' and TranDesc 
in (select TranDesc from intran  g where RefNbr  ='AI00000028' and InvtID in ('I210401','I210402','I210406','I210407','I210734','I210735','I210736','I213040'))
and Acct  ='201101' AND LineId IN (-32760)


------------------------------------------------------------------> enaqui el suculento master para cuadrar (ultimo cuando no se pueda)

SELECT  'IN'Module,vr_10630."perpost",vr_10630.BatNbr ,vr_10630.RefNbr,vr_10630."InvtID",vr_10630."trantype",
        ISNULL(  ROUND(  sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then vr_10630.TranAmt * vr_10630.InvtMult else vr_10630.ExtCost * vr_10630.InvtMult end  )),2) ,0) valor ,
        sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then vr_10630.QTY * vr_10630.Unitprice * vr_10630.InvtMult else 0 end  )) valor2   
	FROM { oj ((("AMCAF2018APP"."dbo"."vr_10630" vr_10630 INNER JOIN "AMCAF2018APP"."dbo"."RptCompany" RptCompany ON vr_10630."CpnyID" = RptCompany."CpnyID" 
	AND vr_10630."RI_ID" = RptCompany."RI_ID")  INNER JOIN "AMCAF2018APP"."dbo"."Inventory" Inventory ON vr_10630."InvtID" = Inventory."InvtID")
    LEFT OUTER JOIN "AMCAF2018APP"."dbo"."ItemSite" ItemSite ON vr_10630."InvtID" = ItemSite."InvtID" AND vr_10630."SiteID" = ItemSite."SiteID") 
	INNER JOIN "AMCAF2018APP"."dbo"."InventoryADG" InventoryADG ON Inventory."InvtID" = InventoryADG."InvtID"} WHERE (vr_10630.invtacct = '211101')
	and vr_10630.PerPost  <= '201807' --AND RefNbr  ='AI00000196'-- AND vr_10630.BATNBR  ='008482' 
	group by vr_10630."BatNbr", vr_10630."RefNbr",vr_10630."InvtID",vr_10630."PerPost",vr_10630."TranType"
	union all	
select 'GL',perpost,batnbr,REFNBR,acct,trantype,ROUND( sum(DRAmt)- sum(CrAmt),2) ,ROUND( sum(curyDRAmt)- sum(curyCrAmt)  ,2)
from gltran where acct = '211101' and perpost  <='201807' --and RefNbr   ='AI00000196' --AND GLTran .BatNbr  ='008482'
--and  module ='IN' --and batnbr ='003812'  --and
group by perpost,acct,batnbr,REFNBR,trantype







SELECT  'IN'Module,vr_10630."perpost",vr_10630.BatNbr ,vr_10630.RefNbr,vr_10630."InvtID",vr_10630."trantype",
        ISNULL(  ROUND(  sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then vr_10630.TranAmt * vr_10630.InvtMult else vr_10630.ExtCost * vr_10630.InvtMult end  )),2) ,0) valor ,
        sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then vr_10630.QTY * vr_10630.Unitprice * vr_10630.InvtMult else 0 end  )) valor2   
	FROM { oj ((("AMCAF2018APP"."dbo"."vr_10630" vr_10630 INNER JOIN "AMCAF2018APP"."dbo"."RptCompany" RptCompany ON vr_10630."CpnyID" = RptCompany."CpnyID" 
	AND vr_10630."RI_ID" = RptCompany."RI_ID")  INNER JOIN "AMCAF2018APP"."dbo"."Inventory" Inventory ON vr_10630."InvtID" = Inventory."InvtID")
    LEFT OUTER JOIN "AMCAF2018APP"."dbo"."ItemSite" ItemSite ON vr_10630."InvtID" = ItemSite."InvtID" AND vr_10630."SiteID" = ItemSite."SiteID") 
	INNER JOIN "AMCAF2018APP"."dbo"."InventoryADG" InventoryADG ON Inventory."InvtID" = InventoryADG."InvtID"} WHERE (vr_10630.invtacct = '201101')
	and vr_10630.PerPost  <= '201803' --AND RefNbr  ='AI00000560' AND vr_10630.BATNBR  ='026076'  --and valor < 0
	group by vr_10630."BatNbr", vr_10630."RefNbr",vr_10630."InvtID",vr_10630."PerPost",vr_10630."TranType"
	union all	
select 'GL',perpost,batnbr,REFNBR,acct,trantype,ROUND( sum(DRAmt)- sum(CrAmt),2) ,ROUND( sum(curyDRAmt)- sum(curyCrAmt)  ,2)
from gltran where acct like '201101%' and perpost  <='201803'-- and RefNbr   ='AI00000560' AND GLTran .BatNbr  ='026076'
--and  module ='IN' --and batnbr ='003812'  --and
group by perpost,acct,batnbr,REFNBR,trantype


select x.Module,x.perpost,X.INVTID, S.Descr,X.valor  from (
SELECT  'IN'Module,vr_10630."perpost",vr_10630.BatNbr ,vr_10630.RefNbr,vr_10630."InvtID",vr_10630."trantype",
        ISNULL(  ROUND(  sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then vr_10630.TranAmt * vr_10630.InvtMult else vr_10630.ExtCost * vr_10630.InvtMult end  )),2) ,0) valor ,
        sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then vr_10630.QTY * vr_10630.Unitprice * vr_10630.InvtMult else 0 end  )) valor2   
	FROM { oj ((("AMCAF2018APP"."dbo"."vr_10630" vr_10630 INNER JOIN "AMCAF2018APP"."dbo"."RptCompany" RptCompany ON vr_10630."CpnyID" = RptCompany."CpnyID" 
	AND vr_10630."RI_ID" = RptCompany."RI_ID")  INNER JOIN "AMCAF2018APP"."dbo"."Inventory" Inventory ON vr_10630."InvtID" = Inventory."InvtID")
    LEFT OUTER JOIN "AMCAF2018APP"."dbo"."ItemSite" ItemSite ON vr_10630."InvtID" = ItemSite."InvtID" AND vr_10630."SiteID" = ItemSite."SiteID") 
	INNER JOIN "AMCAF2018APP"."dbo"."InventoryADG" InventoryADG ON Inventory."InvtID" = InventoryADG."InvtID"} WHERE (vr_10630.invtacct = '201101')
	and vr_10630.PerPost  <= '201807' AND RefNbr  ='AI00000196' AND vr_10630.BATNBR  ='008482'  --and valor < 0
	group by vr_10630."BatNbr", vr_10630."RefNbr",vr_10630."InvtID",vr_10630."PerPost",vr_10630."TranType"
	)x 
	inner join Inventory S on X.invtid  = S.InvtID
	where valor < 0


	select  trandesc, sum(( DrAmt - CrAmt  )) from GLTran where RefNbr  ='AI00000196' and BatNbr  ='008482' and CrAmt  > 0 and Acct  ='201101' group by TranDesc 

	--008482	AI00000196     

	--update INTran set LineRef  ='00001' WHERE InvtID   ='I210701' AND RefNbr  ='AI00000196' AND BatNbr  ='008482' and LineNbr  ='16'

	SELECT LineRef, LineNbr, Invtid, TranDesc, ExtCost, PerPost, * FROM INTRAN WHERE InvtID   ='I210701' AND RefNbr  ='AI00000196' AND BatNbr  ='008482'
	
	SELECT CuryCrAmt, PerPost, * FROM GLTRAN WHERE TranDesc   ='PASTEL DE ACELGA' AND RefNbr  ='AI00000196' AND BatNbr  ='008482'

--(POSITIVOS VAN AL DEBITO Y NEGATIVOS AL CREDITO)

26076
AI00000560     


select* from INTran where RefNbr  ='AI00000196' and InvtID in ('I210732','I211402')       
select ExtCost ,TranAmt ,CostType,InvtMult,* from INTran where BatNbr  ='003977' and InvtID in ('I210732')      
select InvtMult,TranAmt,* from INTran where RefNbr  ='AI00000196' and InvtID in ('I210732')--,'I211402')      
             
			 SELECT PerPost ,*  FROM INTran WHERE InvtID in ('I210732') AND TranType  ='aj' and InvtMult  = -1

select * from GLTran where RefNbr  ='AI00000196' and BatNbr  ='008482' and TranDesc  ='GALLETA CHOCOCHIPS            '

select * from GLTran where TranDesc  ='GALLETA CHOCOCHIPS            ' and TranType ='AJ' AND RefNbr <> 'AI00000196' AND CrAmt > 0
select * from GLTran where TranDesc  ='GALLETA CHOCOCHIPS            ' and TranType ='AJ' AND RefNbr <> 'AI00000196' AND PerPost  ='201805'


SELECT  'IN'Module,vr_10630."perpost",vr_10630.BatNbr ,vr_10630.RefNbr,vr_10630."InvtID",vr_10630.TranDesc ,vr_10630."trantype",
        ISNULL(  ROUND(  sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then vr_10630.TranAmt * vr_10630.InvtMult else vr_10630.ExtCost * vr_10630.InvtMult end  )),2) ,0) valor ,
        sum((case when vr_10630.TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then vr_10630.QTY * vr_10630.Unitprice * vr_10630.InvtMult else 0 end  )) valor2   
	FROM { oj ((("AM2018APP"."dbo"."vr_10630" vr_10630 INNER JOIN "AM2018APP"."dbo"."RptCompany" RptCompany ON vr_10630."CpnyID" = RptCompany."CpnyID" 
	AND vr_10630."RI_ID" = RptCompany."RI_ID")  INNER JOIN "AM2018APP"."dbo"."Inventory" Inventory ON vr_10630."InvtID" = Inventory."InvtID")
    LEFT OUTER JOIN "AM2018APP"."dbo"."ItemSite" ItemSite ON vr_10630."InvtID" = ItemSite."InvtID" AND vr_10630."SiteID" = ItemSite."SiteID") 
	INNER JOIN "AM2018APP"."dbo"."InventoryADG" InventoryADG ON Inventory."InvtID" = InventoryADG."InvtID"} WHERE (vr_10630.invtacct = '241101')
	and vr_10630.PerPost  = '201804'-- AND RefNbr  ='AI00000005'
	group by vr_10630."BatNbr", vr_10630."RefNbr",vr_10630."InvtID",vr_10630.TranDesc,vr_10630."PerPost",vr_10630."TranType"

select g.TranDesc,SUM( g.CrAmt)  ,sum(g.DrAmt) , SUM(g.dramt ) - SUM(g.crAmt )  from GLTran  g where RefNbr  ='AI00000028' and TranDesc 
in (select TranDesc from intran  g where RefNbr  ='AI00000005') -- and InvtID in ('I210401','I210402','I210406','I210407','I210734','I210735','I210736','I213040'))
and Acct  ='201101'
group by  g.TranDesc


------------------------------------ALTOMAYO
   
select 'AR'module ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor 
from intran where   invtid  like '20%'  and perpost <='201803' --and batnbr ='002019' --andand --invtid ='20267' and 
union all
select 'GL',sum(DRAmt)- sum(CrAmt) from gltran where acct  in('201101','252401') AND POSTED ='p' and perpost <='201803'


--------

-----SOLO PARA LA 20 SE DISTRIBUYE EN GLTRAN 2 ACCT 252401
select 'AR'module ,perpost,batnbr,refnbr,invtid,trantype,round(sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )),2) valor ,
sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then QTY * Unitprice else 0 end  )) valor2 
from intran where  invtid   like '21%' and  perpost  <='201803' AND  batnbr ='008482'--batnbr ='015199' andand -- and 
group by batnbr,refnbr,invtid,perpost,trantype
union all
select 'GL',perpost,batnbr,refnbr,acct,trantype,round(sum(DRAmt)- sum(CrAmt),2),sum(curyDRAmt)- sum(curyCrAmt)  from gltran 
where  acct in ('211101') AND POSTED ='p' and perpost  <='201803'and batnbr ='008482'and  module ='IN'-- batnbr ='015199'  and
group by perpost,acct,batnbr,refnbr,trantype





--delete from gltran where BATNBR  ='002515' AND  Module  ='in' and   RefNbr   ='B030029894'   and TranDesc  ='20632' and LineId in (-32760,-32759,-32758,-32757)





SELECT InvtAcct ,* FROM INTRAN WHERE BATNBR  ='002515' AND  InvtID  ='21410' AND  RefNbr   ='B030029895'  
SELECT InvtAcct ,* FROM INTRAN WHERE BATNBR  ='002515' AND  InvtID  ='21761' AND  RefNbr   ='B030029895'  


SELECT Acct ,* FROM GLTRAN  WHERE BATNBR  ='002515' AND  Module  ='in' and   RefNbr   ='B030029895'   and TranDesc  ='21410'--and LineId in (-32760,-32759,-32758,-32757)
SELECT Acct ,* FROM GLTRAN  WHERE BATNBR  ='002515' AND  Module  ='in' and   RefNbr   ='B030029895'   and TranDesc  ='21761'--and LineId in (-32760,-32759,-32758,-32757)




  

--TENER CUENTA GLTRAN SOLO CUENTA 6 Y 2 X LINEA DE INTRAN

SELECT InvtAcct ,* FROM INTRAN WHERE BATNBR  ='002728' AND  InvtID  ='21751' AND  RefNbr   ='F050009845'   
SELECT TotCost ,* FROM SOShipLine WHERE ShipperID in (select ShipperID from SOShipHeader where Invcnbr = 'F050009845') and InvtID  ='21751'

SELECT Acct ,cramt,* FROM GLTRAN  WHERE BATNBR  ='002728' AND  Module  ='in' and   RefNbr   ='F050009845'   and TranDesc  ='21751'



update gltran set PerPost  ='201804',PerEnt  ='201804' , Posted  ='P' where BatNbr  ='002728' and Module  ='in' and RefNbr  ='F050009845' and PerPost  ='201801' 
  

delete from INTran where BatNbr  ='002986' and RefNbr  ='B030030616' and RecordID  = '111512'



EI00000302     




select * from INTran where RefNbr  ='EI00000302'





 select * from batch where batnbr ='011359' and Module  ='in'


SELECT BatNbr ,TranType,InvtID ,* FROM INTRAN WHERE BatNbr  = '011359' and refnbr  ='AI00000241' AND InvtAcct  ='241101' AND TranDesc  ='PLATANO'-- and LineID  =11

update INTRAN set LineRef  = '00002' WHERE BatNbr  = '011359' and refnbr  ='AI00000241' AND InvtAcct  ='241101' AND TranDesc  ='PLATANO' and LineID  =11 



SELECT * FROM (
select 'IN'MODULO, InvtAcct ,ROUND(ExtCost,2)ExtCost ,InvtID,lineref from INTran where BatNbr  = '004314' and refnbr  ='F010006158' AND InvtAcct  ='211101'-- AND TranDesc  ='CHINCHO'
UNION ALL
select 'GL'MODULO, Acct ,round((CuryCrAmt -CuryDrAmt)*-1 ,2)monto,TranDesc,'' from gltran  where BatNbr  = '004314' and refnbr  ='F010006158' and Module  ='IN' AND Acct  ='211101' -- AND TranDesc  ='CHINCHO'
 )X
   ORDER BY X.InvtID ASC


   

SELECT * FROM (
select 'IN'MODULO, S.InvtAcct ,ROUND(ExtCost,2)ExtCost ,I.Descr,lineref from INTran s  inner join Inventory I on S.INVTID  = I.INVTID where refnbr  ='EI00000302' AND S.InvtAcct  ='251101'-- AND TranDesc  ='CHINCHO'
UNION ALL
select 'GL'MODULO, Acct ,round((CuryCrAmt -CuryDrAmt)*-1 ,2)monto,TranDesc,'' from gltran  where  refnbr  ='EI00000302' and Module  ='IN' AND Acct  ='251101' -- AND TranDesc  ='CHINCHO'
 )X
   ORDER BY X.Descr ASC


   select InvtID ,* from Inventory where descr  ='AZUCAR EN SACHETS - CAFETERIA'

   AZUCAR EN SACHETS - CAFETERIA                               	2.46
   CANELA EN POLVO X BOLSA 250 GR                              	3	3

select * from gltran where RefNbr  ='EI00000302' and TranDesc  ='AZUCAR EN SACHETS - CAFETERIA'

select * from gltran where RefNbr  ='EI00000302' and TranDesc  ='CANELA EN POLVO X BOLSA 250 GR'


select Qty,* from intran where RefNbr  ='EI00000302' and InvtID  ='I250007'


select * from GLtran where TranType  ='AJ' AND TranDesc  = 'AZUCAR EN SACHETS - CAFETERIA' AND BatNbr  ='017979'


INSERT INTO GLtran (Acct, AppliedDate, BalanceType, BaseCuryID, BatNbr, CpnyID, CrAmt, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCrAmt, CuryDrAmt, CuryEffDate, CuryId, CuryMultDiv, CuryRate, CuryRateType, DrAmt, EmployeeID, ExtRefNbr, FiscYr, IC_Distribution, Id, JrnlType, Labor_Class_Cd, LedgerID, LineId, LineNbr, LineRef, LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NoteID, OrigAcct, OrigBatNbr, OrigCpnyID, OrigSub, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, Posted, ProjectID, Qty, RefNbr, RevEntryOption, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, ServiceDate, Sub, TaskID, TranDate, TranDesc, TranType, Units, User1, User2, User3, User4, User5, User6, User7, User8 )
SELECT  Acct, AppliedDate, BalanceType, BaseCuryID, '016522', CpnyID, CrAmt, Crtd_DateTime, Crtd_Prog, Crtd_User, CuryCrAmt, CuryDrAmt, CuryEffDate, CuryId, CuryMultDiv, CuryRate, CuryRateType, DrAmt, EmployeeID, ExtRefNbr, FiscYr, IC_Distribution, Id, JrnlType, Labor_Class_Cd, LedgerID, LineId, 1501, LineRef, LUpd_DateTime, LUpd_Prog, LUpd_User, Module, NoteID, OrigAcct, OrigBatNbr, OrigCpnyID, OrigSub, PC_Flag, PC_ID, PC_Status, PerEnt, PerPost, Posted, ProjectID, 111, 'EI00000302', RevEntryOption, Rlsed, S4Future01, S4Future02, S4Future03, S4Future04, S4Future05, S4Future06, S4Future07, S4Future08, S4Future09, S4Future10, S4Future11, S4Future12, ServiceDate, Sub, TaskID, TranDate, TranDesc, TranType, Units, User1, User2, User3, User4, User5, User6, User7, User8 
FROM GLTran WHERE  TranType  ='AJ' AND TranDesc  = 'AZUCAR EN SACHETS - CAFETERIA' AND BatNbr  ='017979' --AND Acct  ='711101'

711101

SELECT  * FROM GLTRAN WHERE REFNBR  ='EI00000302' AND TranDesc  ='AZUCAR EN SACHETS - CAFETERIA'

 UPDATE GLTRAN SET CrAmt  = 2.46,CuryCrAmt  = 2.46 WHERE REFNBR  ='EI00000302' AND TranDesc  ='AZUCAR EN SACHETS - CAFETERIA' AND Acct  ='711101'

  SELECT BatNbr ,TranType,InvtID ,* FROM INTRAN WHERE RefNbr  ='EI00000315'


/*

select * FROM INTRAN WHERE BATNBR   = '008482' 

select * from gltran  where BatNbr  = '008482' and refnbr  ='AI00000196' and Module  ='IN' AND Acct  ='201101' --and TranDesc  ='EMPANADA LOMO SALTADO'
        




select * from gltran  where BatNbr  = '008482' and refnbr  ='AI00000196' and Module  ='IN' AND Acct  ='201101'  and trandesc  ='CROCANTE DE MANZANA'
and TranDesc  ='CROCANTE DE MANZANA'
SELECT * FROM gltran WHERE batnbr  =''



select * from INTRAN where batnbr  ='008482'  AND PERPOST   ='201803' AND TRANDESC  ='PASTEL DE ACELGA'  ORDER BY TRANDESC ASC 
select * from gltran where batnbr  ='008482' and module ='IN' AND ACCT  ='201101' AND PERPOST   ='201803' AND TRANDESC  ='PASTEL DE ACELGA' ORDER BY TRANDESC ASC 


select * from gltran where batnbr  ='008482' and module ='IN' AND ACCT  ='201101'

UPDATE GLTRAN SET DRAMT  =11.53 , CURYDRAMT  = 11.53 WHERE BATNBR  ='008482' AND MODULE  ='IN' AND TRANDESC  ='BROWNIES DE DOBLE CHOCOLATE'  AND LINEID = -32720


SELECT * FROM gltran  WHERE BATNBR  ='008482' AND MODULE  ='IN' AND TRANDESC  ='BROWNIES DE DOBLE CHOCOLATE'  AND LINEID = -32720




select invtacct,* from intran where batnbr  ='008716' and refnbr ='00000060' and invtacct ='251101'




select invtacct,extcost,* from intran where batnbr  ='008716' and refnbr ='00000060' and invtacct ='251101' and trandesc  ='CARNE MOLIDA'                  
select acct,* from gltran  where  MODULE  ='IN' and batnbr  ='008716' and refnbr ='00000060' and acct ='251101' and trandesc  ='CARNE MOLIDA'



B030030616     	-16.8	-8.4


SELECT BatNbr ,* FROM INTran WHERE RefNbr  ='B030030616' AND InvtID ='20630'

SELECT BatNbr ,* FROM GLTran WHERE RefNbr  ='B030030616' AND TranDesc  ='20630'



SELECT * FROM SOShipLine WHERE ShipperID in (select ShipperID from SOShipHeader where Invcnbr = 'B030030616') and InvtID  ='20630'



012488    	213.38	2.32
00000081       	213.38	2.32

select * from INTran where BatNbr  ='012488' and  RefNbr  ='00000081'  
select * from gltran where BatNbr  ='012488' and  RefNbr  ='00000081'
