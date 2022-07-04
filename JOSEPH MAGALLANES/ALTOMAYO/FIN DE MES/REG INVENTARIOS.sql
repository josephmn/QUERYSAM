


select 'IN'module ,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor ,
sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then QTY * Unitprice else 0 end  )) valor2 
from intran where  invtacct like '28%'  and rlsed =1 AND perpost     <='201706' --and  perpost    in('201612')batnbr ='015199' andand --invtid ='20267' and 
union all
select 'GL',sum(DRAmt)- sum(CrAmt),sum(curyDRAmt)- sum(curyCrAmt)  from gltran where acct like '28%' AND perpost    <='201706' --and perpost    in('201612')   --and  module ='GL'-- batnbr ='015199'  and



/* POR LOTE */
select 'IN'module ,perpost,batnbr,REFNBR,invtid,trantype,sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR') then TranAmt * InvtMult else ExtCost * InvtMult end  )) valor ,
sum((case when TranType in ('RC', 'AJ', 'AC', 'AS', 'TR','IN') then QTY * Unitprice * InvtMult else 0 end  )) valor2 
from intran where invtacct like '241101%' and   rlsed =1  AND perpost   <='201706' --and RefNbr  ='00000073'
group by batnbr,REFNBR,invtid,perpost,trantype
union all
select 'GL',perpost,batnbr,REFNBR,acct,trantype,sum(DRAmt)- sum(CrAmt),sum(curyDRAmt)- sum(curyCrAmt)  
from gltran where acct like '241101%' and perpost <='201706' --and RefNbr  ='00000073'
--and  module ='IN' --and batnbr ='003812'  --and
group by perpost,acct,batnbr,REFNBR,trantype

SELECT Module,*FROM GLTran WHERE BatNbr ='000074' AND  acct like '20%' and perpost     <='201706'
SELECT Module,*FROM GLTran WHERE BatNbr ='019031' AND  acct like '201101%' and perpost     <='201706'


SELECT * FROM  GLTran WHERE  BATNBR  ='019031' AND  DRAMT  = 4.8 and Module ='IN'
--update GLTran set CuryDrAmt  = 4.08 ,DrAmt =4.08 where BatNbr  ='019031' and  DrAmt  =0 and Module  ='IN' AND LineId  =-32765

SELECT * FROM  GLTran WHERE  BATNBR  ='019031' AND  TranDesc ='FILETE DE POLLO'

--UPDATE GLTran SET DrAmt =4.08 , CuryDrAmt  = 4.08 WHERE BatNbr  ='019031' AND Module ='in' and LineId in (-32765,-32761)



SELECT * FROM INTran WHERE  batnbr  ='019031' and InvtID in ('i210905')
select * from GLTran where BatNbr  ='019031' and Module  ='IN' and TranDesc  ='AGUA SAN LUIS CON GAS * 650 ML'
SELECT * FROM Batch WHERE BatNbr  ='019031'AND Module ='in'

select Descr,* from inventory where invtid ='i210905'                       

-- procedemos a eliminar duplicados
delete from INTran where BatNbr  ='019031' and RecordID =289268
DELETE FROM GLTran where BatNbr  ='019031' and Module  ='IN' AND LineId IN (-32764,-32763)

-32764
-32763

