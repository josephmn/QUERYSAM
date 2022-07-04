
043207     B110003737 0           COFFEARTS  2017-01-05 20:12:55.497 08400    SYSADMIN   0                      SOL    M           1                      0.000                                   0.000                                   8888888         0                      IN      AR   2017-01-05 20:12:55.497 08400    SYSADMIN   B110003737 0                               0           0           0           0                     0           0                     IGV1       0.000                                   0.000                                             0           0                               201612
043207     B110003738 0           COFFEARTS  2017-01-05 20:12:55.497 08400    SYSADMIN   0                      SOL    M           1                      0.000                                   0.000                                   8888888         0                      IN      AR   2017-01-05 20:12:55.497 08400    SYSADMIN   B110003738 0                               0           0           0           0                     0           0                     IGV1       0.000                                   0.000                                             0           0                               201612
043207     B110003744

----CAMBIAR DOCUMENTO
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='043207' -- LOTE 
set @refnbr ='B110003744' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,docdate,* from ardoc c where batnbr= @batnbr and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR'and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr and adjdrefnbr =@refnbr
go


SELECT * FROM ARDOC WHERE REFNBR ='141F017133'


update ardoc SET refnbr ='B110903744' where batnbr = '043207' and refnbr = 'B110003744'
update artran SET refnbr ='B110903744' where batnbr = '043207' and refnbr = 'B110003744'



update gltran SET refnbr ='F030002139' where batnbr = '043207' and  module ='AR' and refnbr ='141F017133'
--update cf_regvtas set referenciafn ='F030002139' where exportadofn ='023972' and referenciafn ='141F017133'
update cf_regvtas set referenciaPA ='F030002139' where exportadopa ='024026' and referenciaPA ='141F017133'
UPDATE ARADJUST SET ADJDREFNBR ='F030002139',ADJGREFNBR ='F030002139' WHERE ADJBATNBR ='024026' AND ADJDREFNBR='141F017133'

select* from cf_regvtas where   exportadofn ='023972' and referenciafn ='F030002139'
update cf_regvtas set tipodoc  ='01' where   exportadofn ='023972' and referenciafn ='F030002139'
update refnbr set refnbr ='F030002139' where refnbr  ='141F017133'




020859     B220000773
---- CAMBIAR POR CENTRO DE COSTO  0000000000 --------
select * from batch where batnbr = '018030' and  module ='ar'
select * from ardoc where batnbr ='018030' and refnbr ='F220000502'
select * from artran where batnbr  ='018030' and refnbr ='F220000502'
select * from gltran where batnbr = '018030' and  module ='ar' and refnbr ='F220000502'
select * from aradjust where adjbatnbr = '018030' AND ADJDREFNBR ='F220000502'

--update batch SET refnbr ='B240000745' where batnbr = '030113' and  module ='ar' 
030500
select doctype,*  from ardoc where refnbr ='F220000502'


018030    	    F220000502   


020801     B220000760

update ardoc SET custid ='05642545' where batnbr = '023972' and refnbr = 'B080011435'
update artran SET custid ='05642545' where batnbr = '023972' and refnbr = 'B080011435'
update gltran SET id ='05642545' where batnbr = '023972' and  module ='AR' and refnbr ='B080011435'
update cf_regvtas set referenciafn ='F229000502' where exportadofn ='023972' and referenciafn ='F220000502'

update refnbr  set refnbr = '' 

'006456' AND REFNBR ='F080003045'


018030     F220000502

update ardoc SET refnbr ='F229000502' where batnbr = '021498' and refnbr ='F220000502'
update artran SET refnbr ='F229000502' where batnbr = '021498' and refnbr ='F220000502'
update cf_regvtas set referenciafn ='F229000502' where exportadofn ='021498' and referenciafn ='F220000502'




UPDATE ARADJUST SET ADJDREFNBR ='B130001943',ADJGREFNBR ='B130001943' WHERE ADJBATNBR ='031976' AND ADJDREFNBR='B130001940'


