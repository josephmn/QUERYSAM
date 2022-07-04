
----------- C X C
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='034596' -- LOTE 
--set @refnbr ='f270000004' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,rlsed,taxid00,applbatnbr,* from ardoc where batnbr= @batnbr --and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran
where batnbr= @batnbr --and refnbr like @refnbr
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr-- and adjdrefnbr =@refnbr
go




declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='030113' --LOTE 
--set @refnbr ='381F001659' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,rlsed,taxid00,applbatnbr,* from ardoc where batnbr= @batnbr --and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran
where batnbr= @batnbr --and refnbr like @refnbr
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'AR'-- and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr-- and adjdrefnbr =@refnbr
go





select* from wrkreleasebad

exec ardebug '031513'
select * from gltran where module ='ar' and batnbr ='031513'


select batnbr,sum(curyorigdocamt) from ardoc where batnbr ='030699'
group by batnbr

exec ardebug '031258'

exec liberarar '031258'

delete from cf_regvtas where exportadofn ='030699' and referenciafn ='381F001659'

select* from ardoc where refnbr= '381F001659'

select* from cf_regvtas where numdoc like '%0001659' and numtienda  ='38'

select fechanegocio,* from cfm_regvtas where numdoc like '%0001659' and numtienda  ='38'







--delete from ardoc where batnbr ='030699' and refnbr ='381F001659'
--delete from artran where batnbr ='030699' and refnbr ='381F001659'



declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='014404' -- LOTE 
set @refnbr ='F010000002' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,rlsed,taxid00,applbatnbr,* from ardoc where batnbr= @batnbr and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran
where batnbr= @batnbr and refnbr like @refnbr
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'AR' and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr and adjdrefnbr =@refnbr
go


update ardoc set REFNBR ='F270000004' where batnbr ='030783' and refnbr ='F010000002'
update artran set REFNBR ='F270000004' where batnbr ='030783' and refnbr ='F010000002'
update gltran set REFNBR ='F270000004' where batnbr ='030783' and refnbr ='F010000002' and module ='ar'


SELECT * FROM CF_REGVTAS WHERE EXPORTADOFN ='030783' AND REFERENCIAFN='F010000002'
UPDATE CF_REGVTAS SET REFERENCIAFN ='F270000004'  WHERE EXPORTADOFN ='030783' AND REFERENCIAFN='F010000002'




--update batch set bankacct ='411401' where batnbr ='021672' and module ='AR'
--update ardoc set bankacct ='411401' where batnbr ='021672'
--update artran set acct ='411401' where batnbr ='021672' and acct ='411101'
--update gltran set acct ='411401' where batnbr ='021672' and module ='AR' and acct ='411101'

----------------  CAMBIAR DOCUMENTO QUE ESTA MAL -------------------------------------------------------------

--update ardoc set REFNBR ='F270000004' where batnbr ='021672'
--update artran set acct ='411401' where batnbr ='021672' and acct ='411101'
--update gltran set acct ='411401' where batnbr ='021672' and module ='AR' and acct ='411101'


--------------------------------------------------------------------------------------------------------------




declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='021589' -- LOTE 
--set @refnbr ='381F001659' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,rlsed,taxid00,applbatnbr,* from ardoc where batnbr= @batnbr --and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran
where batnbr= @batnbr --and refnbr like @refnbr
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr --and adjdrefnbr =@refnbr
go

---- CAMBIAR DOCUMENTO TEMPORALMENTE
set @batnbr ='036917' -- LOTE 
set @refnbr ='260F000260' -- DOCUMENTO

----PASO1 CAMBIAR DOCUMENTO QUE YA EXISTE EN SOLOMON PARA PODER MIGRAR ---
----IN
update ardoc set REFNBR ='260F900261' where batnbr ='036917' and refnbr ='260F000261'
update artran set REFNBR ='260F900261' where batnbr ='036917' and refnbr ='260F000261'
update gltran set REFNBR ='260F900261' where batnbr ='036917' and refnbr ='260F000261' and module ='ar'

update cf_regvtas set referenciafn ='260F900261' where exportadofn ='036917' and referenciafn ='260F000261'
--
----PA
--update ardoc set REFNBR ='381F001659' where batnbr ='014425' and refnbr ='381F-01659'
--update artran set REFNBR ='381F001659' where batnbr ='014425' and refnbr ='381F-01659'
--update gltran set REFNBR ='381F001659' where batnbr ='014425' and refnbr ='381F-01659' and module ='ar'
--update aradjust set adjdrefnbr ='381F001659',adjgrefnbr ='381F001659' where adjbatnbr ='014425'
--update cf_regvtas set referenciafn ='381F001659', referenciaPA='381F001659'  where exportadofn ='014404' and referenciafn='381F-01659' 
--
--
--select * from cf_regvtas  where exportadofn ='014404' and referenciafn='381F001659' --CFAYACUC000000002445
--select*  from cfm_regvtas where chk_num ='CFAYACUC000000002445'
