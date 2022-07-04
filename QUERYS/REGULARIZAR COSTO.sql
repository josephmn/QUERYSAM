
--ACTU_COST_TR '006808','I250442',3.68



ACTU_COST_SI '007468','I212225', 1.436

--ACTU_COST_KIT '001521','21141',1.321830

--ACTU_COST_venta '032313','','I213438',1.321830


SP_HELPTEXT  ACTU_COST_TR

-------------------------------------------------
CREATE PROCEDURE ACTU_COST_TR  
@LOTE CHAR(6),  
@PRO CHAR(7),  
@COSTO NUMERIC (18,4)  
  
AS  
BEGIN  
  
DECLARE @COSEXT NUMERIC (18,4)  
update intran set UnitPrice =@COSTO  
from intran where batnbr IN(@LOTE) AND invtid IN(@PRO) AND TRANTYPE in('TR','CT')  
update intran set  tranAmt= qty * UnitPrice ,ExtCost= qty * UnitPrice  
from intran where batnbr IN(@LOTE) AND invtid IN(@PRO)  AND TRANTYPE ='TR'  
update intran set  tranAmt= qty * UnitPrice   
from intran where batnbr IN(@LOTE) AND invtid IN(@PRO)  AND TRANTYPE ='CT'  
  
  
SELECT ( qty * UnitPrice) from intran where batnbr IN(@LOTE) AND invtid IN(@PRO)  AND TRANTYPE ='CT'  
SET @COSEXT = (SELECT ( qty * UnitPrice) from intran where batnbr IN(@LOTE) AND invtid IN(@PRO)  AND TRANTYPE ='CT')  
  
--DECLARE @COSTOtOTAL NUMERIC (18,2)  
--SET @COSTOtOTAL = ( SELECT sum(tranAmt) from intran where batnbr IN(@LOTE)  AND TranType IN('TR') and invtMult <>1)  
  
--SELECT @COSTOtOTAL  
--select sum(tranAmt),sum(ExtCost) from intran where batnbr in(@LOTE) AND TranType IN('TR') and invtMult <>1  
  
  
  
--select batnbr,refnbr ,CrAmt,DrAmt ,CuryCrAmt,CuryDrAmt,TranType,CuryId,CuryMultDiv,CuryRate,trandesc,*  
update gltran set Cramt=(case when Cramt <>0 then @COSEXT else 0 end ),CuryCramt=(case when CuryCramt <>0 then @COSEXT else 0 end ),Dramt=(case when Dramt <>0 then @COSEXT else 0 end ),CuryDramt=(case when CuryDramt <>0 then @COSEXT else 0 end )  
from gltran   
where batnbr  in(@LOTE)  and module ='IN' AND  trandesc IN(@PRO) AND TranType ='TR'  
  
--select batnbr,refnbr ,CrAmt,DrAmt ,CuryCrAmt,CuryDrAmt,TranType,CuryId,CuryMultDiv,CuryRate,trandesc,*  
update gltran set Cramt=(case when Cramt <>0 then @COSEXT else 0 end ),CuryCramt=(case when CuryCramt <>0 then @COSEXT else 0 end ),Dramt=(case when Dramt <>0 then @COSEXT else 0 end ),CuryDramt=(case when CuryDramt <>0 then @COSEXT else 0 end )  
from gltran   
where batnbr  in(@LOTE)  and module ='IN' AND  TranType ='CT'   
AND trandesc IN(SELECT TOP 1 TRANDESC from intran where batnbr IN(@LOTE) AND invtid IN(@PRO) AND TRANTYPE ='TR')  
  
--SELECT *  
--from gltran   
--where batnbr  in(@LOTE)  and module ='IN' AND  trandesc IN(SELECT TRANDESC from intran where batnbr IN(@LOTE) AND invtid IN(@PRO) AND TRANTYPE ='aj')  
  
END   


-------------------------------------------------







select 'IN'module ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor ,
sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then QTY * Unitprice else 0 end  )) valor2 
from intran where  invtacct like '281101%'  and rlsed =1 AND perpost     IN ('201703','201704') --and  perpost    in('201612')batnbr ='015199' andand --invtid ='20267' and 
union all
select 'GL',sum(DRAmt)- sum(CrAmt),sum(curyDRAmt)- sum(curyCrAmt)  from gltran where acct like '281101%' AND perpost     IN ('201703','201704') --and perpost    in('201612')   --and  module ='GL'-- batnbr ='015199'  and



/* POR LOTE */
select 'IN'module ,perpost,batnbr,REFNBR,invtid,trantype,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor ,
sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then QTY * Unitprice * InvtMult else 0 end  )) valor2 
from intran where invtacct like '281101%' and   rlsed =1  AND perpost      IN ('201703') --and batnbr ='003812' --andand --invtid ='20267' and 
group by batnbr,REFNBR,invtid,perpost,trantype
union all
select 'GL',perpost,batnbr,REFNBR,acct,trantype,sum(DRAmt)- sum(CrAmt),sum(curyDRAmt)- sum(curyCrAmt)  
from gltran where acct like '281101%' and perpost     IN ('201703')
--and  module ='IN' --and batnbr ='003812'  --and
group by perpost,acct,batnbr,REFNBR,trantype

SELECT Module,*FROM GLTran WHERE BatNbr ='000074' AND  acct like '20%' and perpost     <='201703'
SELECT Module,*FROM GLTran WHERE BatNbr ='000179' AND  acct like '20%' and perpost     <='201703'

