

declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='028592' -- LOTE 
--set @refnbr ='F250001032' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,docdate,* from ardoc c where batnbr= @batnbr --and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr-- and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr --and adjdrefnbr =@refnbr
go


 select doctype,docbal,curydocbal,* from ardoc where refnbr  ='011B171991' AND doctype ='IN'
 select  doctype,* from ardoc where refnbr  ='011B171991'AND  doctype ='PA'
 


--delete from HistDocSlsTax where refnbr in (select refnbr from ardoc where batnbr in ('021519'))
exec ardebug '021519'
exec liberarar '021519'
liber


select adjbatnbr,adjdrefnbr,count(*)  from aradjust where adjgperpost  ='201607'
group by adjbatnbr , adjdrefnbr having count(*) >1 order by adjbatnbr asc











