DECLARE @REF CHAR(10)
SET @REF='B030006558'
select shipperid,invcnbr,billname,termsid,*from newsh where invcnbr in(@REF)
select shipperid,invcnbr,termsid,*from soshipheader where invcnbr in(@REF)
select batnbr,rlsed,perpost,refnbr,terms,curyorigDocAmt,origDocAmt,TaxTot00, txbltot00,custid,doctype,docdate,docbal,curydocbal,opendoc,perclosed,terms,*
from ardoc where  refnbr in (@REF)    --and doctype ='IN'
select rlsed,refnbr,perpost,curyTranAmt,TranAmt,custid,trantype,*
from artran where refnbr  in (@REF) 
order by artran.refnbr
select refnbr,perpost,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,*
from gltran where   refnbr in (@REF)  and module ='Ar' 
select *from refnbr where refnbr  in (@REF) 
select AdjAmt,CuryAdjdAmt,CuryAdjgAmt,* from aradjust where AdjdRefNbr in (@REF)  --and recordid ='168319'
select *from aradjust where AdjgRefNbr in (@REF) 
select *from PLCMInvcnbr where refnbr in (@REF) 
select *from PLCMInvcnbr where invcnbr in (@REF)
