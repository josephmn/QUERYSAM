
select * from apdoc where refnbr = '000115' AND DOCTYPE = 'HC'

--documentos y ajustes 
/*

000420APC
000420APC



UPDATE APDOC SET DOCDATE  ='2017-02-04',InvcDate  ='2017-02-04', curyeffdate ='2017-02-04' , discdate  ='2017-02-04',duedate ='2017-02-04',paydate ='2017-02-04'
 WHERE BATNBR  ='000420'
UPDATE APTRAN SET TRANDATE  ='2017-02-04' WHERE BATNBR ='000420'
UPDATE GLTRAN SET TRANDATE  ='2017-02-04' WHERE BATNBR  ='000420' AND MODULE ='AP'
update apadjust set adjgdocdate ='2017-02-04',dateappl ='2017-02-04' where adjbatnbr  = '000420'

*/
SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='000420'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,* FROM APDOC  where batnbr ='000420'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,sub,tranamt,* FROM APTRAN  where batnbr ='000420'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='000420'  
SELECT * from apadjust where adjbatnbr ='000420'
select * from xapdettran where batnbr ='000420'

--update apdoc set DOCDATE  ='2017-02-04',InvcDate  ='2017-02-04', curyeffdate ='2017-02-04' , discdate  ='2017-02-04',duedate ='2017-02-04',paydate ='2017-02-04'
-- WHERE BATNBR  ='000420'
--UPDATE APTRAN SET TRANDATE  ='2017-02-04' WHERE BATNBR ='000420'
--UPDATE GLTRAN SET TRANDATE  ='2017-02-04' WHERE BATNBR  ='000420' AND MODULE ='AP'
--update apadjust set adjgdocdate ='2017-02-04',dateappl ='2017-02-04' where adjbatnbr  = '000420'
--/*








ANTICIPO 001101

CHEQUE PARA ANTICIPO  000799

70115.83
10695.64
59420.19

001626

SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='001845'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,* FROM APDOC  where batnbr ='001845'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,sub,tranamt,* FROM APTRAN  where batnbr ='001845'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='001845'  
SELECT * from apadjust where adjbatnbr ='001845'
select * from xapdettran where batnbr ='001845'




update batch set status ='B' where batnbr  ='001845' and module ='ap'


delete from aptran where batnbr  ='001845' and cpnyid ='' and curyid  =''




update aptran set perpost  ='201705' where batnbr  = '001626'


select*  from apdoc where refnbr  ='001626'


SELECT perpost,rlsed,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,* FROM APDOC  where refnbr like '%000783%'
SELECT perpost,rlsed,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,* FROM APDOC  where refnbr like '%001063%'

select * from apadjust where adjdrefnbr   in ('000783','001063') order by adjbatnbr 

select * from apadjust where adjdrefnbr   in ('000783','001063') order by adjbatnbr 


select  * from appagos  order by numero desc 


select user5 from apsetup 

update apsetup set user5  = '077671'

   lote 001015, el banco debe de ser el 104103.
   000741    
   
   
   003072
   
   
   cuenta 104120 a la cuenta 104104
   
   
   
   104104
   
UPDATE gltran SET ACCT  ='104120' WHERE BATNBR = '001174' AND MODULE = 'AP'  AND ACCT ='104104' --and sub  ='CAIQEMB000'
UPDATE aptran SET ACCT  ='104120' WHERE BATNBR = '001174' AND ACCT ='104104' --and sub  ='CACHCAF000' and sub  ='CAIQEMB000'
UPDATE apdoc SET ACCT  ='104120' WHERE BATNBR = '001174'  AND ACCT ='104104'--and sub ='CACHCAF000'
update apadjust set adjgacct  ='104120' where adjbatnbr  ='001174' and adjgacct ='104104'
  








/*
update apdoc set curydiscbal  = 0 where batnbr  ='001331' 

select * from apdoc where doctype  <> 'HC' AND VENDID  ='20102027010'


--SELECT name,vendid,* FROM VENDOR WHERE NAME LIKE '%ausa%'

003025
000000000000     
       
update apdoc set sub  ='0000000RE000' where batnbr  ='001375' and sub  ='000000000000'
update aptran set sub  ='0000000RE000' where batnbr  ='001375' and sub  ='000000000000'
update gltran set sub  ='0000000RE000' where batnbr  ='001375' and module  ='AP' and sub  ='000000000000'
UPDATE APADJUST SET ADJGSUB ='0000000RE000' WHERE  ADJBATNBR  ='001375' and ADJGSUB  ='000000000000'


select * from apdoc where sub ='000000000000'



UPDATE batch SET RLSED  =0 , STATUS  ='B' WHERE BATNBR  = '002094' AND MODULE  ='AP'

UPDATE APDOC  SET RLSED  =0  WHERE BATNBR  = '002094' 
update 


APDEBUG '002094'


DELETE FROM WRKRELEASE 

SELECT *  FROM APDOC WHERE STATUS  ='A' ORDER BY BATNBR DESC

SELECT * FROM 

UPDATE APDOC SET curydocbal  = 5021.1 , DOCBAL  = 5021.1 WHERE BATNBR   = '002753'

apdebug '002753'

Crtd_Prog
        
        CuryDepositAmt
0CuryDrTot
0
        update BATCH set status  ='B',  CuryDepositAmt  = 5021.1, CuryDrTot =5021.1 , depositamt  = 5021.1 where BATNBR  ='002753' AND MODULE  ='ap'
        
        
        UPDATE BATCH SET STATUS  ='B' WHERE BATNBR  ='002753' AND MODULE  ='AP'
        
        
        SELECT  TRANAMT, CURYTRANAMT  FROM APTRAN WHERE BATNBR  ='002753'

UPDATE APTRAN SET Crtd_Prog  ='03030' WHERE BATNBR  ='002753'

update gltran set sub  ='000000000000' where batnbr  ='002741' and module  ='AP'



update apdoc set sub  ='000000000000' where batnbr  ='002741'

update aptran set sub  ='000000000000' where batnbr  ='002741'

delete from wrkrelease 
select * from gltran where trandesc like '%002681%'

 select * from cab_movi order by nu_correla desc  


apdebug '002681'


update batch 
select * from  WrkRelease 


delete from WrkReleasebad 


SELECT perpost,rlsed,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,* FROM APDOC  where batnbr ='002681'  --and refnbr like '%593%'

SELECT perpost,rlsed,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,* FROM APDOC  where batnbr ='002094'  --and refnbr like '%593%'







select * from gltran where module  ='AP' and refnbr  = '002440'


select * from ardoc where refnbr  ='002440'

0040018021     
0010006113     

select * from xapdettran where NroDoc  = '0010006113'




update batch set status  = 'B' where batnbr  = '002681' and module  ='AP'
 

delete from batch where batnbr  ='002551' and module  ='AP'


001681





select * from cf_regvtas where NumDocAnulacion <>''

SELECT perpost,rlsed,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,* FROM APDOC  where batnbr ='002118'
SELECT perpost,rlsed,DOCDATE,refnbr,sub,USER1,S4Future12,INVCNBR,curydocbal,VENDID,* FROM APDOC  where batnbr ='002108'
CuryTxblAmt00
49634.57
TxblAmt00
49634.57
SELECT perpost,rlsed,refnbr,sub,tranamt,* FROM APTRAN  where batnbr ='002118'
SELECT perpost,rlsed,refnbr,sub,tranamt,* FROM APTRAN  where batnbr ='002108'

update aptran set TxblAmt00  = 9785.62 where batnbr  ='002118' and  acct  ='604101'  and  tranamt  = 9785.62
update aptran set CuryTxblAmt00  = 9785.62 where batnbr  ='002118' and  acct  ='604101'  and  tranamt  = 9785.62

CuryTaxAmt00
8934.22
update aptran set CuryTaxAmt00   = 1761.42 , taxamt00  = 1761.42  where batnbr  ='002118' and tranamt  = 9785.62




DELETE FROM APPAGOS 
DELETE FROM APCANCELAPAGO


update batch set status  ='B' WHERE BATNBR  ='007127' AND MODULE  = 'AP'




SELECT * FROM APTRAN WHERE ACCT  ='952104'

SELECT * FROM APDOC WHERE DOCTYPE  ='AD'

select batnbr,refnbr,invcnbr,user1,s4future12,* from apdoc a where s4future11  ='4' order by a.batnbr desc 

select * from apdoc where s4future11  ='4' order by batnbr desc 

select distinct s4future12 from apdoc where s4future11  ='4' order by batnbr desc 

SELECT * FROM APADJUST WHERE ADJDREFNBR  = '016750'





952104


028174    
SELECT perpost,rlsed,DOCDATE,refnbr,sub,S4Future12,curydocbal,VENDID,* FROM APDOC  where REFNBR  ='016762'


SELECT perpost,rlsed,DOCDATE,refnbr,sub,S4Future12,curydocbal,* FROM APDOC  where batnbr ='028155'  

update APDOC set docbal  = 32 , curydocbal  = 32 where batnbr  ='028155'
update APDOC set ApplyRefNbr ='' , curydocbal  = 32 where batnbr  ='028155'

update APDOC set ApplyAmt =  0 where batnbr  ='028155'



select  * from APSetup 








ApplyAmt
32
ApplyRefNbr
028155    


  
update batch set status = 'B' where batnbr  ='028156' and module ='AP'








select * from apdoc where refnbr  ='011132'


SELECT * from apadjust where adjbatnbr = '018351'

select * from apadjust where adjdrefnbr  ='011132'

028156    

update batch set CuryDepositAmt = 32 , CuryDrTot = 32 where batnbr  ='028156' and module ='AP'

026001    
CuryDepositAmt
0
u
CuryDrTot
0pdate aptran set perpost  ='201611' where batnbr  ='026001'

update batch set  status  ='B' WHERE BATNBR  ='026001' AND MODULE  ='ap'
             
SELECT perpost,rlsed,refnbr,sub,tranamt,* FROM APTRAN  where batnbr ='026121' and acct  ='956005' 
UPDATE APTRAN SET SUB ='CAJPCAF000' WHERE BATNBR  ='026121' AND ACCT ='956005'
SELECT perpost,* FROM gltran  where batnbr ='026121' and acct  ='956005'  and module  ='AP'

UPDATE GLTRAN SET SUB ='CAJPCAF000' WHERE BATNBR  ='009522' AND ACCT ='656005' AND MODULE  ='GL'

SELECT * FROM GLTRAN WHERE BATNBR  ='009522' AND MODULE  ='GL'

update batch set status  ='B' where batnbr  ='027730' and module  ='AP'





SELECT perpost,rlsed,refnbr,sub,tranamt,* FROM APTRAN  where batnbr ='027186' and acct  ='943902'
SELECT * FROM APTRAN WHERE BATNBR  ='025935' AND TRANDESC LIKE '%RESIS%'

UPDATE APTRAN SET ACCT  ='954103' WHERE BATNBR  ='027530' AND TRANDESC LIKE '%RESIS%'

UPDATE GLTRAN SET ACCT  ='954103' WHERE BATNBR  ='027530' AND TRANDESC LIKE '%RESIS%' AND MODULE  ='ap'


UPDATE APTRAN SET ACCT  ='943103' WHERE BATNBR  ='027530' AND acct ='953103'
UPDATE GLTRAN SET ACCT  ='943103' WHERE BATNBR  ='027530' AND acct ='953103' AND MODULE  ='ap'

953103    
632107
632108

select * from gltran where module  ='GL' AND TRANDESC LIKE '%027186%' and dramt = 2.8


UPDATE  GLTRAN SET ACCT  ='632108' WHERE BATNBR  ='009931' AND ACCT  ='632107' AND MODULE  ='gl' and dramt =2.8
update APDOC set S4Future12  ='0000'where batnbr ='006395'  

S4Future12
NTM0      

SELECT perpost,rlsed,DOCDATE,refnbr,sub,S4Future12,* FROM APDOC  where batnbr ='006309' 


update aptran set tranamt  =181.13 , curytranamt  =181.13 where batnbr  ='006525' and  acct  ='976101'
181.13
0000000000              
CAIQEMB000              
CACHCAF000

UPDATE gltran SET ACCT  =' 953902' WHERE BATNBR = '017739' AND MODULE = 'AP'  AND ACCT ='941201' and sub  ='CAIQEMB000'
UPDATE aptran SET ACCT  ='953902' WHERE BATNBR = '017739' AND ACCT ='943902' and sub  ='CACHCAF000' and sub  ='CAIQEMB000'

UPDATE apdoc SET ACCT  ='424101' WHERE BATNBR = '021978'  AND ACCT ='431201'  and sub ='CACHCAF000'

UPDATE BATCH SET CRTOT  = 6608.17 ,  CTRLTOT  =  6608.17 WHERE BATNBR  ='017843' AND MODULE  ='AP'
UPDATE APDOC SET ORIGDOCAMT =6608.17 WHERE BATNBR  ='017843'
update aptran set tranamt  = 6608.17 where batnbr ='017843' and acct ='999998'
update gltran set dramt  = 6608.17 where batnbr  ='017843' and module  ='ap' and acct  ='999998' 

336910
026400


SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='026400'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,S4Future12,* FROM APDOC  where batnbr ='026400'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,sub,* FROM APTRAN  where batnbr ='026400'
SELECT * from apadjust where adjbatnbr ='026400'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='026400'  
SELECT * from apadjust where adjbatnbr ='026400'
select * from xapdettran where batnbr ='026400'




--UPDATE APDOC SET DOCDATE  ='2015-09-30' WHERE BATNBR ='000'


UPDATE gltran SET ACCT  ='336910' WHERE BATNBR = '026400'  AND MODULE = 'AP'  AND ACCT ='336110'  --and sub  ='CAJUCHO000'
UPDATE aptran SET ACCT  ='336910' WHERE BATNBR = '026400'  AND ACCT ='336110' --   and sub  ='CAJUCHO000'

UPDATE aptran SET ACCT  ='956007' WHERE BATNBR = '019356'  AND ACCT ='943102'  and tranamt =4900
 956007
        CAPUCAF000  
        CATCCAF000
UPDATE APTRAN SET SUB = 'CAJUCHO000' WHERE BATNBR  ='027630' AND  sub = '0000000000'  and  acct in ('339901')

UPDATE GLTRAN SET SUB  = 'CAJUCHO000' WHERE BATNBR ='027630' AND MODULE = 'AP' AND  sub = '0000000000'  and  acct in ('339901')

339901    

SELECT perpost,rlsed,refnbr,sub,tranamt,curytranamt,* FROM APTRAN  where batnbr ='017843'


SELECT perpost,rlsed,DOCDATE,refnbr,sub,S4Future12,* FROM APDOC  where refnbr like '%017843%'

007269APA
007269APA
007270APA
007270APA



SELECT * FROM APPAGOS order by numero desc 

select User5,* from APSetup 


SELECT * FROM APPAGOS WHERE numero  ='077893'


DELETE FROM APPAGOS WHERE numero  ='077893'



SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='001577'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,S4Future12,* FROM APDOC  where batnbr ='001577'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,sub,* FROM APTRAN  where batnbr ='001577'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='001577'  
SELECT * from apadjust where adjbatnbr ='001577'
select * from xapdettran where batnbr ='001577'


SELECT perpost,rlsed,DOCDATE,refnbr,sub,S4Future12,* FROM APDOC where  refnbr like '%896'


UPDATE APDOC SET DOCDATE  ='2017-01-30',InvcDate  ='2017-04-30' WHERE BATNBR  ='001446'
UPDATE APTRAN SET TRANDATE  ='2017-04-30' WHERE BATNBR ='001446'
UPDATE GLTRAN SET TRANDATE  ='2017-04-30' WHERE BATNBR  ='001446' AND MODULE ='AP'
update apadjust set adjgdocdate ='2017-04-30',dateappl ='2017-04-30' where adjbatnbr  = '001446'



/*
000395GLA
000395GLA
000577GLA
000577GLA
000577GLA



UPDATE GLTRAN SET TRANDATE  = '2017-01-30' WHERE BATNBR  ='000100' AND MODULE ='GL'

--010191

104101 DICE

 104103 DEBE
010988

104113

104110
*/
    Dice                        : 104104
    Debe decir :104103

007269APA
007269APA
007270APA
007270APA




UPDATE APDOC SET acct ='104104' WHERE BATNBR  ='021457' and acct ='104103'
UPDATE APTRAN SET acct ='104104' WHERE BATNBR ='021457'and acct ='104103' 
UPDATE GLTRAN SET acct ='104104' WHERE BATNBR  ='021457' AND MODULE ='AP'and acct ='104103' 
update apadjust set AdjgAcct ='104104' where adjbatnbr  ='010191' and AdjgAcct ='104103'


010988    

AdjgAcct
104113    





delete from batch where batnbr ='007724' and module ='AP'
select * from xapdettran WHERE NRODOC  = '0920007192'

/*
update apdoc set invcnbr  ='0000056429' where batnbr  ='002234'
update aptran set extrefnbr ='0000056429'where batnbr  ='002234'
update gltran set extrefnbr ='0000056429'where batnbr  ='002234' and module ='AP'

select * from aptran where acct ='401110'  

select batnbr , sum(curytranamt) from aptran where batnbr ='001370' and acct  <>'421213' and acct <>'401110' and acct <>'603101'
group by batnbr

update aptran set user6 ='AFEC1' WHERE BATNBR ='001370' AND TRANDESC  ='EMPANADA DE CARNE'

select sum(curytaxamt00) from aptran where batnbr ='001370'  

--- VERIFICAR PARA REPORTE DEL PLE COMPRAS 
--update aptran set curytaxamt00 =3.2,taxamt00 =3.2 ,user6 ='AFEC1' where batnbr ='000794' and linenbr=-32512
--update apdoc set curytaxtot00=15.27,taxtot00=15.27 where batnbr ='022170'
--update apdoc set linecntr=55.28  where batnbr ='000794'


select batnbr , sum(tranamt) from aptran where batnbr ='001370' and acct <> '421213'
group by batnbr



SELECT* FROM BATCH WHERE MODULE ='AP'
---------------------------------------------------------------------------
--update BATCH  set taxtot00 =15.27 ,CURYTAXTOT00 = 15.27 where batnbr ='022170' and module ='AP' 
--update aptran set tranamt =15.27 , curytranamt =15.27 where batnbr ='022170' and acct ='401110'
--update aptran set curytaxamt00 =0,curytxblamt00 =0,taxamt00 =0,taxcat ='INAFECTO',taxid00=',TaxIdDflt=',txblamt00=0
--where batnbr ='022170' and trandesc ='CEBOLLA,PAPA'            
--
--update gltran set dramt =15.27,curydramt =15.27 where batnbr ='022170' and module ='AP' and acct ='401110'


select TaxIdDflt from aptran
 602101
---------------------------------------------------------------------------

--

SELECT* FROM APDOC WHERE BATNBR   =  '028156'

--
delete from batch where batnbr = '028162' and module ='ap'
delete from apdoc where batnbr = '028162'
delete from aptran where batnbr = '028162' 
delete from gltran where batnbr = '028162' and module ='ap'
delete from apadjust where adjbatnbr = '028162'
delete from xapdettran where batnbr ='028162'
--


026001
026002




POReceipt_BBatchQtyTot '000020' 
sp_helptext POReceipt_BBatchQtyTot


exec ardebug '015273'



14715 
15739
----------------------------- PROCESO PARA CAMBIAR MONTOS ------------------------------
declare @batnbr char(6)
declare @refnbr char(10)
declare @rlsed smallint
declare @cero float
declare @valor float
set @batnbr='014715'
set @rlsed = 1
set @cero =0
set @valor  =160
select perpost,* from batch where batnbr =@batnbr AND MODULE  ='AP'
SELECT perpost,* FROM APDOC where batnbr =@batnbr
SELECT perpost,* FROM APTRAN where batnbr =@batnbr
SELECT perpost,* FROM GLTRAN WHERE BATNBR =@batnbr AND MODULE ='AP'
--update gltran set cramt =@valor,curycramt =@valor,dramt =@cero,curydramt=@cero  where batnbr=@batnbr and module ='AP' and acct ='401720'

use[ca2015app]
go







select * from xamrestriccion where userid ='ajtampen' and tipo in (',')

insert into xamrestriccion (userid,tipo,dato) 
values ('ajtampen','CUENTABANCOD ','101000')



021676    
021978    


--update apdoc set  ACCT='421214' where batnbr='015725'  AND ACCT ='421213'
--update aptran set  ACCT='421214' where batnbr='015725'  AND ACCT ='421213'



SELECT * FROM GLTRAN WHERE BATNBR='003791' AND MODULE ='GL' --AND ACCT ='403201'



--update batch set perpost ='201509'  where batnbr ='011321' AND MODULE  ='AP'
--update apdoc set perpost ='201509' where batnbr ='011321'
--update aptran set perpost ='201509' where batnbr ='011321'
--update gltran set perpost ='201509' where batnbr ='011321' AND MODULE ='AP'




--update batch set perpost ='201509' WHERE BATNBR='003791' AND MODULE ='GL'
--update gltran set perpost ='201509' WHERE BATNBR='003791' AND MODULE ='GL'

--update gltran set  ACCT='407101' where batnbr='003693' and module ='GL' AND ACCT ='403201'
--update gltran set  ACCT='407101' where batnbr='003681' and module ='GL' AND ACCT ='403201'
--update gltran set  ACCT='407101' where batnbr='003691' and module ='GL' AND ACCT ='403201'



--update batch set crtot=147211.07,ctrltot=147211.07,curycrtot=147211.07,curyctrltot=147211.07,
--curydrtot=147211.07,drtot=147211.07 from batch where batnbr ='012506' and module ='AP'
--
--UPDATE APTRAN SET curytranamt =147211.07,tranamt =147211.07where batnbr ='012506' and acct ='421213'
----UPDATE APTRAN SET curytranamt =3501.75,tranamt = 3501.75 where batnbr ='009186' and acct ='411501'
--update gltran set curydramt =141328.70,dramt =141328.70 where batnbr ='012506' and module ='AP' and acct ='411101'
----total = al batch	
--update gltran set curycramt =147211.07,cramt =147211.07 where batnbr ='012506' and module ='AP' and acct ='421213'


select batnbr,ponbr,rcptnbr,* from poreceipt where 1=1
--and ponbr ='000278'
and rcptnbr  in ('000364')

select batnbr,ponbr,rcptnbr,* from poreceipt where 1=1
--and ponbr ='0003'
and ponbr  in ('000361')


select * from apdoc where batnbr ='001283'    
update apdoc set docbal =45.10 , curydocbal  =45.10 where batnbr ='001340'
select * from aptran where rcptnbr  in ('000365'),'000346')
select * from apdoc where ponbr in ('000361','000346')


select *  from poreceipt where rcptnbr ='000407'
                          
UPDATE APTRAN SET invtid  ='I250182',ponbr ='000474' WHERE RCPTNBR ='000462' and trandesc ='BONLE QUESO FRESCO GRANDE X KG'

UPDATE APTRAN SET RCPTNBR  ='000354' WHERE RCPTNBR ='354' and trandesc ='JAMON DEL PAIS'
UPDATE APTRAN SET ponbr ='000381' WHERE RCPTNBR ='000365' and trandesc ='BONLE QUESO FRESCO GRANDE X KG'

update aptran set siteid ='CFCUSCO2'  WHERE RCPTNBR ='000365' 


select purchord.ponbr,purchord.user6,purchord.potype,purchord.status,purchord.podate
from purchord (FASTFIRSTROW)  where vendid =  '20100070970'  and ponbr like  '%'
and potype in ('or', 'dp', 'st') and status in ('m', 'o', 'p') 
order by vendid, ponbr desc



purchord_vendid_ponbr  '20100070970',  '000361' 

SP_HELPTEXT  purchord_vendid_ponbr

SELECT * FROM PURCHORD WHERE PONBR ='000408'

select * from poreceipt where ponbr ='000408'


006309    

update poreceipt set aprefno =' where ponbr ='000408'


APDoc_VendId_InvcNbr '20100512662', '0000039707', '

---se verificar si ya existe recepcion en aptran
PORcpt_On_VOtran2 '000346', '00002', 27.46, 1.21 

sp_helptext PORcpt_On_VOtran2
sp_helptext  SubXRef_Descr

SubXRef_Descr 'ALTOMAYO', 'CAC2000RE000' 


PORcpt_On_VOtran '000367', '000346', ', '00001'
PORcpt_On_VOtran2 '000346', '00001', 28.01, 1.23 

PORcpt_On_VOtran '000367', '000352', ', '00002'
PORcpt_On_VOtran2 '000352', '00002', 27.46, 1.21 




SELECT * FROM VOTRAN 





select batnbr, rcptnbr ,*from POtran   
where   
RcptNbr = '000352' and   
LineRef = '00002' and   
(convert(dec(28,3),27.46) <> convert(dec(28,3),POTran.CuryExtCost) - convert(dec(28,3),POTran.CuryCostVouched)  
OR  
convert(dec(28,3), 1.23  ) <> convert(dec(28,3),POTran.RcptQty) - convert(dec(28,3),POTran.QtyVouched))  
group by 



27.46, 1.21 

select batnbr, rcptnbr,
round(27.46 <> CuryExtCost - CuryCostVouched  ,2)
 from POtran   
where   
RcptNbr = '000346' and   
LineRef = '00001' and   
(convert(dec(28,3),27.46) <> convert(dec(28,3),POTran.CuryExtCost) - convert(dec(28,3),POTran.CuryCostVouched)  
OR  
convert(dec(28,3), 1.21  ) <> convert(dec(28,3),POTran.RcptQty) - convert(dec(28,3),POTran.QtyVouched))  
group by batnbr,rcptnbr


-----------------------------------------***

PORcpt_On_VOtran2 '000346', '00002', 27.46, 1.21 
select batnbr, rcptnbr,* from POtran   
where   
RcptNbr = @parm1 and   
LineRef = @parm2 and   
(convert(dec(28,3),@parm3) <> convert(dec(28,3),POTran.CuryExtCost) - convert(dec(28,3),POTran.CuryCostVouched)  
OR  
convert(dec(28,3),@parm4) <> convert(dec(28,3),POTran.RcptQty) - convert(dec(28,3),POTran.QtyVouched))  


PORcpt_On_VOtran2 '000346', '00002', 27.46, 1.21

select * from potran where rcptnbr = '000346'

--1.205  rcptqty original
update potran set rcptqty =1.206 where ponbr ='000361' and polineref ='00002'




PORcpt_On_VOtran '000361', '000346', ', '00001'
PORcpt_On_VOtran2 '000346', '00001', 28.01, 1.23 

PORcpt_On_VOtran '000361', '000346', ', '00002'
PORcpt_On_VOtran2 '000346', '00002', 27.46, 1.21 

-----------------------------------------------------***

PORcpt_On_VOtran2 '000352', '00001', 28.01, 1.23 
PORcpt_On_VOtran2 '000352', '00002', 27.47, 2.00

update 

select  * from aptran  where rcptnbr ='000378'

select  * from potran  where rcptnbr ='000378'

update potran set qty =8 ,rcptqty =8 where rcptnbr ='000353' and polinenbr =1 

update potran set curyextcost =120.00 ,extcost =120.00 where rcptnbr ='000353' and polinenbr =1 

SP_HELPTEXT  PORcpt_On_VOtran2

PORcpt_On_VOtran2 '000353', '00001', 120.00, 8 

select batnbr, rcptnbr from POtran   
where   
RcptNbr = @parm1 and   
LineRef = @parm2 and   
(convert(dec(28,3),@parm3) <> convert(dec(28,3),POTran.CuryExtCost) - convert(dec(28,3),POTran.CuryCostVouched)  
OR  
convert(dec(28,3),@parm4) <> convert(dec(28,3),POTran.RcptQty) - convert(dec(28,3),POTran.QtyVouched))  

*/


select * from batch where batnbr  ='003905' and module ='gl'

select trandate,*  from gltran where batnbr  ='003905' and module ='gl'
update gltran set trandate  ='2017-01-09' where batnbr  ='003905' and module ='gl'

select * from apdoc where RefNbr  ='000049'

select * from apdoc where BatNbr  ='000049'


sp_helptext  dbnav_apdoc_all

update apdoc set TaxId03 ='' where TaxId03 ='074882'

TaxId03
074882    
select S4Future11,* from apdoc 

select * from am2017app.dbo.appagos 



 sp_helptext VFACTURAPROG
  use [res2016APP]
 go
 
 use [AM2017APP]
 go


sp_helptext  vAPDetracFactura

CREATE view vAPDetracFactura  
as  
select v.vendid, v.name as Proveedor, vd.Cuenta, apd.perpost as Periodo, apd.Batnbr, apd.Refnbr, apd.docdate as FechaDoc, apd.invcnbr as NroDoc,   
 apd.CuryTxblTot00 * apd.CuryRate as SubTotal, apd.CuryTaxTot00 * apd.CuryRate as IGV, apd.CuryOrigDocAmt * apd.CuryRate as Total,   
 apd.curydocbal * apd.CuryRate as SaldoFact,   
 dt.DetracId, dt.descr as DescDetrac, dt.Porcentaje, do.detracoperid as OperId, do.descr as Operacion,  
 round(((apd.CuryOrigDocAmt * apd.CuryRate)*(dt.porcentaje/100)), 0) as MontoDetrac,  
 isnull((select MontoPagado from vAPDetracPagada WHERE BatNbr=apd.BatNbr and RefNbr=apd.RefNbr), 0) as DetracPagada,   
 isnull((select MontoPagado/apd.CuryRate from vAPDetracPagada WHERE BatNbr=apd.BatNbr and RefNbr=apd.RefNbr), 0) as DetracPagadaOrig,   
 case when apd.curyid='DOL' then     
  (  (apd.CuryOrigDocAmt * apd.CuryRate) * (dt.porcentaje/100)) - isnull((select MontoPagado from vAPDetracPagada WHERE BatNbr=apd.BatNbr and RefNbr=apd.RefNbr),0)  
 else    
  round(((apd.CuryOrigDocAmt * apd.CuryRate) * (dt.porcentaje/100)), 0) - isnull((select MontoPagado from vAPDetracPagada WHERE BatNbr=apd.BatNbr and RefNbr=apd.RefNbr), 0)    
 end as DetracxPagar,  
 --round(((apd.CuryOrigDocAmt * apd.CuryRate) * (dt.porcentaje/100)), 0) - isnull((select MontoPagado from vAPDetracPagada WHERE BatNbr=apd.BatNbr and RefNbr=apd.RefNbr), 0) as DetracxPagar,  
 apd.CuryRate as TipoCambio,   
 (select FechaPago from vAPDetracPagada WHERE BatNbr=apd.BatNbr and RefNbr=apd.RefNbr) as FechaPago   
from batch b WITH(NOLOCK)   
 inner join apdoc apd  WITH(NOLOCK) on b.batnbr=apd.batnbr  
 inner join vendor v  WITH(NOLOCK) on v.vendid=apd.vendid   
 inner join vendordetrac vd  WITH(NOLOCK) on v.vendid=vd.vendid  
 inner join apdetractipo dt  WITH(NOLOCK) on vd.detracid=dt.detracid  
 left join apdetracOper do  WITH(NOLOCK) on dt.detracoperid=do.detracoperid   
where b.module='AP' and b.status<>'V' and apd.user6='01' and vd.status='1' and (apd.CuryOrigDocAmt * apd.CuryRate) >dt.MontoMin   
---CJ: 07/01/2016 - INI   
/*and not exists(  
SELECT     *  
FROM         APPagos  WITH(NOLOCK)   
WHERE     (appagos.numero in ('004651', '004655','004679' )) and  appagos.batnbr = b.batnbr  
  
)  
*/  
---CJ: 07/01/2016 - FIN  
/*  
UNION  
---DEL AÑO PASADO  
select v.vendid, v.name as Proveedor, vd.Cuenta, apd.perpost as Periodo, apd.Batnbr, apd.Refnbr, apd.docdate as FechaDoc, apd.invcnbr as NroDoc,   
 (DX.CuryTxblTot00 * DX.CuryRate)  as SubTotal, DX.CuryTaxTot00* DX.CuryRate as IGV, DX.CuryOrigDocAmt* DX.CuryRate as Total,   
 apd.curydocbal* DX.CuryRate as SaldoFact,   
 dt.DetracId, dt.descr as DescDetrac, dt.Porcentaje, do.detracoperid as OperId, do.descr as Operacion,  
 round(((DX.CuryOrigDocAmt* DX.CuryRate)*(dt.porcentaje/100)), 0) as MontoDetrac,  
 isnull((select MontoPagado from vAPDetracPagada WHERE BatNbr=apd.BatNbr), 0) as DetracPagada,   
 isnull((select MontoPagado/apd.CuryRate from vAPDetracPagada WHERE BatNbr=apd.BatNbr), 0) as DetracPagadaOrig,   
 round(((apd.CuryOrigDocAmt* DX.CuryRate)*(dt.porcentaje/100)), 0) - isnull((select MontoPagado from vAPDetracPagada WHERE BatNbr=apd.BatNbr), 0) as DetracxPagar,  
 DX.CuryRate as TipoCambio,  
 (select FechaPago from vAPDetracPagada WHERE BatNbr=apd.BatNbr and RefNbr=apd.RefNbr) as FechaPago   
from batch b  
 inner join apdoc apd on b.batnbr=apd.batnbr  
 inner join vendor v on v.vendid=apd.vendid   
 inner join vendordetrac vd on v.vendid=vd.vendid  
 inner join apdetractipo dt on vd.detracid=dt.detracid  
 INNER JOIN APPTYM2011..APDOC DX ON B.USER1=DX.BATNBR  
 left join apdetracOper do on dt.detracoperid=do.detracoperid   
where b.module='AP' and b.status<>'V' and vd.status='1' and apd.user6='OD' and (DX.CuryOrigDocAmt* DX.CuryRate)>dt.MontoMin  
 AND DX.user6='01'  
*/  
  
UNION  
---DEL AÑO PASADO (MODIFICADO GERARDO)  
select v.vendid, v.name as Proveedor, vd.Cuenta, apd.perpost as Periodo, apd.Batnbr, apd.Refnbr, apd.docdate as FechaDoc, apd.invcnbr as NroDoc,   
 (DX.CuryTxblTot00 * apd.CuryRate)  as SubTotal, DX.CuryTaxTot00* apd.CuryRate as IGV, DX.CuryOrigDocAmt* apd.CuryRate as Total,   
 apd.curydocbal* apd.CuryRate as SaldoFact,   
 dt.DetracId, dt.descr as DescDetrac, dt.Porcentaje, do.detracoperid as OperId, do.descr as Operacion,  
 round(((DX.CuryOrigDocAmt* apd.CuryRate)*(dt.porcentaje/100)), 0) as MontoDetrac,  
 isnull((select MontoPagado from vAPDetracPagada WHERE BatNbr=apd.BatNbr), 0) as DetracPagada,   
 isnull((select MontoPagado/apd.CuryRate from vAPDetracPagada WHERE BatNbr=apd.BatNbr), 0) as DetracPagadaOrig,   
 --round(((apd.CuryOrigDocAmt* DX.CuryRate)*(dt.porcentaje/100)), 0) - isnull((select MontoPagado from vAPDetracPagada WHERE BatNbr=apd.BatNbr), 0) as DetracxPagar,  
 round(((DX.CuryOrigDocAmt* apd.CuryRate)*(dt.porcentaje/100)), 0) - isnull((select MontoPagado from vAPDetracPagada WHERE BatNbr=apd.BatNbr), 0) as DetracxPagar,  
 apd.CuryRate as TipoCambio,  
 (select FechaPago from vAPDetracPagada WHERE BatNbr=apd.BatNbr and RefNbr=apd.RefNbr) as FechaPago   
from batch b  WITH(NOLOCK)   
 inner join apdoc apd  WITH(NOLOCK) on b.batnbr=apd.batnbr  
 inner join vendor v  WITH(NOLOCK) on v.vendid=apd.vendid   
 inner join vendordetrac vd  WITH(NOLOCK) on v.vendid=vd.vendid  
 inner join apdetractipo dt  WITH(NOLOCK) on vd.detracid=dt.detracid  
---cj: 05/01/2016 - ini  
-- INNER JOIN APPTYM2011..APDOC DX ON B.USER1=DX.BATNBR  
 INNER JOIN RES2016APP..APDOC DX  WITH(NOLOCK)  ON B.USER1=DX.BATNBR  
---cj: 05/01/2016 - fin  
 left join apdetracOper do  WITH(NOLOCK) on dt.detracoperid=do.detracoperid   
where b.module='AP' and b.status<>'V' and vd.status='1' and apd.user6='OD' and (DX.CuryOrigDocAmt* DX.CuryRate)>dt.MontoMin  
 AND DX.user6='01'  
  
  
  