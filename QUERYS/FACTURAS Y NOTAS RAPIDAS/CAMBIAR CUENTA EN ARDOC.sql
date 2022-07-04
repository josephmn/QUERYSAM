use [AMCAF2016APP]
go


B070006194
B050004078

Cámbialo por la cuenta 759201 



declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='041669' -- LOTE 
--set @refnbr ='REC0000237' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,DOCTYPE,batnbr,docbal,refnbr,doctype,rlsed,taxid00,applbatnbr,* from ardoc where batnbr= @batnbr-- and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran
where batnbr= @batnbr --and refnbr like @refnbr
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr --and adjdrefnbr =@refnbr
go


update artran  set acct ='149101' where batnbr  ='041669' and tranamt  = 53.06 and acct ='121301'


update gltran  set acct ='149101'   where batnbr  ='041669' and cramt  = 53.06 and acct ='121301' and module  ='AR'


select * from  artran where batnbr  ='041669' and tranamt  = 53.06 and acct ='121301'

select * from  gltran where batnbr  ='041669' and CRAMT  = 53.06 and acct ='121301' and module  ='AR'
select * from  gltran where batnbr  ='041669' and DRAMT  = 53.06 and acct ='121301' and module  ='AR'

149101    
SELECT DOCTYPE,* FROM ARDOC WHERE REFNBR ='B050004078'

, esta con 121301 y debe ir con la cta. 149101 

-- CAMBIAR CUENTA EN ARDOC,ARTRAN,GLTRAN(AR)
--411101 , pfv cambiarlo a 419102
/*
update ardoc set bankacct  ='104120' where batnbr ='026543' and REFNBR ='REC0000237' AND 

set @batnbr ='021224' -- LOTE 
set @refnbr ='B050004078' -- DOCUMENTO
update artran set acct ='999999' where batnbr ='026543' and acct ='759201' and refnbr ='REC0000237' 
update gltran set acct ='999999' 
 where batnbr  ='026543' and module ='AR' and acct ='759201' and refnbr ='REC0000237' 
*/







