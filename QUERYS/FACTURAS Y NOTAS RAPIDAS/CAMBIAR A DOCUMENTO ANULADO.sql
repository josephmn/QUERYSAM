


/*



declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='002109' -- LOTE 
set @refnbr ='F770000182' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,rlsed,taxid00,applbatnbr,custid,* from ardoc where batnbr= @batnbr and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,custid,* from artran
where batnbr= @batnbr and refnbr like @refnbr
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,id,* from gltran 
where batnbr = @batnbr and module = 'AR' and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr and adjdrefnbr =@refnbr
go


F760000608
F760000614
F770000182

select batnbr,doctype from ardoc where refnbr ='F770000182'




UPDATE ARDOC SET custid = '00000000000'
 WHERE BATNBR = '006448' AND  refnbr in ('F040002634') ,'F030002060')
----
update artran set custid ='00000000000'
 where batnbr = '006448' and refnbr in ('F040002634') ,'F030002060')
----
update gltran set id ='00000000000'
--update gltran set curycramt =170,cramt = 170, dramt = 0 , curydramt = 0 
where batnbr  = '005957' and module ='AR' and refnbr ='B040004535' 




















SELECT * FROM ARDOC WHERE REFNBR ='F250001033' AND DOCTYPE ='PA'
select * from aradjust where adjdrefnbr ='F250001033'

UPDATE ARDOC SET custid ='00000000000'
 WHERE BATNBR ='028223' AND  refnbr ='F250001033'
----
update artran set custid ='00000000000'
 where batnbr ='028223' and refnbr ='F250001033'



select * from ardoc  where refnbr ='161F077309' and doctype ='PA'
select * from aradjust where adjdrefnbr ='161F077309'


use [amcaf2015APP]
go


select *  from artran where refnbr in('F760000018','f770000005') --and module ='AR'

update artran set trandesc  ='IGV1' where batnbr ='000290' and acct ='401110' and module ='AR'



update ardoc set docbal =5215.25,opendoc ='1',user4 =0,curytaxtot00 =0,
curytxbltot00 =0,linecntr =0,pc_status=0,s4future09 =0,taxcntr00 =0  where batnbr ='000290' and refnbr ='F760000018'

update artran set curytaxamt00 =0,curytxblamt00 =0,taxamt00 =0  where batnbr ='000290' and refnbr ='F760000018' --and acct =''

update artran set txblamt00 =0 where batnbr ='000290' and refnbr ='F760000018'  and acct ='169801'



update artran set TAXID00 ='IGV1' WHERE BATNBR ='000290' AND ACCT ='401110'


121301     7.00
401110                 1.07
701110                  5.93
---------- REFORMATO CUENTAS 
--update batch set crtot=7,ctrltot=7,curycrtot=7,curyctrltot=7,
--curydrtot=7,drtot=7 from batch where batnbr ='034576' and module ='AR'
--
--UPDATE ARDOC SET DOCBAL =7,ORIGDOCAMT =7,CURYORIGDOCAMT =7,CURYDOCBAL=7 , TAXTOT00 =1.07,TXBLTOT00 =5.93
-- WHERE BATNBR ='034576' AND  refnbr ='B270000031'
------
--update artran set curytranamt =7,tranamt=7 where batnbr ='034576' and refnbr ='B270000031' and acct ='121301'
--update artran set curytranamt =1.07,tranamt=1.07 where batnbr ='034576' and refnbr ='B270000031' and acct ='401110'
--update artran set curytranamt =5.93,tranamt=5.93 where batnbr ='034576' and refnbr ='B270000031' and acct ='701110'
------
--update gltran set curycramt =170,cramt = 170, dramt = 0 , curydramt = 0 
--where batnbr  ='034576' and module ='AR' and refnbr ='B270000031' and acct ='701110'
--
--update gltran set curycramt =170,cramt = 170, dramt = 0 , curydramt = 0 
--where batnbr  ='034576' and module ='AR' and refnbr ='B270000031' and acct ='701110'
--
--update gltran set curycramt =0,cramt = 0, dramt = 7 , curydramt = 7 
--where batnbr  ='034576' and module ='AR' and refnbr ='B270000031' and acct ='121301'







update ardoc SET refnbr ='F270001003' where batnbr = '033010' and refnbr ='F010000003'
update artran SET refnbr ='F270001003' where batnbr = '033010' and refnbr ='F010000003'
update gltran SET refnbr ='F270001003' where batnbr = '033010' and  module ='AR' and refnbr ='F010000003'


update batch SET perpost ='201512' where batnbr = '034596' and  module ='AR' --and refnbr ='F010000003'
update ardoc SET perpost ='201512' where batnbr = '034596' -- and refnbr ='F010000003'
update artran SET perpost ='201512' where batnbr = '034596' -- and refnbr ='F010000003'
update gltran SET perpost ='201512' where batnbr = '034596' and  module ='AR'-- and refnbr ='F010000003'
UPDATE ARADJUST SET  ADJGPERPOST ='201512' ,PERAPPL ='201512' WHERE ADJBATNBR ='034596'
--and adjdrefnbr  ='F670000375'

select* from ardoc where refnbr ='F010000003'


--update ardoc set user4 =0 where batnbr ='034576' and refnbr ='B030006556'



update artran set curytranamt =170,tranamt=170 where batnbr ='034576' and refnbr ='391B-0006' and acct ='701110'
----
update gltran set curycramt =0,cramt = 0, dramt = 0 , curydramt = 0 ,id ='00000000000'
--update gltran set curycramt =170,cramt = 170, dramt = 0 , curydramt = 0 
where batnbr  ='000175' and module ='AR' and refnbr ='F760000003' -- and acct ='701110'

-- IGV = 25.93
--update  ardoc set  curytaxtot00 =0 where batnbr ='031770' and refnbr ='391B-0006'
--update  artran set curytranamt =0 ,TRANAMT = 0 where batnbr ='031770' and refnbr ='391B-0006' and acct ='401110'
--update gltran set cramt =0,curycramt =0 where batnbr ='031770' and refnbr ='391B-0006' and acct ='401110' and module ='AR'







declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='009584' -- LOTE 
set @refnbr ='F040002699' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,* from ardoc c where batnbr= @batnbr  and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr  and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR'and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr and adjdrefnbr =@refnbr
go





select batnbr,refnbr,origdocamt,curyorigdocamt 

from ardoc where perpost ='201603' and  len(custid) = 11 and custid  <> '00000000000' and origdocamt  =0 and curyorigdocamt = 0
and refnbr not in (select refnbr from ardoc where doctype ='PA') --and refnbr = 'F040002656'
and refnbr not in (select refnbr from gltran where module ='AR')

SELECT  PERPOST,CUSTID,* FROM ARDOC WHERE REFNBR  = 'B290000433'

007417AR	B290000433
007836AR	B289000247
007836AR	B289000252
007836AR	B289000253
008977AR	B289000272
009103AR	051B222948
009103AR	051B222950
009584AR	F040002656
009584AR	F040002668
009584AR	F040002676
009584AR	F040002677
009584AR	F040002681
009584AR	F040002685
009584AR	F040002686
009584AR	F040002687
009584AR	F040002694
009584AR	F040002699




 
---------- REFORMATO CUENTAS 

select ARDOC.CUSTID, ARDOC.batnbr,ARDOC.refnbr,ARDOC.origdocamt,ARDOC.curyorigdocamt 
--UPDATE ARDOC SET Custid ='00000000000' 
from ardoc ardoc
where ARDOC.perpost  IN ('201602','201603') and  len(ARDOC.custid) = 10  --AND ARDOC.CUSTID <>'00000000000'
and origdocamt  =0 and curyorigdocamt = 0
and ARDOC.refnbr not in (select refnbr from ardoc where doctype ='PA') --and refnbr = 'F040002656'
and ARDOC.refnbr not in (select refnbr from gltran where module ='AR')


SELECT  
--UPDATE ARTRAN SET CUSTID ='00000000000'
FROM ARTRAN WHERE LEN(CUSTID )  =10
AND  REFNBR IN (
SELECT REFNBR FROM ARDOC WHERE perpost IN ('201602','201603') 
and  len(ARDOC.custid) = 11 
AND ARDOC.CUSTID ='00000000000'
and refnbr not in (select refnbr from ardoc where doctype ='PA' AND PERPOST IN ('201602','201603'))--and refnbr = 'F040002656'
and refnbr not in (select refnbr from gltran where module ='AR' AND PERPOST IN ('201602','201603') )
 )

---------------- CAMBIAR  ARDOC----------
select batnbr,refnbr,CURYTRANAMT,TRANAMT 
--UPDATE ARDOC SET custid ='00000000000'
from ARTRAN where perpost ='201603'
 and  len(custid) = 11 -- OR LEN(CUSTID) =8
 and custid  <> '00000000000'
 and CURYTRANAMT  =0 and TRANAMT = 0
and refnbr not in (select refnbr from ardoc where doctype ='PA') 
and refnbr not in (select refnbr from gltran where module ='AR')


--------------- CAMBIAR ARTRAN ----------
select batnbr,refnbr,CURYTRANAMT,TRANAMT 
--UPDATE ARTRAN SET CUSTID =''
FROM ARTRAN AT
INNER JOIN ARDOC AD ON AT.BATNBR =AD.BATNBR AND AT.REFNBR =AD.REFNBR
WHERE AD.CUSTID ='00000000000'





 WHERE BATNBR ='034576' AND  refnbr ='F760000003'
----
update artran set curytranamt =0,tranamt=0,custid ='00000000000' where batnbr ='034576' and refnbr ='F760000003'

update artran set curytranamt =170,tranamt=170 where batnbr ='034576' and refnbr ='391B-0006' and acct ='701110'
----
update gltran set curycramt =0,cramt = 0, dramt = 0 , curydramt = 0 ,id ='00000000000'
--update gltran set curycramt =170,cramt = 170, dramt = 0 , curydramt = 0 
where batnbr  ='034576' and module ='AR' and refnbr ='F760000003' --and acct ='701110'

/*
-------------------****************************************************---------------------------------
select d.CUSTID,c.name,*  from ardoc d
inner join customer c on d.custid =c.custid

where d.refnbr ='F760000082'


select * from customer where custid ='20505378629'


update customer set name ='UN. CATOLICA SEDES SAPIENTIAE' where custid ='20505378629'
select * from customer















*/
