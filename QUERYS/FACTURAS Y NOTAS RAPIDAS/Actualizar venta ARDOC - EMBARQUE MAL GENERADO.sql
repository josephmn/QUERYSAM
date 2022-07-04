
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='003049' -- LOTE 
--set @refnbr ='B660112141' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,* from ardoc c where batnbr= @batnbr -- and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr -- and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr --and adjdrefnbr =@refnbr
go

8593.03

160.85
 select invcnbr,shipperid,*  from soshipheader where invcnbr in('B660112141')

--CORREGIR EN GLTRAN
/*

select batnbr,refnbr,* from gltran where batnbr ='003015' and   module ='ar' and  acct ='975101' 

delete from gltran where batnbr   ='003015' and module ='ar' and refnbr  ='B660112141' and acct ='975101' 
update gltran set dramt = 160.85 , curydramt = 160.85  where batnbr   ='003015' and module ='ar' and refnbr  = 'B660112141'  and acct ='121301' 
*/

--CORREGIR EN ARTRAN 
/*
delete from artran where batnbr ='003015' and refnbr ='B660112141'  and acct ='975101'  
*/
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
FROM ARTRAN WHERE BATNBR='003015' and acct  not IN ('131230','121301','149101','141101') --and drcr ='C'
group by custid,batnbr,refnbr
) t on ardoc.batnbr = t.batnbr and ardoc.refnbr = t.refnbr
WHERE ardoc.BATNBR='003015' --and t.refnbr in('351F906809','351F906812')
and ardoc.refnbr   in  (
select refnbr from ardoc where doctype ='in'
union all
select AdjdRefNbr  from aradjust 
union all
select AdjgRefNbr from aradjust 
)
and ardoc.refnbr  ='F160068219'


'( TERCERO ) ACTUALIZA BATCH DESDE ARDOC'
select BATCH.CrTot,BATCH.CtrlTot, BATCH.CuryCrTot, BATCH.CuryCtrlTot, D.CuryOrigDocAmt,D.OrigDocAmt,CuryDepositAmt,DepositAmt,*
-- UPDATE BATCH SET  CrTot=CONVERT(DEC(28,2),D.OrigDocAmt), CtrlTot=CONVERT(DEC(28,2),D.OrigDocAmt), CuryCrTot= CONVERT(DEC(28,2),D.CuryOrigDocAmt), CuryCtrlTot= CONVERT(DEC(28,2),D.CuryOrigDocAmt),CuryDrTot=CONVERT(DEC(28,2),D.OrigDocAmt),DrTot=CONVERT(DEC(28,2),D.OrigDocAmt),CuryDepositAmt=CONVERT(DEC(28,2),D.OrigDocAmt), DepositAmt =CONVERT(DEC(28,2),D.OrigDocAmt)
from BATCH INNER JOIN 
(SELECT  BATNBR, CONVERT(DEC(28,2),sum(CuryOrigDocAmt)) AS CuryOrigDocAmt,CONVERT(DEC(28,2),sum(OrigDocAmt) ) AS OrigDocAmt, CONVERT(DEC(28,2),sum(CuryDocBal)) AS CuryDocBal,CONVERT(DEC(28,2),sum(DocBal)) AS DocBal
FROM ARDOC WHERE BATNBR='003015'
GROUP BY BATNBR
) D ON BATCH.BATNBR= D.BATNBR 
where BATCH.batnbr='003015'  and BATCH.MODULE='AR'




update ardoc set SlsperId  ='655' where BatNbr  ='004444'





