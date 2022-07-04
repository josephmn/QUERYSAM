


declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='036741' -- LOTE 
--set @refnbr ='c01-000061' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,rlsed,taxid00,applbatnbr,* from ardoc where batnbr= @batnbr-- and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran
where batnbr= @batnbr --and refnbr like @refnbr
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr --and adjdrefnbr =@refnbr
go


SELECT * FROM ARDOC WHERE REFNBR ='B290000357'


---- ELIMINAR DOCUMENTO ---- 
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='006155' -- LOTE
set @refnbr ='B290000357' -- DOCUMENTO
delete from ardoc where  batnbr  = @batnbr and refnbr  = @refnbr
delete from artran where batnbr  = @batnbr and refnbr  = @refnbr  
delete from gltran where batnbr  = @batnbr and refnbr  = @refnbr and module ='Ar'   
delete from refnbr where refnbr = @refnbr


select * from ardoc where refnbr ='f020002749'
















