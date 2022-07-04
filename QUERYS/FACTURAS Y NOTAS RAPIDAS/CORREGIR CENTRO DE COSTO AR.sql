
-- CORREGIR CENTRO DE COSTO AR

declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='024113' -- LOTE 
set @refnbr ='B060005563' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,docdate,* from ardoc c where batnbr= @batnbr and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR' and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr and adjdrefnbr =@refnbr
go


update ardoc set banksub ='CATACAF000'  where batnbr  ='024113'  and refnbr  ='B060005563' and banksub  ='CATCCAF000'
update artran set sub ='CATACAF000'  where batnbr  ='024113'  and refnbr   ='B060005563' and sub  ='CATCCAF000'
update gltran set sub ='CATACAF000'  where batnbr  ='024113'  and module   ='AR' and refnbr   = 'B060005563' and sub ='CATCCAF000' 


