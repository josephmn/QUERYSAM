use [am2015app]
go
 
select TotCost,TotInvc   ,TotMerch,TxblAmt00,CuryTotCost,CuryTotInvc,CuryTotMerch,CuryTxblAmt00,CurySlsPrice,CuryTaxAmt00,Cost,TaxAmt00,SlsPrice,*
from soshipline where shipperid in('NCLI000103')

select CuryMerchTax,MerchTax,CuryTotTax,TotTax,CuryMerchTxbl,MerchTxbl,CuryMerchTxblLessTax,MerchTxblLessTax,CuryTotTxbl,TotTxbl,*
--update SOSHIPTAX set TotTax= CuryTotTax *3.158
from SOSHIPTAX  where shipperid in('NCLI000103')

select invcnbr,BalDue,CuryBalDue,CuryRate,CuryTotInvc,TotInvc,CuryTotMerch,TotMerch,CuryTotTax,TotTax,TotCost,CuryRate,*
from soshipheader where shipperid in('NCLI000103')

select * from  phedespacho1 where nrodespacho ='S000000488'

update phedespacho1 set   user11='R' where nrodespacho ='S000000488'


008687   
 
010084


select rlsed,status,perpost,CrTot,CtrlTot,CuryCrTot,CuryCtrlTot,CuryDepositAmt,CuryDrTot,CuryRate,DrTot,*from batch where batnbr   in('008687')  and module ='Ar'
select rlsed,refnbr,curyorigDocAmt,origDocAmt,curydocbal,docbal,custid,doctype,docdate,user2,perpost,CuryRate,*from ardoc where batnbr  in('008687') --and refnbr in ('141B031934')
select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc,perpost,CuryRate,*from artran where batnbr  in('008687')  --and refnbr in ('141B031934')--and acct ='999999'
select refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,perpost,CuryRate,*
from gltran where batnbr  in('008687')  and module ='Ar' --and refnbr in ('141B031934') --and acct ='999999'order by gltran.refnbr
select *from aradjust where adjbatnbr  in('008687') 





select * from soshipheader where shipperid=  'NCLI000103' 














