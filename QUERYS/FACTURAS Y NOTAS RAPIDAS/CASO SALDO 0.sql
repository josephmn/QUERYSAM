--select BATNBR,REFNBR,doctype,CuryOrigDocAmt,OrigDocAmt,CURYDOCBAL,DOCBAL,OpenDoc,PerClosed 
--from ardoc
----update ardoc set docbal=-5.92 , curydocbal =-5.92
--where refnbr IN ('024247')

--select refnbr, tranamt,* from artran  where refnbr IN ('011B112502')

--SELECT ADJBATNBR, RecordID,AdjdRefNbr,adjgrefnbr,* 
--FROM ARADJUST WHERE  adjgrefnbr in('B350087083','0705')

--select BATNBR,REFNBR,CUSTID,CuryTranAmt,TRANAMT,DrCr , TRANTYPE,ACCT,TRANTYPE,*
--from arTRAN 
---- UPDATE arTRAN  SET CuryTranAmt= CuryTranAmt * -1 , TRANAMT = TRANAMT * -1, DRCR = 'D' para facturas
--where BATNBR ='014445' AND ACCT  IN ('121301','12110') AND TRANAMT<>0 AND TRANTYPE='IN'--AND refnbr IN ('B370019808','B370020017')
--------------------------------------
---- se encontro el nunero de doc repetido en la 40 y en la 70, por lo que se elimina uno de los regsitros.
---- en artran , ardoc , y se actualiza el monto en batch.
---- pero primero se verifica si no esta en Contabilidad.

--select BATNBR,acct,REFNBR,CUSTID,round(CuryTranAmt,2)CuryTranAmt,round(TRANAMT,2)TRANAMT,round(CuryTranAmt,2)- round(TRANAMT,2),DrCr , TRANTYPE,ACCT,TRANTYPE,*
--from arTRAN
---- UPDATE arTRAN  SET CuryTranAmt= CuryTranAmt * -1 , TRANAMT = TRANAMT * -1, DRCR = 'D' para facturas
---- UPDATE arTRAN  SET  TRANAMT = CuryTranAmt 

--where BATNBR ='006200'  --AND refnbr IN ('F160045406') and acct ='401110'
--and round(CuryTranAmt,2)- round(TRANAMT,2)<>0

--select BATNBR,REFNBR,CUSTID,round(CuryTranAmt,2),round(TRANAMT,2),round(CuryTranAmt,2)- round(TRANAMT,2),DrCr , TRANTYPE,ACCT,TRANTYPE,*
-- from arTRAN where BATNBR ='003015'  AND refnbr IN --('B320380938','B320380948','B580010116')
--(select REFNBR from(
--select BATNBR,REFNBR,ACCT,count(Acct) cant
-- from arTRAN where BATNBR ='003015'  
--group by BATNBR,REFNBR,ACCT)T where cant=2)

--select InvcNbr,shipperid,*from soshipheader where  InvcNbr = 'B410040430' 
--select *from soshipline where  shipperid = 'BDT0003094' 
----****************************************


--010151
--010152
/*

select rlsed,BATNBR,REFNBR,CuryTranAmt,TRANAMT,(CuryTranAmt - TRANAMT),DrCr , TRANTYPE,acct,*
from arTRAN 
--delete arTRAN 
where BATNBR ='016150' AND ACCT  IN ('101000')
*/

-- IN 40 , 70 C
-- CM 40 , 70 D
-- IN 12 D
-- CM 12 C

'nota de credito'
select rlsed,BATNBR,ACCT,REFNBR,CuryTranAmt,TRANAMT,DrCr , TRANTYPE,*
--*
from arTRAN 
--UPDATE arTRAN  SET CuryTranAmt= CuryTranAmt * -1 , TRANAMT = TRANAMT * -1, DRCR = 'D'
where BATNBR ='032041' AND ACCT IN ('121301','12110','131230') AND TRANAMT<>0  AND  TRANTYPE='CM'--AND refnbr IN ('B370019808','B370020017')


select rlsed,BATNBR,REFNBR,CuryTranAmt,TRANAMT,(CuryTranAmt - TRANAMT),DrCr , TRANTYPE,acct,*
from arTRAN 
--delete arTRAN 
--UPDATE arTRAN  SET rlsed =0
where BATNBR ='037653' AND ACCT   IN ('121301','12110','131230','149101') and rlsed =0 AND TRANAMT=0 --AND TRANTYPE='CM'--AND refnbr IN ('B370019808','B370020017')

'( SEGUNDO )ACTUALIZA ADOC DESDE  ARTRAN '
select doctype, ardoc.custid, t.custid,ardoc.refnbr, ardoc.origdocamt,ardoc.curyorigdocamt, t.CuryTranAmt,t.TranAmt,ardoc.DocBal,ardoc.curyDocBal,ardoc.curyorigdocamt - t.CuryTranAmt as dif,ardoc.origdocamt - t.TranAmt as dif,OpenDoc,PerClosed
--select ardoc.custid, t.custid,ardoc.refnbr, ardoc.curyorigdocamt, t.CuryTranAmt,ardoc.DocBal,ardoc.curyDocBal,CONVERT(DEC(28,2),ardoc.curyorigdocamt - t.CuryTranAmt) as dif
--update ardoc set  CuryOrigDocAmt=CONVERT(DEC(28,2),t.CuryTranAmt), OrigDocAmt=CONVERT(DEC(28,2),t.TranAmt) , CuryDocBal= CONVERT(DEC(28,2),t.CuryTranAmt),DocBal=CONVERT(DEC(28,2),t.TranAmt),OpenDoc=1,PerClosed=''
--update ardoc set  CuryOrigDocAmt=CONVERT(DEC(28,2),t.CuryTranAmt), OrigDocAmt=CONVERT(DEC(28,2),t.TranAmt) , CuryDocBal= 0,DocBal=0,OpenDoc=0
--update ardoc set  CuryDocBal=2594.93,DocBal=2594.93,OpenDoc=1,PerClosed=''
--update ardoc set custid = t.custid
from ardoc inner join (
--SELECT batnbr,refnbr,CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D' and trantype<>'CM' THEN  (curyTranAmt + CuryTaxAmt00)*(-1) ELSE (curyTranAmt + CuryTaxAmt00) *-1 END)) as CuryTranAmt, CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D'  and trantype<>'CM' THEN  (TranAmt + CuryTaxAmt00)*(-1) ELSE (TranAmt + CuryTaxAmt00 )*-1 END) )  as TranAmt
SELECT custid,batnbr,refnbr,CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D' and trantype<>'CM' THEN  (curyTranAmt )*(-1) ELSE curyTranAmt  END)) as CuryTranAmt, CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D'  and trantype<>'CM' THEN  (TranAmt )*(-1) ELSE TranAmt  END) )  as TranAmt
--SELECT custid,batnbr,refnbr,CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D' and trantype<>'CM' THEN  (curyTranAmt )*(-1) ELSE curyTranAmt  END)) as CuryTranAmt, CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D'  and trantype<>'CM' THEN  (TranAmt )*(-1) ELSE TranAmt  END) )  as TranAmt
FROM ARTRAN WHERE BATNBR='002101' and acct  not IN ('131230','121301','149101','141101') --and drcr ='C'
group by custid,batnbr,refnbr
) t on ardoc.batnbr = t.batnbr and ardoc.refnbr = t.refnbr
WHERE ardoc.BATNBR='002101' --and t.refnbr in('351F906809','351F906812')
and ardoc.refnbr   in  (
select refnbr from ardoc where doctype ='IN'
--union all
--select AdjdRefNbr  from aradjust 
--union all
--select AdjgRefNbr from aradjust 
)

 LIBERARAR '002095'   
select doctype, ardoc.custid,ardoc.refnbr, ardoc.origdocamt,ardoc.curyorigdocamt, ardoc.docbal, ardoc.curydocbal,t.AdjAmt,ardoc.origdocamt- t.AdjAmt
--update ardoc set  CuryOrigDocAmt=CONVERT(DEC(28,2),t.CuryTranAmt), OrigDocAmt=CONVERT(DEC(28,2),t.TranAmt) , CuryDocBal= 0,DocBal=0,OpenDoc=0
--update ardoc set  CuryDocBal=t.AdjAmt,DocBal=t.AdjAmt,OpenDoc=1,PerClosed=''
from ardoc inner join (
select AdjdRefNbr refnbr,sum(AdjAmt)AdjAmt from aradjust 
group by AdjdRefNbr
) t on ardoc.refnbr = t.refnbr
WHERE 
ardoc.custid='71273416' and 
(ardoc.origdocamt- t.AdjAmt) > 0.5 and doctype ='IN' and bankacct ='149101'
        
select AdjdRefNbr,sum(AdjAmt)AdjAmt from aradjust 
group by AdjdRefNbr
    
    
select refnbr,*from ardoc where custid ='71273416'    
    
   

select refnbr,curyTranAmt,TranAmt,* FROM ARTRAN WHERE BATNBR='013536' and refnbr ='B660104093'--and acct not  IN ('131230','121301') 
select refnbr,* FROM gltran WHERE BATNBR='013536' and refnbr ='B660104093' and module ='AR' --and acct not  IN ('131230','121301')

024861    
select doctype,docbal,*from ardoc where docbal < 0  or  curydocbal < 0   
select doctype,docbal,*
--update ardoc set  CuryOrigDocAmt=CuryOrigDocAmt*-1, OrigDocAmt=OrigDocAmt*-1
from ardoc where CuryOrigDocAmt < 0 
select doctype,docbal,*from ardoc where batnbr='027813' 
/*
select *from aradjust where AdjdRefNbr in('161F055396')
select *from aradjust where AdjgRefNbr in('161F055396')
*/

select *from aradjust where adjbatnbr in('019636')

update aradjust set  AdjAmt=485.67,CuryAdjdAmt =485.67 from aradjust where adjbatnbr ='019853' and AdjgRefNbr ='161F055390'


'( TERCERO ) ACTUALIZA BATCH DESDE ARDOC'
select BATCH.CrTot,BATCH.CtrlTot, BATCH.CuryCrTot, BATCH.CuryCtrlTot, D.CuryOrigDocAmt,D.OrigDocAmt,CuryDepositAmt,DepositAmt,*
--UPDATE BATCH SET  CrTot=CONVERT(DEC(28,2),D.OrigDocAmt), CtrlTot=CONVERT(DEC(28,2),D.OrigDocAmt), CuryCrTot= CONVERT(DEC(28,2),D.CuryOrigDocAmt), CuryCtrlTot= CONVERT(DEC(28,2),D.CuryOrigDocAmt),CuryDrTot=CONVERT(DEC(28,2),D.OrigDocAmt),DrTot=CONVERT(DEC(28,2),D.OrigDocAmt),CuryDepositAmt=CONVERT(DEC(28,2),D.OrigDocAmt), DepositAmt =CONVERT(DEC(28,2),D.OrigDocAmt)
from BATCH INNER JOIN 
(SELECT  BATNBR, CONVERT(DEC(28,2),sum(CuryOrigDocAmt)) AS CuryOrigDocAmt,CONVERT(DEC(28,2),sum(OrigDocAmt) ) AS OrigDocAmt, CONVERT(DEC(28,2),sum(CuryDocBal)) AS CuryDocBal,CONVERT(DEC(28,2),sum(DocBal)) AS DocBal
FROM ARDOC WHERE BATNBR='003015'
GROUP BY BATNBR
) D ON BATCH.BATNBR= D.BATNBR 
where BATCH.batnbr='003015'  and BATCH.MODULE='AR'


--select ACCT,count(* )
--select *
--from gltran  where BATNBR in ('023273') and module='ar' 
--select *
--from ardoc  where BATNBR in ('023273')
--group by ACCT
--001906
--000046
'facturas'
select refnbr,curycramt, cramt, curydramt,dramt,trantype,* 
from gltran  
--1) update gltran set curydramt=curycramt*-1,dramt=cramt*-1
-- 2) update gltran set curycramt=0,cramt=0
where BATNBR in ('003015') and module='AR' AND ACCT IN ('121301','12110','131230') and trantype='in'--and refnbr ='C41-17751'
order by  gltran.refnbr
'nc'
select refnbr,curycramt, cramt, curydramt,dramt,trantype,* 
from gltran  
--1) update gltran set curycramt=curydramt*-1,cramt=dramt*-1
-- 2) update gltran set curydramt=0,dramt=0
where BATNBR in ('003015') and module='ar' AND ACCT IN ('121301','12110','131230') and trantype='cm'and refnbr ='C41-17751'
order by  gltran.refnbr

--select refnbr,curycramt, cramt, curydramt,dramt,trantype,* 
--from gltran  
----1) update gltran set curydramt=curycramt,dramt=cramt
---- 2) update gltran set curycramt=0,cramt=0
--where BATNBR in ('006005') and module='ar' AND ACCT not IN ('121301','12110','131230') and trantype='cm'
----and linenbr ='-32653'
--order by  gltran.refnbr

select artran.BATNBR,artran.ACCT,artran.REFNBR,artran.CuryTranAmt,artran.TRANAMT,artran.DrCr , artran.TRANTYPE,CONVERT(DEC(28,2),t.CuryTranAmt),CONVERT(DEC(28,2),t.TranAmt) ,*
--UPDATE arTRAN  SET CuryTranAmt= CONVERT(DEC(28,2),t.CuryTranAmt), TRANAMT = CONVERT(DEC(28,2),t.TranAmt) 
from artran inner join (
--SELECT batnbr,refnbr,CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D' and trantype<>'CM' THEN  (curyTranAmt + CuryTaxAmt00)*(-1) ELSE curyTranAmt + CuryTaxAmt00 END)) as CuryTranAmt, CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D'  and trantype<>'CM' THEN  (TranAmt + CuryTaxAmt00)*(-1) ELSE TranAmt + CuryTaxAmt00 END) )  as TranAmt
SELECT batnbr,refnbr,CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D' and trantype='CM' THEN  (curyTranAmt )*(-1) ELSE curyTranAmt  END)) as CuryTranAmt, CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D'  and trantype<>'CM' THEN  (TranAmt )*(-1) ELSE TranAmt  END) )  as TranAmt
FROM ARTRAN 
WHERE BATNBR='031197' and acct  IN ('131230','121301','149101') --and refnbr ='B170000711'
group by batnbr,refnbr
) t on artran.batnbr=t.batnbr and artran.refnbr =t.refnbr
WHERE artran.BATNBR='031197' and acct ='121301' and t.refnbr ='B170000711'


select acct,gltran.refnbr,gltran.trantype,gltran.curycramt, gltran.cramt, gltran.curydramt,gltran.dramt, t.curydramt,t.dramt, t.curycramt,t.cramt
--update gltran set curycramt = t.curydramt, cramt = t.dramt -- CM
--update gltran set  curydramt= t.curycramt, dramt = t.cramt -- IN
from gltran inner join (
select batnbr ,refnbr,trantype,sum(curycramt)curycramt, sum(cramt)cramt, sum(curydramt)curydramt,sum(dramt)dramt
from gltran  
--1) update gltran set curycramt=curydramt*-1,cramt=dramt*-1
-- 2) update gltran set curydramt=0,dramt=0
where BATNBR in ('031200') and module='ar'  and trantype <> 'cm' AND ACCT  not IN ('121301','12110','131230','149101')--and refnbr ='C41-17751'
group by batnbr ,refnbr,trantype
) T  on gltran.batnbr = t.batnbr and gltran.refnbr = t.refnbr
where gltran.batnbr in ('031200')  and acct ='121301' and gltran.refnbr ='181F025087'

select rlsed,status,*from batch where batnbr in('015381','015395') and module ='Ar'

019352       
-- CONSULTO TODAS LAS TABLAS
000717
000735
000911

update ardoc set batnbr ='007449',banksub ='000000000000' from ardoc where batnbr in('007449','007447') and custid ='16719966'

021212
select *from ardoc where refnbr in ('121F138710','121F138711','121F091377')
select refnbr,CuryOrigDocAmt,docbal,*from ardoc where refnbr in ('0080008175','0080-08175','008008175 ')
select refnbr,tranamt,trantype,*from artran where refnbr in ('0080008175','0080-08175','008008175 ')
and acct ='701110'




select LastBatNbr,*
--update arsetup set LastBatNbr='027900'
from arsetup

select * from batch where batnbr   in('022141','022142')  and module ='Ar'
019458    	082B296999
019458    	082B296999

027972    
000001
000003

select curyTranAmt,TranAmt,curyrate,*
--update artran set TranAmt = round(curyTranAmt* curyrate,2)
from artran where batnbr ='011526'
011611
011618

001120
001121
   

select rlsed,status,perpost,*from batch where batnbr in('001120')  and module ='Ar'
select ''''+refnbr + ''',' ,rlsed,refnbr,curyorigDocAmt,origDocAmt,custid,doctype,docdate,user2,docbal,curydocbal,perpost,*from ardoc where batnbr in('001120')
--and refnbr in ('F160063714')
select sub,rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc,perpost,drcr,*from artran where batnbr in('001120')   --and refnbr in ('F160063714')--and acct ='999999'
select sub,refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,perpost,*
from gltran where batnbr in('001120') and module ='Ar' --  and refnbr in ('F160063714') --and acct ='999999'order by gltran.refnbr
select *from aradjust where adjbatnbr  in('001120')
003415
select ''''+refnbr + ''',' ,rlsed,refnbr,curyorigDocAmt,origDocAmt,custid,doctype,docdate,user2,docbal,curydocbal,perpost,*from ardoc where batnbr in('000294')
select *from refnbr where refnbr ='B660107200'
select *from intran where refnbr ='B660107200'
034629
037707    
select sub,rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc,perpost,drcr,*
--delete 
--update artran set TranAmt=curyTranAmt
from artran where batnbr in('001121') and acct='975101'

select refnbr,doctype,docbal,*from ardoc where custid like '%20520711865%' and docbal <> 0
021B112007     
021B112025     

  ,'021B112025'
select  ''''+refnbr + ''',' ,rlsed,refnbr,curyorigDocAmt,origDocAmt,custid,doctype,docdate,user2,docbal,curydocbal,perpost,*
from ardoc --where doctype ='NS'
where refnbr   in('181F027388') 

select id,refnbr,*from gltran where trantype ='CM' and acct ='121301' and curydramt <> 0 and module ='AR'

B770000004
B77000004 
441B016602
select *from soshipline where shipperid='BCH0002511'

001521                        	B24-000819                    

351F906812
351F906809
DECLARE @REF CHAR(10)
SET @REF='141B060751'
select shipperid,invcnbr,billname,termsid,*from newsh where invcnbr in(@REF)
select shipperid,invcnbr,termsid,*from soshipheader where invcnbr in(@REF)
select batnbr,rlsed,perpost,refnbr,terms,curyorigDocAmt,origDocAmt,TaxTot00, txbltot00,custid,doctype,docdate,docbal,curydocbal,opendoc,perclosed,terms,*
from ardoc where  refnbr in (@REF)    --and doctype ='IN'
select rlsed,refnbr,perpost,curyTranAmt,TranAmt,custid,trantype,*
from artran where refnbr  in (@REF) 
order by artran.refnbr
select refnbr,perpost,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,*
from gltran where   refnbr in (@REF)  and module ='Ar' 
select *from refnbr where refnbr  in (@REF) 
select AdjAmt,CuryAdjdAmt,CuryAdjgAmt,* from aradjust where AdjdRefNbr in (@REF)  --and recordid ='168319'
select *from aradjust where AdjgRefNbr in (@REF) 
select *from PLCMInvcnbr where refnbr in (@REF) 
select *from PLCMInvcnbr where invcnbr in (@REF) 
select *from intran where refnbr in (@REF) 

SELECT *FROM  aradjust where AdjdRefNbr like '%441B016597%'
SELECT *FROM  aradjust where AdjgRefNbr like '%441B016597%'



select batnbr,rlsed,perpost,refnbr,terms,curyorigDocAmt,origDocAmt,TaxTot00, txbltot00,custid,doctype,docdate,docbal,curydocbal,opendoc,perclosed,terms,*
--update ardoc set bankacct='121301' 
from ardoc where bankacct ='03' and custid not in ('40415250','44454201')--and perclosed=''--and user6='12' --and len(custid) =11 --in ('8888888','88888888')
select rlsed,refnbr,perpost,curyTranAmt,TranAmt,custid,trantype,trandesc,*
--update artran set acct='121301' 
from artran where acct ='03' and custid not in ('40415250','44454201')--and refnbr in (select refnbr from ardoc where bankacct ='141101' and perclosed='')--and refnbr in (select refnbr from ardoc where bankacct ='' and user6='12')--and len(custid) =11 -- in ('8888888','88888888')
select refnbr,perpost,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,id,*
--update gltran set acct='121301' 
from gltran where acct ='03' and module ='AR'  and id not in ('40415250','44454201')--
and refnbr in (select refnbr from ardoc where bankacct ='121301' and user6='12' )----and refnbr in (select refnbr from ardoc where bankacct ='' and user6='12') --
and len(id) =11 -- in ('8888888','88888888') and module ='AR'





delete from aradjust where adjbatnbr   in('B130002066') 

select *from ardoc where perpost ='201511' and docbal < 0 and BankAcct='149101' and custid in ('46754257','45911329')

select rlsed,status,perpost,*from batch where batnbr in('006368')  and module ='GL'
select sub,refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,perpost,*
from gltran where batnbr  in('006368')  and module ='GL' --  and refnbr in ('F160063714') --and acct ='999999'order by gltran.refnbr


SELECT *FROM BATCH WHERE CuryID='dol' AND MODULE ='ar'
select *from aradjust where AdjgDocDate = DateAppl --adjbatnbr  in('005054') 


--delete from aradjust where adjbatnbr  in('028419') 

select *from aradjust where adjbatnbr  in('029966') 

--estado de un lote de AP antes de liberar.
-- lote no liberaba por que estos valores estanban con datos
select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc='',AcctDist=0,CostType='IN',DrCr='U',FiscYr='',SiteId= refnbr,UnitDesc=perpost,CmmnPct=TranAmt*-1,*
--update artran set trandesc='',AcctDist=0,CostType='IN',DrCr='U',FiscYr='',SiteId= refnbr,UnitDesc=perpost,CmmnPct=TranAmt*-1
from artran where batnbr  in('032041')


      

29

           

select rlsed,refnbr,curyorigDocAmt,origDocAmt,custid,doctype,docdate,user2,docbal,*from ardoc where batnbr  in('015064') and  custid ='17817705'
select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc,*from artran where batnbr  in('015064')  and  custid ='17817705'
select shipperid,invcnbr,invcdate,*from soshipheader where custid ='17817705'
select shipperid,*from soshipline where shipperid in('BCH0016361')


select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc,RecordID,*
--delete 
from artran where batnbr  in('014325')  and RecordID > 279000 in (683112,683110)
select refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,lineNbr,*
--delete 
from gltran where batnbr  in('014325')  and module ='Ar' and lineNbr in (-32765,0)

select *
--delete 
from aradjust where adjbatnbr  in('031670') 


RecordID
683111

select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc,*from artran where perpost  in('201407') and sub ='CACACAF000'

select *from intran where tranDesc like '%BCH0016361%'
  
select refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc
--update gltran set curycramt=0,cramt=0
from gltran where refnbr ='331B014779' and module ='AR' and acct ='401110'

select *from ardoc where batnbr ='019641' and custid not in (select custid from customer)

select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc,*
-- delete 
from artran where batnbr  in('012913') and acct ='101000'

--se duplica la cuenta 12 en la aplicaciones de coffee
select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,trandesc,*
--delete  
from artran where batnbr  in('009853')  and trandesc = ''
select refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,*
--delete  
from gltran where batnbr  in('009853')  and module ='Ar' and trandesc = ''

020816    	331B015883
/*

update ardoc set custid='0' from ardoc where custid ='76262239' --and refnbr like '%331B015883%'
update artran set custid='76562239' from artran where custid ='76262239' --and refnbr like '%331B015883%'
update gltran set id='76562239' from gltran where  id ='76262239' and module ='AR' --and refnbr like '%331B015883%'
update aradjust set  custid='76562239'  from aradjust where CUSTID='76262239'

update ardoc set custid='00000000000' from ardoc where  refnbr like '%B770000203%'
update artran set custid='00000000000' from artran where refnbr like '%B770000203%'
update gltran set id='00000000000' from gltran where  module ='AR' and refnbr like '%B770000203%'
update aradjust set  custid='00000000000'  from aradjust where AdjgRefNbr='B770000203'

update aradjust set  custid='76562239'  from aradjust where CUSTID='76262239'

*/
update batch set  perpost='201506' from batch where batnbr ='015397' and module ='Ar'
update ardoc set  rlsed =1,perpost='201506',perclosed ='201505' from ardoc where batnbr ='015397'
update artran set rlsed =1,perpost='201506'  from artran where batnbr ='015397'
update gltran set rlsed =1,perpost='201507',trandate='2015-07-30 00:00:00' from gltran where batnbr ='007955'  and module ='Ar'
/*

update ardoc set BankSub='CAAYCAF000' from ardoc where batnbr  in('014669') and BankSub ='CACHCAF000'
update artran set sub='CAAYCAF000' from artran where batnbr  in('014669') and sub ='CACHCAF000'
update gltran set sub='CAAYCAF000' from gltran where batnbr  in('014669') and sub ='CACHCAF000' and module ='AR'

update ardoc set BankSub='0000000RE000'  from ardoc where  batnbr ='000365' and BankSub ='000000000000'
update artran set sub='0000000RE000'  from artran where   batnbr ='000365' and sub ='000000000000'
update gltran set sub='0000000RE000'  from gltran where    batnbr ='000365' and sub ='000000000000' and module ='AR'
*/
--delete from artran where0 batnbr  in('001542')  and acct ='401130'--and refnbr in ('080F000324')--
--delete from gltran where batnbr  in('001542')  and module ='Ar' and acct ='401130'--and refnbr in ('080F000324') --order by gltran.refnbr

select * from artran where sub ='000000000000'
select * 
--update gltran set sub ='0000000RE000'
from gltran where  sub ='000000000000' and module ='AR'

select * 
--update artran set sub ='0000000RE000'
from artran where  sub ='000000000000'

select * 
--update ardoc set BankSub ='0000000RE000'
from ardoc where  BankSub ='000000000000'


select *from refnbr where refnbr in('NC00100037','NC00100038')
in (
select refnbr from ardoc where batnbr  in('000717')
)
--update artran set  SiteId ='161F090785' from artran where batnbr  in('000041') and refnbr ='161F090804'

--update batch set BankSub ='000000000000' from batch where batnbr in('008409') and module ='Ar'

  --013085 /////////////
     

 
/*   
    
028354    

declare @batnbr char(6)
set @batnbr ='001120'
delete from batch where batnbr in(@batnbr) and module ='Ar'
delete from ardoc where batnbr in(@batnbr) --and refnbr in ('F080002322')
delete from artran where batnbr in(@batnbr) --and refnbr in ('F080002322')--and acct ='999999'
delete from gltran where batnbr in(@batnbr) and module ='Ar' --and refnbr in ('F080002322') --and acct ='999999'order by gltran.refnbr

delete from refnbr where refnbr='EXT/02'

*/

/*   
declare @batnbr char(6)
set @batnbr ='034016'
delete from batch where batnbr in(@batnbr) and module ='IN'
delete from INTRAN where batnbr in(@batnbr) 
delete from gltran where batnbr in(@batnbr) and module ='IN' 
*/


--delete from aradjust where adjbatnbr in('012913')


select opendoc,refnbr,*
--update ardoc set  opendoc=0,perpost ='201307' 
from ardoc where docbal =0 and opendoc =1  and perpost ='201307' 


select *from aradjust where adjdrefnbr in(
select refnbr from ardoc where batnbr in('017136') 
)
DISTINCT batnbr
select * from (
select batnbr,refnbr,acct,trantype,count(*) cant from artran where perpost ='201311'  and trantype ='PA'and batnbr in('017202')
group by batnbr,refnbr,acct,trantype
) X where cant > 1



select refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,*
--delete 
from gltran where batnbr in('016063') and module ='Ar' and trandesc =''
order by gltran.refnbr
select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,*
--delete 
from artran where batnbr in('034596')  and trandesc =''
order by artran.refnbr

013558    	302B020157
select shipperid,invcnbr,*
--update soshipheader set invcnbr ='C57-00419',user8='OD'
from newsh where invcnbr in('F350048694','F350048695','F350048697','F350048697','F350048696','F350048698','F350048699')-- and arbatnbr = ''

select shipperid,invcnbr,*
--update soshipheader set invcnbr ='C57-00419',user8='OD'
from soshipheader where invcnbr in('F160059871')-- and arbatnbr = ''
  
  
select CuryTaxTot00,crtd_user,refnbr,origdocamt,*
from ardoc where crtd_user like 'ECMARSAL%'
  
select CuryTaxTot00,*
--update ardoc set CuryTaxTot00='0'
from ardoc where refnbr in ('F760000018','B760000003')  
select *
--update artran set TranClass='N'
from artran where refnbr in ('F760000018','B760000003') --and acct in('701110','169801')

select *from ardoc where refnbr in ('F160057570','F160057101')  

B580128727	B580128742
select shipperid,invcnbr,termsid,CuryEffDate,*
--update soshipheader set CuryEffDate='2015-06-15 00:00:00'
from soshipheader where shipperid in('BCH0023887')

where  refnbr='B270000031'


DECLARE @REF CHAR(10)
SET @REF='181B086802'
select shipperid,invcnbr,billname,termsid,*from newsh where invcnbr in(@REF)
select shipperid,invcnbr,termsid,*from soshipheader where invcnbr in(@REF)
select batnbr,rlsed,perpost,refnbr,terms,curyorigDocAmt,origDocAmt,TaxTot00, txbltot00,custid,doctype,docdate,docbal,curydocbal,opendoc,perclosed,terms,*
from ardoc where  refnbr in (@REF)    --and doctype ='IN'
select rlsed,refnbr,perpost,curyTranAmt,TranAmt,custid,trantype,*
from artran where refnbr  in (@REF) 
order by artran.refnbr
select refnbr,perpost,curycramt, cramt, curydramt,dramt,trantype,rlsed,trandesc,*
from gltran where   refnbr in (@REF)  and module ='Ar' 
select *from refnbr where refnbr  in (@REF) 
select AdjAmt,CuryAdjdAmt,CuryAdjgAmt,* from aradjust where AdjdRefNbr in (@REF)  --and recordid ='168319'
select *from aradjust where AdjgRefNbr in (@REF) 
select *from PLCMInvcnbr where refnbr in (@REF) 
select *from PLCMInvcnbr where invcnbr in (@REF) 

--delete from refnbr where refnbr  in ('B240000773','451B000787') 


SELECT *FROM 



where refnbr '441B-01480'
45911329
select *
--delete 
from refnbr where refnbr not in (select refnbr from ardoc )

select AdjAmt,CuryAdjdAmt,CuryAdjgAmt,* from aradjust where AdjdRefNbr LIKE '%PAGIQU%'  --and recordid ='168319'
select *from aradjust where AdjgRefNbr LIKE '%PAGIQU%' 

select *from aradjust where CUSTID in ('20514347221') 

select refnbr,docbal,curydocbal,perclosed,perpost,*
--update ardoc set  docbal=0,curydocbal=0,perclosed='201510'
from ardoc where refnbr in (
select REPLACE(AdjdRefNbr,'451F','451B')
--update aradjust set AdjdRefNbr=REPLACE(AdjdRefNbr,'451F','451B')
from aradjust where AdjgRefNbr LIKE '%451B%' and AdjgDocType='CM'
)


select REPLACE(invcnbr,'441F','441B'),*
--update PLCMInvcnbr set invcnbr=REPLACE(invcnbr,'441F','441B')
from PLCMInvcnbr where refnbr LIKE '%441B%' and invcnbr like '%441F%'

select *from PLCMInvcnbr where invcnbr in ('451B000007') 

select x.custid,a.custid,*
--update x set custid='88888888'
from aradjust x inner join artran A on  x.AdjdRefNbr = A.refnbr 
where  AdjgRefNbr='666' x.custid='8888888' and a.custid ='88888888' 



009525    

select invcnbr,S4Future03,*from soshipheader where S4Future03<>0
select invcnbr,S4Future03,*from newsh where S4Future03<>0

update soshipheader set invcnbr='B66-94065' from soshipheader where invcnbr in('B660094065')

update soshipheader set CANCELLED='1' from soshipheader where invcnbr in('F580030131')

update soshipheader set termsid='07' from soshipheader where invcnbr in('F580030131')
update ardoc set terms='07' from ardoc where  refnbr in ('f160063714')   --and doctype ='IN'

select perpost,*from ardoc where refnbr ='031F002284'


select rlsed,refnbr,TranAmt,trantype,*
from intran where refnbr  in ('B580123321') order by batnbr

'080F000657','REVRPLUS08','O113175'

select *from PLCMInvcnbr where refnbr ='391B000006'
select *from PLCMInvcnbr where invcnbr ='391B000006' 

select *from artran where batnbr ='000005'
F350048695	F350048697


select refnbr,OrigDocAmt,* from ardoc where custid ='45873280'  --and perpost ='201407' and OrigDocAmt > 1000 and banksub like '%caar%'
select * from artran where custid ='45873280' 
select * from gltran where refnbr in('B130001273' ,'B130001224')


select refnbr,OrigDocAmt,* from ardoc where refnbr like '%006336'


select *
from ARTRAN where  refnbr IN ('041B065921','041B065929','041B065954','041B065982','041B065984','041B065986','041B065988','041F036310','041F036311','041F036312','041F036313','B050003821')
AND ACCT ='701110'

select *from refnbr where  refnbr like '%00000115%'
select *
'0240000170','0240000171','0240000172','0240000173','0240000174'

select *from aradjust where CustId ='40327864'

select *from gltran where id ='20209527929' and module ='AR'

0020005328
select *From customer where custid ='20563142881    '
select *From SoAddress where custid ='20563142881    '

select perclosed,perpost, rlsed,refnbr,curyorigDocAmt,origDocAmt,custid,doctype,docdate,docbal,curydocbal,opendoc,*
--update ardoc set  docbal =0 ,perclosed = perpost
--update ardoc set  curydocbal =0 
from ardoc where docbal =0 and curydocbal <>0 and  perclosed <>'' and refnbr='B41-84310' doctype <>'CM' and   and--and terms ='01'


update aradjust set AdjAmt= 22.68,CuryAdjdAmt= 22.68,CuryAdjgAmt=22.68
from aradjust where AdjdRefNbr ='B35-114520'

 and recordid ='189729'


select *from aradjust where AdjdRefNbr ='B35-114520'

  
update aradjust set  AdjAmt=132.23,CuryAdjdAmt =132.23 from aradjust where adjbatnbr ='012611' and AdjdRefNbr ='F590002612'


'005615',
select refnbr,docbal,doctype,*from ardoc where custid ='40168724'
'018835',

select rlsed,refnbr,curyTranAmt,TranAmt,custid,trantype,*
update artran set DrCr ='D' 
from artran where batnbr in('018837')  and acct ='121301'



select docdate,*from ardoc where batnbr not in(
select batnbr  from batch where  module ='AR'
) 

update artran set custid ='88888888' where  batnbr ='014360' and custid ='8888888'


select rlsed,refnbr,curyTranAmt,TranAmt,custid,recordid,*from artran where batnbr ='013773' and refnbr ='161F083943' and recordid in (326361,326362,329714)
delete from artran where batnbr ='013773' and refnbr ='161F083943' and recordid in (326361,326362,329714)

select refnbr,*from ardoc where refnbr like'%0038536%'

select custid,*from customer where custid in (select custid from ardoc where batnbr ='007948')

--update artran set acct ='401110' from artran where batnbr ='014837'and acct ='999999'
--update batch set  status='B',rlsed =0 from batch where batnbr in('017089') and module ='Ar'
--update batch set  status='U',rlsed =1 from batch where batnbr in('014837') and module ='Ar'
,ApplBatNbr=''
/*
update batch set  status='P',rlsed =1 from batch where batnbr in('001121') and module ='Ar'
update ardoc set  rlsed =1 from ardoc where batnbr ='000215' 
update artran set  rlsed =1  from artran where batnbr ='000215' 
update gltran set  rlsed =1,posted ='P' from gltran where batnbr in('001121') and module ='Ar'
*/

update artran set  curyTranAmt=638.61,TranAmt=638.61 from artran where batnbr ='006352' and refnbr ='34858' and acct ='101000'
update artran set  curyTranAmt=0,TranAmt=0 from artran where batnbr ='006352' and refnbr ='34858' and TranAmt = 0.1
update gltran set  curycramt=0,cramt=0 from gltran where batnbr ='006352'  and refnbr ='34858'  and acct ='101000' and cramt = 0.1
update gltran set  curyDramt=638.61,Dramt=638.61 from gltran where batnbr ='006352'  and refnbr ='34858'  and acct ='101000' and cramt = 0.1

select *From soshipheader where shipperid ='FDA0000719'



select *from 

select rlsed,*from ardoc where refnbr ='C35-106224'
select rlsed,*from ardoc where refnbr in('F540007362','02.04.13')


select rlsed,*from ardoc where refnbr like '%8111'

select *from artran where refnbr ='C41-18091'

/*
select *from  refnbr where refnbr in (select refnbr from ardoc where batnbr ='006200')

update ardoc set  bankacct ='131230' from ardoc where batnbr ='005525'


update batch set  perpost='201602' from batch where batnbr ='004097' and module ='Ar'
update ardoc set  rlsed =1,perpost='201602'from ardoc where batnbr ='004097'
update artran set rlsed =1,perpost='201602'  from artran where batnbr ='004097'
update gltran set rlsed =1,perpost='201602' from gltran where batnbr ='004097'  and module ='Ar'

update aradjust set  perAppl ='201304' from aradjust where adjbatnbr ='004353'

update ardoc set  rlsed =1,perclosed ='201304' from ardoc where refnbr ='F540007362' and batnbr ='000135' 


update artran set  curyTranAmt=0,TranAmt=0 from artran where batnbr ='021315' and refnbr ='0310143641' and acct ='401110'
update artran set  curyTranAmt=1975.85,TranAmt=1975.85 from artran where batnbr ='021315' and acct ='701110'
update artran set  curyTranAmt=317.73,TranAmt=317.73 from artran where batnbr ='021315' and acct ='741101'
update artran set  curyTranAmt=1955.38,TranAmt=1955.38 from artran where batnbr ='021315' and acct ='121301'

update gltran set  curycramt=0,cramt=0 from gltran where batnbr ='021315'  and refnbr ='0310143641'and acct ='401110'
update gltran set  curydramt=1955.38,dramt=1955.38 from gltran where batnbr ='021315'  and refnbr ='0310143641' and acct ='121301'
update aradjust set  AdjAmt=132.23,CuryAdjdAmt =132.23 from aradjust where adjbatnbr ='012611' and AdjdRefNbr ='F590002612'




select rlsed,CuryDepositAmt,CuryDrTot,DepositAmt,DrTot,status,*from batch where batnbr ='021317' and module ='Ar'
select rlsed,refnbr,curyorigDocAmt,origDocAmt,*from ardoc where batnbr ='021317' 
select rlsed,refnbr,curyTranAmt,TranAmt,*from artran where batnbr ='021317' --and acct ='401110'
select refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,*
from gltran where batnbr ='021317' and module ='Ar' order by gltran.refnbr
select *from aradjust where adjbatnbr ='021317'

--update batch set  CuryDepositAmt=2.3,CuryDrTot=2.3,DepositAmt=2.3,DrTot=2.3 from batch where batnbr ='021632' and module <>'Ar'

update batch set  CuryDepositAmt=638.61,CuryDrTot=638.61,DepositAmt=638.61,DrTot=638.61 from batch where batnbr ='006352' and module ='Ar'
update ardoc set  curyorigDocAmt=13.56,origDocAmt=13.56 from ardoc where batnbr ='021317' and refnbr ='0310143641'
update artran set  curyTranAmt=13.56,TranAmt=13.56 from artran where batnbr ='021317' and refnbr ='0310143641'
update gltran set  curycramt=13.56,cramt=13.56from gltran where batnbr ='021317' and refnbr ='0310143641' and acct ='121301'
update gltran set  curydramt=13.56,dramt=13.56 from gltran where batnbr ='021317' and refnbr ='0310143641' and acct ='101000'
update aradjust set  AdjAmt=13.56 from aradjust where adjbatnbr ='021317' and AdjdRefNbr ='0310143641'


select BATNBR,ACCT,REFNBR,CuryTranAmt,TRANAMT,DrCr , TRANTYPE,* from artran where TRANTYPE='CM'

select refnbr,curycramt, cramt, curydramt,dramt,trantype,* 
from gltran  where  module='ar'

select BATNBR,ACCT,sum(CuryTranAmt),sum(TRANAMT)
from artran where batnbr ='019304'  --and TRANTYPE='CM'
group by BATNBR,ACCT

select BATNBR,ACCT,sum(curycramt), sum(cramt),sum( curydramt),sum(dramt)
from gltran  where batnbr ='019304' and module='ar' --and TRANTYPE='CM'
group by BATNBR,ACCT

select BATNBR,ACCT,TRANTYPE,REFNBR,sum(CuryTranAmt),sum(TRANAMT)
from artran where batnbr ='019304'  and TRANTYPE='CM'
group by BATNBR,ACCT,TRANTYPE,REFNBR

select BATNBR,ACCT,TRANTYPE,REFNBR,sum(curycramt), sum(cramt),sum( curydramt),sum(dramt)
from gltran  where batnbr ='019304' and module='ar' and TRANTYPE='CM'
group by BATNBR,ACCT,TRANTYPE,REFNBR

select *from ardoc where refnbr ='B320641429' 
select *from artran where refnbr ='B320641429' 

select BATNBR,ACCT,REFNBR,CuryTranAmt,TRANAMT,DrCr , TRANTYPE,* 
from artran where TRANTYPE='CM' and refnbr ='C370000303' 

select refnbr,curycramt, cramt, curydramt,dramt,trantype,rlsed,*
from gltran where batnbr ='019304' and refnbr ='C370000303' and module ='Ar' order by gltran.refnbr


update batch set  rlsed=0 ,status='B' from batch where batnbr ='021382' and module ='Ar'
update ardoc set  rlsed=0 from ardoc where batnbr ='020852' 
update artran set  rlsed=0 from artran where batnbr ='020852' 
update batch set  rlsed=1 from gltran where batnbr ='020362' and module ='Ar'
*/