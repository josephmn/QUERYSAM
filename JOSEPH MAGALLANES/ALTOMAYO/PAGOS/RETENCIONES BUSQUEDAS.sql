--- S4Future11
--1. CARTA
--2. COMPENSACION
--3. DETRACCION
--4. RETENCION
--5. TRANSFERENCIA


SELECT S4Future12, InvcNbr, DocBal, CuryDocBal, OrigDocAmt, CuryOrigDocAmt, * FROM APDoc WHERE RefNbr = '006046' --FACTURA ORIGEN

SELECT * FROM APDoc where doctype = 'HC' AND S4Future11 = 4 and RefNbr = '000316' --RETENCION / CHEQUE CABECERA / S4Future11 = 4 (VER RETENCION)

SELECT AdjdRefNbr, AdjgRefNbr, * FROM APAdjust WHERE AdjBatNbr = '006791' --RETENCION / DETALLE DEL CHEQUE

select * from apadjust where AdjdRefNbr   ='006062' order by AdjBatNbr asc

/************** FILTRAR MOVIMIENTOS POR NRO DE DOC. (REFNBR) ***************/

SELECT * FROM APAdjust  WHERE AdjdRefNbr = '006062' ORDER BY AdjBatNbr

--00000737
--006791                    

SELECT S4Future12, InvcNbr, DocBal, CuryDocBal, OrigDocAmt, CuryOrigDocAmt, * FROM APDoc WHERE InvcNbr = '0000000737' --FACTURA ORIGEN

-- update APDoc set DocDate = '2018-07-17' where InvcNbr = '0000000737' --and 


/************** CORREGIR IGV *************/

--3.275 

corregirtipocambio_ap 'DOL','006797' , '3.291'



SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='006797'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,S4Future12,* FROM APDOC  where batnbr ='006797'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,sub,* FROM APTRAN  where batnbr ='006797'
SELECT * from apadjust where adjbatnbr ='006797'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='006797'  
SELECT AdjAmt, * from apadjust where adjbatnbr ='006797'
select * from xapdettran where batnbr ='006797'




--UPDATE batch SET STATUS  ='B' WHERE BATNBR ='017815' AND MODULE ='ap'

--delete from aptran where batnbr ='017815' and cpnyid =''



-- sp_helptext 'corregirtipocambio_ap'
/*
CREATE PROC CORREGIRTIPOCAMBIO_AP
@curyid char(3),
 @lote char (6),
 @tc float
AS

--declare @lote char (6)
--declare @tc float
set @tc =@tc set @lote =@lote
update batch set curyid = @curyid ,  CuryRate= @tc  from batch where batnbr=@lote and module ='AP'
update apdoc set  curyid = @curyid , CuryRate= @tc from apdoc where batnbr=@lote
update aptran set  curyid = @curyid , CuryRate= @tc  from aptran where batnbr=@lote
update gltran set  curyid = @curyid , CuryRate= @tc  from gltran where batnbr=@lote and module ='AP'
update apadjust set CuryAdjdRate= @tc from apadjust where AdjBatNbr=@lote

update batch set  CrTot= round(CuryCrTot * CuryRate,2),  CtrlTot= round(CuryCtrlTot * CuryRate,2),DrTot= round(CuryDrTot * CuryRate,2) from batch where batnbr=@lote and module ='ap'
update apdoc set TaxTot00=round(CuryTaxTot00*  CuryRate,2),TxblTot00= round(CuryTxblTot00 * CuryRate,2), OrigDocAmt = round(CuryOrigDocAmt * CuryRate,2),docbal = round(curydocbal * CuryRate,2) from apdoc where batnbr=@lote
update aptran set TranAmt=round(CuryTranAmt * CuryRate,2) from aptran where  batnbr=@lote --and acct ='141301' 
update aptran set TaxAmt00=round(CuryTaxAmt00* CuryRate,2) ,TxblAmt00=round(CuryTxblAmt00 * CuryRate,2) --,CuryTxblAmt00=TxblAmt00 * CuryRate 
From aptran where  batnbr=@lote --and acct ='955201'
update gltran set DrAmt=round(CuryDrAmt * CuryRate,2) from gltran where  batnbr=@lote  and module ='AP' --and acct ='955201'
update gltran set CrAmt=round(CuryCrAmt * CuryRate,2) from gltran where  batnbr=@lote  and module ='AP' 
update xapdettran set TaxAmt=round(CuryTaxAmt * @tc,2),OrigDocAmt= round(CuryOrigDocAmt * @tc,2), user4 = round(user3 * @tc,2)
where batnbr=@lote
update apadjust set  AdjAmt= CuryAdjdAmt*CuryAdjdRate from apadjust where AdjBatNbr=@lote
*/
