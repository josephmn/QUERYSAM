sp_helptext pa_liberarconError2

sp_helptext pa_liberarconError2
CREATE proc pa_liberarconError2      
@lote chAR (6)      
as      
BEGIN      
      
      
declare @doctype char(2)      
set @doctype = isnull((select distinct doctype from ardoc where batnbr =@lote),'')      
      
if @doctype ='PA'      
BEGIN      
 --select ardoc.refnbr, ardoc.curyorigdocamt, t.CuryTranAmt,ardoc.DocBal,CONVERT(DEC(28,2),ardoc.curyorigdocamt - t.CuryTranAmt) as dif      
 update ardoc set  CuryOrigDocAmt=CONVERT(DEC(28,2),t.CuryTranAmt), OrigDocAmt=CONVERT(DEC(28,2),t.TranAmt) , CuryDocBal= CONVERT(DEC(28,2),t.CuryTranAmt),DocBal=CONVERT(DEC(28,2),t.TranAmt),OpenDoc=1,PerClosed=''      
 --update ardoc set  CuryOrigDocAmt=CONVERT(DEC(28,2),t.CuryTranAmt), OrigDocAmt=CONVERT(DEC(28,2),t.TranAmt) , CuryDocBal= 0,DocBal=0      
 --update ardoc set  CuryDocBal= 14.38,DocBal=14.38      
 from ardoc inner join (      
 --SELECT batnbr,refnbr,CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D' and trantype<>'CM' THEN  (curyTranAmt + CuryTaxAmt00)*(-1) ELSE curyTranAmt + CuryTaxAmt00 END)) as CuryTranAmt, CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D'  and trantype<>'CM' THEN  (TranA
mt + CuryTaxAmt00)*(-1) ELSE TranAmt + CuryTaxAmt00 END) )  as TranAmt      
   
 SELECT top 1  R.BATNBR,R.REFNBR,R.CuryTranAmt,R.TranAmt  
 FROM(  
 SELECT batnbr,refnbr,CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D' and trantype<>'CM' THEN  (curyTranAmt )*(-1) ELSE curyTranAmt  END)) as CuryTranAmt, CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D'  and trantype<>'CM' THEN  (TranAmt )*(-1) ELSE TranAmt  END) )
         
  as TranAmt      
 FROM ARTRAN WHERE BATNBR=@lote and acct  IN ('131230','121301')      
 group by batnbr,refnbr   
 )R      
 ) t on ardoc.batnbr=t.batnbr and ardoc.refnbr =t.refnbr      
 WHERE ardoc.BATNBR=@lote      
      
      
--select rlsed,BATNBR,REFNBR,CuryTranAmt,TRANAMT,(CuryTranAmt - TRANAMT),DrCr , TRANTYPE,acct,*      
--from arTRAN       
--delete arTRAN       
--where BATNBR =@lote AND ACCT  IN ('101000') and rlsed ='1'      
      
      
      
END      
ELSE      
BEGIN      
      
 --select ardoc.refnbr, ardoc.curyorigdocamt, t.CuryTranAmt,ardoc.DocBal,CONVERT(DEC(28,2),ardoc.curyorigdocamt - t.CuryTranAmt) as dif      
 update ardoc set  CuryOrigDocAmt=CONVERT(DEC(28,2),t.CuryTranAmt), OrigDocAmt=CONVERT(DEC(28,2),t.TranAmt) , CuryDocBal= CONVERT(DEC(28,2),t.CuryTranAmt),DocBal=CONVERT(DEC(28,2),t.TranAmt),OpenDoc=1,PerClosed=''      
 --update ardoc set  CuryOrigDocAmt=CONVERT(DEC(28,2),t.CuryTranAmt), OrigDocAmt=CONVERT(DEC(28,2),t.TranAmt) , CuryDocBal= 0,DocBal=0      
 --update ardoc set  CuryDocBal= 14.38,DocBal=14.38      
 from ardoc inner join (      
 --SELECT batnbr,refnbr,CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D' and trantype<>'CM' THEN  (curyTranAmt + CuryTaxAmt00)*(-1) ELSE curyTranAmt + CuryTaxAmt00 END)) as CuryTranAmt, CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D'  and trantype<>'CM' THEN  (TranA
mt + CuryTaxAmt00)*(-1) ELSE TranAmt + CuryTaxAmt00 END) )  as TranAmt      
   
 select top 1 R.BATNBR,R.REFNBR,R.CuryTranAmt,R.TranAmt  
 from (  
 SELECT batnbr,refnbr,CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D' and trantype<>'CM' THEN  (curyTranAmt )*(-1) ELSE curyTranAmt  END)) as CuryTranAmt, CONVERT(DEC(28,2),sum(CASE WHEN DrCr = 'D'  and trantype<>'CM' THEN  (TranAmt )*(-1) ELSE TranAmt  END) )
  
    
          
 as TranAmt      
 FROM ARTRAN WHERE BATNBR=@lote and acct NOT IN ('131230','121301')      
 group by batnbr,refnbr      
 )R  
   
   
 ) t on ardoc.batnbr=t.batnbr and ardoc.refnbr =t.refnbr      
 WHERE ardoc.BATNBR=@lote      
      
 delete WrkRelease where batnbr = @LOTE      
      
      
 delete HistDocSlsTax where refnbr in (select refnbr from ardoc where batnbr =@LOTE)      
       
END      
      
--select BATCH.CrTot,BATCH.CtrlTot, BATCH.CuryCrTot, BATCH.CuryCtrlTot, D.CuryOrigDocAmt,D.OrigDocAmt,*      
UPDATE BATCH SET  CrTot=CONVERT(DEC(28,2),D.OrigDocAmt), CtrlTot=CONVERT(DEC(28,2),D.OrigDocAmt), CuryCrTot= CONVERT(DEC(28,2),D.CuryOrigDocAmt), CuryCtrlTot= CONVERT(DEC(28,2),D.CuryOrigDocAmt)      
from BATCH INNER JOIN       
(      
SELECT  BATNBR, CONVERT(DEC(28,2),sum(CuryOrigDocAmt)) AS CuryOrigDocAmt,CONVERT(DEC(28,2),sum(OrigDocAmt) ) AS OrigDocAmt, CONVERT(DEC(28,2),sum(CuryDocBal)) AS CuryDocBal,CONVERT(DEC(28,2),sum(DocBal)) AS DocBal      
FROM ARDOC       
WHERE BATNBR= @lote      
GROUP BY BATNBR      
) D ON BATCH.BATNBR= D.BATNBR       
where BATCH.batnbr= @lote  and BATCH.MODULE='AR'      
      
      
      
--declare @lote chAR (6)      
      
--seT @LOTE ='014424'      
seT @LOTE = @lote      
      
--if ( select count (*)from gltran where batnbr =@LOTE and module ='Ar' )=0       
--begin      
      
-- delete arTRAN where BATNBR =@LOTE AND ACCT  IN ('121301','12110','131230')      
      
 --delete WrkRelease where batnbr = @LOTE      
      
      
 --delete HistDocSlsTax where refnbr in (select refnbr from ardoc where batnbr =@LOTE)      
      
--end      
      
END 