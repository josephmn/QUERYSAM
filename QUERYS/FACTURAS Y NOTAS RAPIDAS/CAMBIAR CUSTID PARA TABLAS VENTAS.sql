
000477ARC	F760000256
000477ARC	F76	0000257
000477ARC	F76	0000258
000822    
000831    

declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='000822' -- LOTE 
set @refnbr ='431F001069' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,* from ardoc c where batnbr= @batnbr  and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr  and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR' and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr and adjdrefnbr =@refnbr
go

SELECT EXPORTADOFN,REFERENCIAFN FROM CF_REGVTAS WHERE NUMDOC ='20160511-01-0003875'

select * from soaddress where custid =''


select * from custslsper

select name,CUSTID,*  from customer  where name like 'MINISTERIO DE EN%'
SELECT CUSTID,NAME,* FROM CUSTOMER WHERE  CUSTID =  '20131368829'    
SELECT CUSTID,NAME,* FROM CUSTOMER WHERE  CUSTID like '%20348858182%'
select * from soaddress where custid  like '%2060072751%'     
select * from custslsper where custid like '%2060072751%'

 SELECT  DOCTYPE,* FROM ARDOC WHERE REFNBR ='441F003875'

000825    	441F003875
000834      441F003875

/*
update ardoc set custid  ='20131368829' where batnbr ='000834' and refnbr  ='441F003875' and  CUSTID like '20131368825'
update artran set custid  ='20131368829' where batnbr ='000834' and refnbr  ='441F003875'and  CUSTID like  '20131368825'
update gltran set id  ='20131368829' where batnbr ='000834' and refnbr  ='441F003875' and  module ='AR' AND ID like  '20131368825'
update aradjust set custid  ='20131368829' where adjbatnbr ='000834' and adjdrefnbr ='441F003875' and CUSTID like '20131368825'


SELECT * FROM ARDOC WHERE REFNBR ='F760000258'






--UPDATE customer set custid  ='20491081849' where CUSTID like '%2049108184%'
--UPDATE soaddress set custid  ='20491081849' where CUSTID like '%2049108184%'
--UPDATE custslsper set custid  ='20491081849' where CUSTID like '%2049108184%'
*/

