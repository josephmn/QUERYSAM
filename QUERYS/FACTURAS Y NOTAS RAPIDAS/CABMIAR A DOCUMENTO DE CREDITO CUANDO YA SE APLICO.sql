

------------------------------------------------------------------------------------------------------------
-- CAMBIAR DOCUMENTO A NOTA DE CREDITO CUANDO YA SE APLICÓ
------------------------------------------------------------------------------------------------------------

declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='012126' -- LOTE 
set @refnbr ='331F004276' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,* from ardoc c where batnbr= @batnbr and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr  and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR' and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr and adjdrefnbr =@refnbr
go


----------------
-- 1 DETECTAR PROVISION (IN) Y CAMBIARLO A CM  EN ARDOC
----------------
declare @DOC varchar(10)
declare @LOTE char(6)
set @LOTE  ='010908'
set @DOC  ='331F004276'
select perpost,batnbr,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,docbal,curydocbal,origdocamt,curyorigdocamt,*
--update c set doctype  ='CM' ,docbal =origdocamt,curydocbal =curyorigdocamt
from ardoc c
where batnbr= @LOTE and refnbr =@DOC 
----------------
-- 2 CAMBIAR A TIPO NOPAGO Y QUITAR LOTE DE APLICACION
----------------
DECLARE @LOTEPA CHAR(6)
SELECT @LOTEPA = (SELECT BATNBR FROM ARDOC WHERE REFNBR = @DOC AND DOCTYPE ='PA' AND REFNBR IN (select adjdrefnbr from aradjust))
if  LEN(@LOTEPA) = 6
begin
delete from batch where batnbr =@LOTEPA and module  ='ar'
delete from ardoc where batnbr =@LOTEPA
delete from artran where batnbr =@LOTEPA
delete from gltran where batnbr =@LOTEPA and module  ='ar'
delete from aradjust where adjbatnbr =@LOTEPA
update cf_regvtas set exportadopa ='' , referenciapa ='' ,user06 ='NOPAGO' where exportadopa =@LOTEPA
end






