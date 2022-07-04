
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='010344' -- LOTE 
--set @refnbr ='B110003735' --DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docdate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid,* from ardoc c where batnbr= @batnbr-- and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr -- and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR'--and refnbr like @refnbr 
select * from aradjust where adjbatnbr = @batnbr --and adjdrefnbr =@refnbr
go


--ardebug '010344'
--liberarar '010344'

/*
--SOLO SI TIENE CUENTA 12 , RLSED =1  Y NO ESTA EN GLTRAN =AR
delete from artran where batnbr  ='010344' and rlsed  ='1' and acct ='121301'
delete from wrkrelease
delete from wrkreleasebad
delete from histdocslstax where refnbr in (select refnbr from ardoc where batnbr  = '010344')
*/