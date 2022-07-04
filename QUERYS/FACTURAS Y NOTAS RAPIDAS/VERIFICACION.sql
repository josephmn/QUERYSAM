
update batch set status ='B' where batnbr  ='006143' and module ='AR'

ARDEBUG '006143'

select * from artran where batnbr  ='006143' and rlsed  ='1' and acct ='121301'

delete from wrkrelease
delete from wrkreleasebad
delete from histdocslstax where refnbr in (select refnbr from ardoc where batnbr  = '006143')



select * from artran where batnbr = '006143' and acct like '12%'

delete from RefNbr where RefNbr in (select refnbr from ardoc where batnbr = '006143')

select * from HistDocSlsTax where RefNbr in (select refnbr from ardoc where batnbr = '006143')


select * from WrkReleaseBad

select * from WrkRelease


--Select * from ARDoc where Batnbr =  '006143' and refnbr =  'B030036667'

select * from gltran where BatNbr = '006143'

select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = '006143' and module = 'AR'--and refnbr like 'F030013476' 

--004896    
--F010006546 
 
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='006143' -- LOTE 
--set @refnbr ='F030013476' --DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docdate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid,* from ardoc c where batnbr= @batnbr --and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr  --and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
select * from aradjust where adjbatnbr = @batnbr --and adjdrefnbr =@refnbr
go


select Status ,Module ,JrnlType ,* from batch where BatNbr  ='000001'


select * from 
7- subtotal
4 igv
12 total

/****ejecutar para saber la duplicidad****/
--ardebug '001019'

/*

select * from wrkrelease 
select * from wrkreleasebad 

select * from histdocslstax where refnbr in (select refnbr from ardoc where batnbr  ='004028')


liberarar '004028'






DELETE FROM BATCH WHERE BATNBR  ='002457' AND MODULE ='AR'    

select C1,NumTienda, Chk_Num,TipoDoc,Fecha,Hora,NumSerie ,NumDoc,RazonSocial1 ,RazonSocial2,RazonSocial3,RUC ,C2,C3,Subtotal ,AutoServicio,IGV,Total ,Propina  ,NumDocAnulacion ,NumCajero,   NombCajero, NumEmpleado, NombEmpleado, PrimerNombEmpleado, Apellido,SecuenciaEmpleado, NumRVC,NombRVC,NumCaja ,NombCaja ,FechaNegocio,Identificador,ExportadoFN, ReferenciaFN ,ExportadoPA, ReferenciaPA, Crtd_User,  Crtd_DateTime,LUpd_User,  LUpd_DateTime,User01,User02,User03,      User04      User05     User06     User07                 User08                 User09                  User10                  tstamp             pago  from cf_regvtas 

SELECT X.TSTAMP , Y. TSTAMP 
--UPDATE X SET X.TSTAMP  = Y.TSTAMP
 FROM (
select  ROW_NUMBER() OVER(ORDER BY NUMDOC DESC) AS Row,* from CF_RegVtas  
)X 
INNER JOIN 
(select TOP 266 ROW_NUMBER() OVER(ORDER BY NUMDOC DESC) AS Row,* from [CA2017APP].[DBO].[CF_RegVtas])
Y ON X.ROW = Y.ROW 



update C
FROM CF_RegVtas C 

INNER JOIN 
()X ON C.
 set tstamp   = 










select * from CF_RegVtas where NumTienda = '47' and  cast(FechaNegocio as smalldatetime) =  '02/17/2017'  and ( C1 ='CREDITO' or user06 <> '' or (TipoDoc = '12' and len(RUC)=11 and RUC <> '88888888888' ) or (TipoDoc = '12' and left(RUC,5)<> '88888' ) or TipoDoc in ('01','OD','03','12','07')) and ExportadoFN = '' AND ReferenciaFN = '' and FechaNegocio =  '02/17/2017' 

select distinct FechaNegocio as Fecha from CF_RegVtas where NumTienda =  '47'  and  cast(FechaNegocio as smalldatetime) =  '02/20/2017'  and (C1 ='CREDITO' or user06 <> ''  or (TipoDoc = '12' and len(RUC)=11 and RUC <> '88888888888') or (TipoDoc = '12' and left(RUC,5)<> '88888' ) or TipoDoc in ('01','OD','03','12','07') ) AND ExportadoFN='' AND  ReferenciaFN='' 


select * from CF_RegVtas where  cast(FechaNegocio as smalldatetime) =  '02/20/2017'  and ( C1 ='CREDITO' or user06 <> '' or (TipoDoc = '12' and len(RUC)=11 and RUC <> '88888888888' ) or (TipoDoc = '12' and left(RUC,5)<> '88888' ) or TipoDoc in ('01','OD','03','12','07')) and ExportadoFN = '' AND ReferenciaFN = '' and FechaNegocio =  '02/20/2017' 







UPDATE ARTran SET  WHSELOC  ='01' WHERE BatNbr  ='002095'

SELECT * FROM ARTran  WHERE  WHSELOC  ='01'

/*
update APTran set CuryTaxAmt00  = 0  , CuryTxblAmt00  = 0  where BatNbr  ='002095' and  CuryTaxAmt00 >0

ardebug '002095'

liberarar '002095'



SELECT TRANAMT, CURYTRANAMT , BATNBR , RefNbr  FROM ARTran WHERE RefNbr ='B030003886'
SELECT ORIGDOCAMT,CURYORIGDOCAMT,DOCBAL,CURYDOCBAL,* FROM ARDOC WHERE BATNBR  ='002095' AND REFNBR  ='B030003886'
update Batch set Status  ='B' where BatNbr  = '002101' and Module  ='AR'
ARDEBUG '002095'

DELETE FROM WrkReleaseBad  
DELETE FROM HistDocSlsTax WHERE RefNbr IN (SELECT RefNbr FROM ARDOC WHERE BATNBR  ='002095')
SELECT * FROM HistDocSlsTax 

UPDATE ARDOC SET DOCBAL  = 23.25 , CURYDOCBAL  = 23.25 WHERE BATNBR  ='002095' AND REFNBR  ='B030003886'


ardebug '040628'

liberarar '040628'

select BatNbr, RefNbr   from  ARDoc where RefNbr in (select  RefNbr from ardoc c where batnbr= '041520') and BatNbr  <> '041520'

delete from artran where batnbr  ='041502' and rlsed  ='1' and acct ='101000'
delete from wrkrelease
delete from wrkreleasebad
delete from histdocslstax where refnbr in (select refnbr from ardoc where batnbr  = '041502')



declare @batnbr varchar(6)
set @batnbr  ='040628'
delete from artran where batnbr  =@batnbr  and rlsed  ='1' and acct ='101000'
delete from wrkrelease
delete from wrkreleasebad
delete from histdocslstax where refnbr in (select refnbr from ardoc where batnbr  = @batnbr)
delete from aradjust where adjbatnbr  =@batnbr
update batch set status  ='B' where batnbr  = @batnbr and module  ='AR'
UPDATE ARDOC SET RLSED  = 0 WHERE BATNBR  =@batnbr 
update ARTRAN SET RLSED  = 0 WHERE BATNBR  =@batnbr 











liberarar '041971'
    
select EXPORTADOFN,REFERENCIAFN,EXPORTADOPA,REFERENCIAPA,* from cf_regvtas WHERE NUMDOC  ='20161110-01-0001075'

select EXPORTADOFN,REFERENCIAFN,EXPORTADOPA,REFERENCIAPA,* from cf_regvtas WHERE EXPORTADOFN  ='040089'


LIBERARAR '040090'
     
UPDATE cf_regvtas SET EXPORTADOFN ='', REFERENCIAFN  ='',NUMDOC  ='20161110-01-0091075' ,EXPORTADOPA ='',REFERENCIAPA ='' WHERE CHK_NUM ='CFTUMBES000000019968'
UPDATE cfM_regvtas SET NUMDOC  ='20161110-01-0091075'  WHERE CHK_NUM ='CFTUMBES000000019968'

SELECT * FROM CF_REGVTAS WHERE CHK_NUM ='CFTUMBES000000019968'

select perpost,batnbr,docdate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid,* from ardoc c where REFNBR ='411F001075'

LIBERARAR  '040089'    


  
select ExportadoFN,sum(Subtotal),sum(igv),sum(total),(select sum( (CASE WHEN DOCTYPE = 'CM' THEN origdocamt*-1 ELSE origDocAmt end )) from ardoc where batnbr = ExportadoFN)AR  from CF_RegVtas where FechaNegocio =@fech and NumTienda =  @tienda
group by ExportadoFN


select * from ardoc where  batnbr  ='037422' and  DOCTYPE = 'CM'


select perpost,batnbr,docdate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid,* from ardoc c where refnbr = '011f086147' and doctype  ='PA'


select*  from cfm_detpago2 where referencia like '%198386%'

update batch set status ='B' where batnbr  ='012951' and module ='AR'

ARDEBUG '012951'

delete from artran where batnbr  ='012947' and rlsed  ='1' and acct ='121301'
delete from wrkrelease
delete from wrkreleasebad
delete from histdocslstax where refnbr in (select refnbr from ardoc where batnbr  = '012951')

SELECT NAME,* FROM CUSTOMER WHERE CUSTID ='20392573357'    


select BATNBR,DOCTYPE,* from ardoc where refnbr  ='F060902566'




declare @batnbr char(6)
declare @refnbr char(10)
declare @rlsed smallint
declare @status char(1) 
set @batnbr='041704'
set @rlsed = 1
set @status = 'U'
update batch set rlsed = @rlsed , status = @status where batnbr=@batnbr and module ='AR'
update ardoc set rlsed = @rlsed where batnbr=@batnbr
update artran set rlsed = @rlsed where batnbr=@batnbr
update gltran set rlsed =@rlsed where batnbr=@batnbr and module ='AR'


012947



ardebug '010954'



ardebug '001643'

liberarar '001643'
delete from wrkreleasebad


DELETE FROM HISTDOCSLSTAX WHERE REFNBR IN (SELECT REFNBR FROM ARDOC WHERE BATNBR  ='001643')

select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c where batnbr  ='001643'



select perpost,batnbr,docdate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid,* from ardoc c where batnbr= '028901'
select perpost,batnbr,docdate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid,* from ardoc c where batnbr= '029425'

SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR='028901' AND MODULE = 'AR'

SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR='029425' AND MODULE = 'AR'

select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c where batnbr= '028901'  
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran where batnbr= '029425' 


select * from aradjust where adjbatnbr = '028901' and adjdrefnbr ='411B910883'
select * from aradjust where adjbatnbr = '029425' and adjdrefnbr ='411B010883'


select docbal, curydocbal, batnbr , doctype ,* from ardoc where refnbr  ='f760000353'

 411B910883
411B010883

*/
delete from 
(
select  batnbr,refnbr,tranamt,count(*) from artran where batnbr  ='001643' 
and acct ='121301'

group by  batnbr,refnbr,tranamt having count(*) >1

)


---------------------------------------------------------------
--1. DOC PAGO 026600  104104  CON 149104  (CR = 14  , DR = 104)
-- CAMBIO CUENTA 104104 POR 411101
--2 . DESAPLICAR ULTIMA APLICACION CORRECTA
-- SALDO CORRECTO

/*
UPDATE ATRAN SET ACCT ='411101' WHERE BATNBR  ='' AND ACCT  ='104104'



select*  from ardoc where refnbr ='B250000364' 
select*  from ardoc   and doctype ='PA'
exec ardebug '028496'
LIBERARAR '028496'


021731     F250001033 
028223     F250001033

DELETE FROM ARTRAN WHERE BATNBR  ='028469' AND RLSED  ='1'

DELETE FROM HISTDOCSLSTAX WHERE REFNBR IN (SELECT REFNBR FROM ARDOC WHERE BATNBR  ='028469')




ardebug '028034'
liberarar '028034'
DELETE FROM HISTDOCSLSTAX WHERE REFNBR IN (SELECT REFNBR FROM ARDOC WHERE BATNBR  ='027894')

B020006826



UPDATE ARDOC SET USER6 = '01'
  WHERE BATNBR ='029119'  AND REFNBR ='B020006826'

UPDATE ARDOC SET USER6 = CASE WHEN LEFT(REFNBR,1)= 'F' THEN '01' ELSE '03' END
  WHERE BATNBR ='029119' -- AND REFNBR ='B020006826'


exec ardebug '025668'

delete from wrkreleasebad

exec ardebug '027271'
exec liberarar '027271'


update ardoc set banksub ='0000000RE000' WHERE BATNBR ='001401' AND REFNBR  ='F770000153'
update artran set SUB = '0000000RE000' where batnbr='001401' AND ACCT ='0000000000'
update gltran set SUB = '0000000RE000' where batnbr='001401' AND ACCT ='0000000000' and module ='AR'

BankSub
0000000000              

 select doctype,* from ardoc where refnbr  ='441B020806'


update ardoc set 
select doctype,*  from ardoc where refnbr ='082B314466'

021498
021499

exec ardebug '021498'
liberarar '021500'


SELECT DOCTYPE,refnbr,* FROM ARDOC WHERE  REFNBR  ='F220000502'


018030    	    F220000502   
021499			F220000502


UPDATE BATCH SET STATUS  ='P' where batnbr  ='006572' and module  ='AR' 


/*
declare @batnbr char(6)
declare @refnbr char(10)
declare @rlsed smallint
declare @status char(1) 
set @batnbr='012121'
set @rlsed = 1
set @status = 'U'
update batch set rlsed = @rlsed , status = @status where batnbr=@batnbr and module ='AR'
update ardoc set rlsed = @rlsed where batnbr=@batnbr
update artran set rlsed = @rlsed where batnbr=@batnbr
update gltran set rlsed =@rlsed where batnbr=@batnbr and module ='AR'
*/


select slsperid,shipperid,*  from soshipheader where invcnbr ='F160069820'



 select slsperid,doctype,* from ardoc where refnbr  ='B660118467'
 
 update ardoc set slsperid  ='205' where batnbr ='006572'  and refnbr  ='B660118467'

UPDATE BATCH SET STATUS  ='P' where batnbr ='006572' and module  ='ar'

SELECT * FROM RptRuntime WHERE RI_ID =  8

SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR='006482' AND MODULE = 'AR'
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR='006585' AND MODULE = 'AR'

select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,* from ardoc c where batnbr= '006482'-- and refnbr = @refnbr
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,* from ardoc c where batnbr= '006585'-- and refnbr = @refnbr

select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = '006482' and module = 'AR'

select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = '006585' and module = 'AR'

select * from aradjust where adjbatnbr ='006482' --and adjdrefnbr =@refnbr
go

select * from aradjust where adjbatnbr ='006585' --and adjdrefnbr =@refnbr
go



/*
SELECT * FROM WRKRELEASEBAD

DELETE FROM WRKRELEASEBAD



SELECT SHIPPERID,*  FROM SOSHIPHEADER WHERE ARBATNBR  ='006572' AND INVCNBR  ='F660031651'

update batch set status  ='U' where batnbr  ='006573' and module  ='AR'

delete from artran where batnbr  ='006572' and acct  ='975101'



SELECT CURYTRANAMT,TRANAMT
--update A  set curytranamt = tranamt
from aRtran a
WHERE A.BATNBR ='006572'
and tranamt <>curytranamt




delete from artran


select *  from aradjust where adjdrefnbr ='F020002791'


F160069733
F160069717
select doctype,batnbr,* from ardoc where  refnbr ='F160069717'

exec ardebug '000946'

exec liberarar '000871'

select * from ardoc where refnbr ='F760000228'


EXEC ARDEBUG '000668'


update ardoc set docbal  = 0.0 ,curydocbal =0.0 where batnbr  ='000738'

delete from wrkreleasebad

LIBERARAR '000668'


 select  distinct b.batnbr ,'POR LIB'  from ardoc a inner join cf_regvtas cf on a.batnbr = cf.exportadofn  inner join batch b on a.batnbr =b.batnbr  where b.module ='ar' and b.status in ('b','h','s') union all  select b.batnbr, 'OBSERVADO' AS ESTADO  from batch b   inner join gltran g on b.batnbr  = g.batnbr   where b.module ='ar' and b.status in ('b','h','s') and  g.module ='AR'  and  g.posted  in ('u','p')  union all  select  distinct b.batnbr ,'POR APL'  from ardoc a inner join cf_regvtas cf on a.batnbr = cf.exportadopa  inner join batch b on a.batnbr =b.batnbr  where b.module ='ar' and b.status in ('b','h','s')

 select  distinct b.batnbr ,'POR LIB'  from ardoc a inner join cf_regvtas cf on a.batnbr = cf.exportadofn  inner join batch b on a.batnbr =b.batnbr  where b.module ='ar' and b.status in ('b','h','s') union all  select b.batnbr, 'OBSERVADO' AS ESTADO  from batch b   inner join gltran g on b.batnbr  = g.batnbr   where b.module ='ar' and b.status in ('b','h','s') and  g.module ='AR'  and  g.posted  in ('u','p')  union all  select  distinct b.batnbr ,'POR APL'  from ardoc a inner join cf_regvtas cf on a.batnbr = cf.exportadopa  inner join batch b on a.batnbr =b.batnbr  where b.module ='ar' and b.status in ('b','h','s')

 

UPDATE ARTRAN SET SUB ='0000000RE000' WHERE BATNBR ='000738' AND CURYTRANAMT ='0.01'
UPDATE GLTRAN SET SUB ='0000000RE000' WHERE BATNBR ='000738' AND MODULE ='AR' AND CURYCRAMT ='0.01'



    select  distinct b.batnbr ,'POR LIB'  from ardoc a
    inner join cf_regvtas cf on a.batnbr = cf.exportadofn 
    inner join batch b on a.batnbr =b.batnbr 
    where b.module ='ar' and b.status in ('b','h','s') 
    union all
    select b.batnbr, 'OBSERVADO' AS ESTADO  from batch b 
    inner join gltran g on b.batnbr  = g.batnbr
    where b.module ='ar'
    and b.status in ('b','h','s') and  g.module ='AR'  and  g.posted  in ('u','p')
    union all 
    select  distinct b.batnbr ,'POR APL'  from ardoc a
    inner join cf_regvtas cf on a.batnbr = cf.exportadopa
    inner join batch b on a.batnbr =b.batnbr  where b.module ='ar' and b.status in ('b','h','s')
    
    
           select * from wrkreleasebad
delete from wrkreleasebad
 ardebug '027044'    
 
 liberarar '028754'
027536027044
 027449    
 delete from wrkreleasebad 
 

SELECT * FROM ARDOC WHERE REFNBR  ='331F004295'
'

---------- EDITAR SI NO ESTAN EN GLTRAN -----------------------------------------------
DECLARE @BATNBR CHAR(6)
SET @BATNBR ='040086'
delete from ardoc where batnbr=@BATNBR
delete from artran where batnbr=@BATNBR
delete from gltran where batnbr=@BATNBR and module ='AR'
delete from batch where batnbr=@BATNBR and module ='AR'
delete from cf_regvtas where exportadoFN =@BATNBR

---------------------------------------------------------------------------------------

------------ACTUALIZAR PLE 
/*
UPDATE ARDOC SET CURYTAXTOT00 =0.84 , CURYTXBLTOT00 = 4.66 WHERE BATNBR  ='007649' AND REFNBR  ='441B0004432'

select doctype,* from ardoc where refnbr  ='441b039535'
select * from cf_regvtas where exportadofn ='001627'








SELECT  *   FROM ARDOC WHERE REFNBR ='411B004432'



update gltran set cramt   = 0.88, curycramt  =0.88  where batnbr ='008982' and refnbr = '411B004432' and module  = 'ar' and acct ='401110' and cramt =0.76
update gltran set cramt   =5.76 , curycramt  = 5.76   where batnbr ='008982' and refnbr = '411B004432' and module  = 'ar' and acct ='701110' 
update gltran set dramt   =5.76 , curydramt  = 5.76   where batnbr ='008982' and refnbr = '411B004432' and module  = 'ar' and acct ='121301' 



update artran set curytranamt  =0.88 ,tranamt  = 0.88 where batnbr ='008982' and refnbr = '411B004432'  and acct ='401110' and tranamt =0.76
update artran set curytranamt  =4.88 ,tranamt  = 4.88 where batnbr ='008982' and refnbr = '411B004432'  and acct ='701110' 
update artran set curytranamt  =5.76 ,tranamt  = 5.76 where batnbr ='008982' and refnbr = '411B004432'  and acct ='121301' 



*/

/*
322	F005443	6	20100176450	REPSOL GAS DEL PERU S.A.      	4.66
411	B004432	1	88888888	CLIENTES VARIOS               	4.88

select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,* from ardoc c where batnbr IN ('008982','010225') and   refnbr  IN ('411B004432','B060005543') and doctype  ='in'
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c where batnbr IN ('007649','008982')  and refnbr  IN ('322F005443','411B004432')


select perpost,batnbr,refnbr,TRANAMT,CURYTRANAMT,* from ARTRAN c where batnbr IN ('007649','010225') and   refnbr  IN ('322F005443','B060005543') 
select perpost,batnbr,refnbr,TRANAMT,CURYTRANAMT,* from ARTRAN c where batnbr IN ('007649','010225') and   refnbr  IN ('322F005443','B060005543') 

update ardoc set curytaxtot00 =0.88 ,taxtot00 = 0.88 where batnbr ='008982' and refnbr ='411B004432'
update ardoc set curytxbltot00 =4.88 ,txbltot00 = 4.88 where batnbr ='008982' and refnbr ='411B004432'



UPDATE ARTRAN SET CURYTAXAMT00 = 0.84 ,TAXAMT00 = 0.84 WHERE BATNBR  = '007649' AND REFNBR  ='322F005443' AND ACCT  ='701110'
 UPDATE ARTRAN SET CURYTXBLAMT00 =4.66  WHERE BATNBR  = '007649' AND REFNBR  ='322F005443' AND ACCT  ='701110'
  UPDATE ARTRAN SET  TaxIdDflt ='IGV1' WHERE BATNBR  = '007649' AND REFNBR  ='322F005443' AND ACCT  ='701110'
 
TaxIdDflt
          
          
          
          
IGV1      
          
          

update artran set txblamt  =0.84




322	F005443	6	20100176450	REPSOL GAS DEL PERU S.A.      	4.66
411	B004432	1	88888888	CLIENTES VARIOS               	4.88
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,* from ardoc c where batnbr IN ('007286','010225')  and refnbr  IN ('B060005533','B060005543')
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c where batnbr IN ('007286','010225')  and refnbr  IN ('B060005533','B060005543')
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g 
where batnbr IN ('007286','010225')  and refnbr  IN ('B060005533','B060005543')  AND MODULE ='AR'



UPDATE ARTRAN SET CURYTAX


select DOCTYPE,* from ardoc where refnbr ='F290000059'

select * from cf_regvtas where referenciafn ='F110002604'



delete from wrkreleasebad

exec liberarar '006663'

select fechanegocio,exportadofn,exportadopa,referenciafn,referenciapa,* from cf_regvtas where exportadofn ='006663'

select * from aradjust where adjbatnbr ='005313'

select * from ardoc where refnbr = '351F906809'

select * from ardoc where  refnbr ='351B026910'


SELECT  ORIGDOCAMT ,* FROM ARDOC WHERE BATNBR ='006456' AND REFNBR ='F080003045'


exec liberarar '006456'


SELECT SUM(X.MONTO) FROM (
select BATNBR AS LOTE ,SUM(ORIGDOCAMT) AS MONTO from ardoc where custid ='88888888' and doctype ='IN'
AND CURYORIGDOCAMT <>0 
 AND PERPOST ='201512' and refnbr NOT IN 
 (select refnbr from ardoc where doctype ='PA')
GROUP BY BATNBR)X


select distinct batnbr from ardoc
where doctype ='in' and origdocamt =0
and refnbr in
(select refnbr from ardoc where doctype ='pa')
and refnbr in (select adjdrefnbr from aradjust)
go









/*

delete from batch where batnbr ='028592' and module  ='ar'
delete from ardoc where batnbr ='028592'
delete from artran where batnbr ='028592'
delete from gltran where batnbr ='028592'and module  ='ar'
delete from aradjust where adjbatnbr ='028592'
update cf_regvtas set exportadopa =' , referenciapa =' ,user06 =' where exportadopa ='028592'
delete from lrevisados where lote  ='028592'

*/

select*  from ardoc where refnbr ='B240000745'
select* from cf_regvtas where referenciafn='B240000747'
select * from cf_regvtas where referenciafn ='B240000747'

-- EDITAR AR --

--delete from artran where batnbr ='023308' and rlsed =1 and  acct  ='101000' 
--
--delete from aradjust where adjbatnbr ='023308'
--

/*
006663
update batch set rlsed =0 , status ='B' where batnbr ='012249' and module  ='AR'
update ardoc set rlsed =0 where batnbr ='012249'
update artran set rlsed =0 where batnbr ='012249'
update gltran set rlsed =0 where batnbr ='012249' and module  ='AR'
*/


use [ca2016app]
go

select *  from xamrestriccion  where userid ='SYSADMIN'


insert into xamrestriccion (userid,tipo,dato)
select 'BDURBCHA',tipo,dato from xamrestriccion where userid ='SYSADMIN' AND TIPO ='CAFETERIAS'
AND DATO NOT IN (SELECT DATO FROM xamrestriccion WHERE USERID ='BDURBCHA' AND TIPO ='CAFETERIAS')



select  * from batch where module ='ar' and status in ('b','s','h')







--update ardoc set slsperid='091' where batnbr  ='008225' and slsperid='91'
--
--
--update artran set slsperid='091' where batnbr  ='008225' and slsperid='91'
--
*/
*/
update batch set crtot=799.83,curycrtot=799.83,CuryDepositAmt = 799.83,DepositAmt =799.83
 from batch where batnbr ='012463' and module ='AR'

DepositAmt
819.41
CuryDepositAmt
819.41
----
--delete from gltran where batnbr  ='022967'and module ='ar'  and refnbr ='B060005345' and acct  = '401110' 
--and trandesc ='IGV 18 %'
--
--delete from artran where batnbr ='022967' and refnbr ='B060005345' and acct  ='401110'  and whseloc ='TX'
--UPDATE ARDOC SET DOCBAL =500,ORIGDOCAMT =500,CURYORIGDOCAMT =500,CURYDOCBAL=500
-- WHERE BATNBR ='022967' AND  refnbr ='B060005345' AND DOCBAL  =576.27 
--
--update artran set curytranamt =500,tranamt=500 where batnbr ='022967' and acct ='149101' and tranamt =576.27
--
--update gltran set dramt = 500 , curydramt =500 where batnbr  ='022967' and module ='AR' and refnbr ='B060005345'
--and acct ='149101' 


--exec ardebug '024572'
--exec liberarar '024572'

--delete from ardoc where batnbr='030424' and refnbr
--delete from artran where batnbr='030424'
--delete from gltran where batnbr='030424' and module ='AR'
--delete from batch where batnbr='030424' and module ='AR'



--delete from ardoc where batnbr ='008687' and refnbr ='C570000584' and doctype ='CM'
--delete from artran where batnbr ='008687' and refnbr ='C570000584' and trantype ='CM'
--delete from refnbr where refnbr ='C570000584'

--exec liberarar '022746'

--aradjust pendiente

--BUSCAR DOCUMENTOS REPETIDOS--------------------------------------
declare @refnbr char(10)
set @refnbr  =' -- DOCUMENTO
select * from ardoc where refnbr  like '%351B026910%'

select * from aradjust where adjdrefnbr like '%C570000584%'
-------------------------------------------------------------------
-------------------------------------------------------------------
select refnbr,count(*) from ardoc where perpost ='201601'
group by refnbr having count(*) > 3 
-------------------------------------------------------------------
-------------------------------------------------------------------
select * from apdoc where batnbr='007458'
--- BUSQUEDA ----------------------------------------------------(AP)
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='011395' -- LOTE 
--set @refnbr ='007611' -- DOCUMENTO
SELECT STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AP'
select perpost,batnbr,docbal,refnbr,doctype,rlsed,taxid00,* from APDOC where batnbr= @batnbr-- and refnbr = @refnbr
select rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,* from aptran
where batnbr= @batnbr --and refnbr like @refnbr
select rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'AP' 



--update apdoc set curytaxtot00  =15.25,taxtot00 = 15.25,taxid00='IGV1', curytaxtot01 = 0 ,taxtot01=0 ,  taxid01 ='
--where batnbr  ='014493'    
--update aptran set curytaxamt00 = 15.25, taxamt00  =15.25 ,taxid00='IGV1',curytaxamt01 = 0,taxamt01 =0,taxid01='
--where batnbr  ='014493' and TAXCAT ='AFECTO'






--BUSCAR DOCUMENTOS REPETIDOS--------------------------------------
declare @refnbr char(10)
set @refnbr  =' -- DOCUMENTO
select * from apdoc where refnbr  like '%421213%'
------------------------------------------------------------------
select refnbr,count(*) from apdoc where perpost ='201507'
group by refnbr having count(*) > 1 
-------------------------------------------------------------------



--- BUSQUEDA ----------------------------------------------------(CA)
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='012362' -- LOTE 
--set @refnbr ='031F001844' -- DOCUMENTO
SELECT STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'CA'
select * from catran where batnbr=@batnbr --and refnbr =@refnbr
select rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'CA'  --and refnbr like @refnbr 
-----------------------------------------------------------------

--
--update catran set banksub ='0000000000', sub ='0000000000' where batnbr ='012362' 
--update gltran set sub ='0000000000' where batnbr ='012362' and module  ='CA'

/*
------ -- EDITAR SI YA ESTAN EN GLTRAN ------------------------------------------------
declare @batnbr char(6)
declare @refnbr char(10)
declare @rlsed smallint
declare @status char(1) 
set @batnbr='025149'
set @rlsed = 1
set @status = 'U'
update batch set rlsed = @rlsed , status = @status where batnbr=@batnbr and module ='AR'
update ardoc set rlsed = @rlsed where batnbr=@batnbr
update artran set rlsed = @rlsed where batnbr=@batnbr
update gltran set rlsed =@rlsed where batnbr=@batnbr and module ='AR'
---------------------------------------------------------------------------------------
*/

/*
---------- EDITAR SI NO ESTAN EN GLTRAN -----------------------------------------------
delete from ardoc where batnbr='012117' 
delete from artran where batnbr='012117'
delete from gltran where batnbr='012117' and module ='AR'
delete from batch where batnbr='012117' and module ='AR'
delete from cf_regvtas where exportadofn ='012117'
---------------------------------------------------------------------------------------
*/
------------ VERIFICAR DOCUMENTO EN BRUTO -------------------------------- 

SELECT * FROM CFM_REGVTAS WHERE NUMDOC LIKE '%0064181'
SELECT * FROM CF_REGVTAS WHERE NUMDOC LIKE '%0064181'
SELECT * FROM CF_REGVTAS WHERe numserie='004'AND NUMDOC LIKE '%0003727'

SELECT * FROM CF_REGVTAS WHERE NUMTIENDA  ='33' AND MONTH( FECHANEGOCIO )=6  AND FECHANEGOCIO ='2015-06-30'
SELECT * FROM CF_REGVTAS WHERE NUMTIENDA  ='33' AND MONTH( FECHANEGOCIO )= 8 


------------ VERIFICAR DOCUMENTOS ANTES DE TRANSACCIONES ---
select Rlsed,status from batch where module ='AR' and  Rlsed<>1 and status not in ('C','U','P') and batNbr= '021134' 
select Rlsed,status from batch where module ='AR' and  Rlsed<>1 and status not in ('C','U','P') and batNbr= '021136' 

select* from aradjust where adjbatnbr ='030158'  and adjdrefnbr ='B240000747'  


--- ACTUALIZAR PERIODO INTRAN --- 
--UPDATE batch SET PERPOST = '201507',S4FUTURE07='2015-07-31 08:27:00'  where module ='in' and batnbr ='007933' --and perpost ='201508'
--UPDATE INTRAN SET PERPOST = '201507',TRANDATE='2015-07-31 08:27:00'   where  batnbr ='007933' --and perpost ='201508'
--UPDATE GLTRAN SET PERPOST = '201507',TRANDATE='2015-07-31 08:27:00'   where module ='in'and batnbr ='007933' --and perpost ='201508'






--UPDATE APDOC SET CURYDOCBAL =738.5 WHERE REFNBR  ='002535' AND ACCT  ='421213'

select * from cf_regvtas where numtienda  ='35' and fechanegocio ='2016-02-04'


20160204-01-9006809     
20160204-01-9006812 CFJULIAC000000002320
select * from cf_regvtas where chk_num  ='CFJULIAC000000002316'

select exportadofn,referenciafn,exportadopa,referenciapa,* from cf_regvtas where chk_num  ='CFJULIAC000000002320'


select ardoc.* FROM CF_RVLotesPPago 
INNER JOIN ARDoc ON CF_RVLotesPPago.ExportadoFN = ARDoc.BatNbr
AND CF_RVLotesPPago.ReferenciaFN = ARDoc.RefNbr 

