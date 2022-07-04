use [ca2015app]
go


corregirtipocambio_ap '025213' , 3.396



SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='025212'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,S4Future12,* FROM APDOC  where batnbr ='025212'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,sub,* FROM APTRAN  where batnbr ='025212'
SELECT * from apadjust where adjbatnbr ='025212'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='025212'  
SELECT * from apadjust where adjbatnbr ='025212'
select * from xapdettran where batnbr ='025212'




UPDATE batch SET STATUS  ='B' WHERE BATNBR ='017815' AND MODULE ='ap'




delete from aptran where batnbr ='017815' and cpnyid =''



sp_helptext 'corregirtipocambio_ap'
CREATE PROC CORREGIRTIPOCAMBIO_AP  
 @lote char (6),  
 @tc float  
AS  
  
--declare @lote char (6)  
--declare @tc float  
set @tc =@tc set @lote =@lote  
update batch set  CuryRate= @tc  from batch where batnbr=@lote and module ='AP'  
update apdoc set  CuryRate= @tc from apdoc where batnbr=@lote  
update aptran set  CuryRate= @tc  from aptran where batnbr=@lote  
update gltran set  CuryRate= @tc  from gltran where batnbr=@lote and module ='AP'  
update apadjust set CuryAdjdRate= @tc from apadjust where AdjBatNbr=@lote  
  
update batch set  CrTot= round(CuryCrTot * CuryRate,2),  CtrlTot= round(CuryCtrlTot * CuryRate,2),DrTot= round(CuryDrTot * CuryRate,2) from batch where batnbr=@lote and module ='ap'  
update apdoc set TaxTot00=round(CuryTaxTot00*  CuryRate,2),TxblTot00= round(CuryTxblTot00 * CuryRate,2), OrigDocAmt = round(CuryOrigDocAmt * CuryRate,2),  
 docbal = round(curydocbal * CuryRate,2)  
 from apdoc where batnbr=@lote  
update aptran set TranAmt=round(CuryTranAmt * CuryRate,2) from aptran where  batnbr=@lote --and acct ='141301'   
update aptran set TaxAmt00=round(CuryTaxAmt00* CuryRate,2) ,TxblAmt00=round(CuryTranAmt * CuryRate,2) --,CuryTxblAmt00=TxblAmt00 * CuryRate   
From aptran where  batnbr=@lote --and acct ='955201'  
update gltran set DrAmt=round(CuryDrAmt * CuryRate,2) from gltran where  batnbr=@lote  and module ='AP' --and acct ='955201'  
update gltran set CrAmt=round(CuryCrAmt * CuryRate,2) from gltran where  batnbr=@lote  and module ='AP'   
update xapdettran set TaxAmt=round(CuryTaxAmt * @tc,2),OrigDocAmt= round(CuryOrigDocAmt * @tc,2), user4 = round(user3 * @tc,2)  
where batnbr=@lote  
update apadjust set  AdjAmt= CuryAdjdAmt*CuryAdjdRate from apadjust where AdjBatNbr=@lote  
  