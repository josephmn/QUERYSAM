
USE [AM2015APP]
GO

fdsfdsfs

SELECT distinct shipperid FROM SOSHIPLINE

select 
TotCost,TotInvc   ,TotMerch,TxblAmt00,CuryTotCost,CuryTotInvc,CuryTotMerch,CuryTxblAmt00,CurySlsPrice,CuryTaxAmt00,Cost,TaxAmt00,SlsPrice,*
from soshipline where shipperid in('FLI0001667')

select CuryMerchTax,MerchTax,CuryTotTax,TotTax,CuryMerchTxbl,MerchTxbl,CuryMerchTxblLessTax,MerchTxblLessTax,CuryTotTxbl,TotTxbl,*
--update SOSHIPTAX set TotTax= CuryTotTax *3.158
from SOSHIPTAX  where shipperid in('FLI0001667')

select invcnbr,BalDue,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,TotCost,CuryRate,*
from soshipheader where shipperid in('FLI0001667')

select rlsed,status,perpost,CrTot,CtrlTot,CuryCrTot,CuryCtrlTot,CuryDepositAmt,CuryDrTot,CuryRate,DrTot,*from batch where batnbr   in('008225')  and module ='Ar'
select rlsed,refnbr,curyorigDocAmt,origDocAmt,curydocbal,docbal,custid,doctype,docdate,user2,perpost,CuryRate,*from ardoc where batnbr  in('008225') --and refnbr in ('141B031934')
select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc,perpost,CuryRate,*from artran where batnbr  in('008225')  --and refnbr in ('141B031934')--and acct ='999999'
select refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,perpost,CuryRate,*
from gltran where batnbr  in('008225')  and module ='Ar' --and refnbr in ('141B031934') --and acct ='999999'order by gltran.refnbr
select *from aradjust where adjbatnbr  in('008225') 




/*actualizar el tipo de cmabio*/
--update soshipheader set  CuryRateType='VENTA',CuryRate= 3.156 from soshipheader where shipperid in('FLI0001667')
--update batch set  CuryRate= 3.156 , CuryID='DOL',CuryRateType='VENTA' from batch where batnbr='006123' and module ='AR'
--update ardoc set  CuryRate= 3.156 , CuryID='DOL',CuryRateType='VENTA'   from ardoc where batnbr='006123'
--update artran set  CuryRate= 3.156, CuryID='DOL'  from artran where batnbr='006123'
--update gltran set  CuryRate= 3.156 , CuryID='DOL',CuryRateType='VENTA'   from gltran where batnbr='006123' and module ='AR'


/* ejecutar estos 3 querys , en el primero cambiar el tipo de cambio y ejecutar los 3 querys colocando el numero del embarque*/
--1
select TotCost,TotInvc  ,TotMerch,TxblAmt00,CuryTotCost,CuryTotInvc      ,CuryTotMerch,CuryTxblAmt00,CurySlsPrice,CuryTaxAmt00,Cost,TaxAmt00,SlsPrice,*
--update soshipline set TotInvc= CuryTotInvc * 3.156,TotMerch= CuryTotMerch * 3.156 ,TxblAmt00= CuryTxblAmt00 * 3.156 ,TotCost= CuryTotCost * 3.156 ,TaxAmt00= CuryTaxAmt00 * 3.156 ,SlsPrice= CurySlsPrice * 3.156 
from soshipline where shipperid in('FLI0001667')
--2
select invcnbr,BalDue,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,TotCost,*
--update soshipheader set BalDue =CuryBalDue * CuryRate ,TotInvc= CuryTotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,TotTax= CuryTotTax * CuryRate 
from soshipheader  where arbatnbr ='008225'  where shipperid in('FLI0001667')
--3
select invcnbr,BalDue,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,CuryTotMerch * 0.18,TotCost,*
--update soshipheader set CuryBalDue=  CuryTotMerch * 1.18 --,CuryTotInvc= TotInvc * CuryRate ,TotMerch= CuryTotMerch * CuryRate ,CuryTotTax= TotTax * CuryRate 
from soshipheader where shipperid in('FLI0001667')


/* ejecutar estos 4 querys , ejecutar los 4 querys colocando el numero de lote*/
--1
select rlsed,status,perpost,CrTot,CtrlTot,CuryCrTot,CuryCtrlTot,CuryDepositAmt,CuryDrTot,CuryRate,DrTot,*
--update batch set CrTot= CuryCrTot * CuryRate ,CtrlTot= CuryCrTot * CuryRate ,DrTot= CuryCrTot * CuryRate 
from batch where batnbr   in('006123')  and module ='Ar'
--2
select rlsed,refnbr,curyorigDocAmt,origDocAmt,curydocbal,docbal,custid,doctype,docdate,user2,perpost,CuryRate,*
--update ardoc set origDocAmt= curyorigDocAmt * CuryRate ,docbal= curydocbal * CuryRate ,TaxTot00=curyTaxTot00 * CuryRate 
from ardoc where batnbr  in('006123') --and refnbr in ('141B031934')
--3
select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc,perpost,CuryRate,*
--update artran set TranAmt= curyTranAmt * CuryRate 
from artran where batnbr  in('006123')  --and refnbr in ('141B031934')--and acct ='999999'
--4
select refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,perpost,CuryRate,*
--update gltran set cramt= curycramt * CuryRate ,dramt= curydramt * CuryRate 
from gltran where batnbr  in('006123')  and module ='Ar' --and refnbr in ('141B031934') --and acct ='999999'order by gltran.refnbr





USE [AM2015SYS]
GO


use [AM2015APP]
GO







SELECT * FROM SCREEN WHERE NUMBER LIKE '%40188%'



