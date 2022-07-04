----------------------------------------------------------------
----------- ELIMINAR DOCUMENTO PARA SER REINGRESADO ------------
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='012230' -- LOTE 
--set @refnbr ='331F004295' -- DOCUMENTO
SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'
select perpost,batnbr,docbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,* from ardoc c where batnbr= @batnbr--  and refnbr = @refnbr
select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran c
where batnbr= @batnbr  --and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
select * from aradjust where adjbatnbr =@batnbr and adjdrefnbr =@refnbr
select * from cf_regvtas where exportadofn =@batnbr --and referenciafn =@refnbr
SELECT numero,BASEAFECTA,IGV ,TOTALMN,TOTALME, SALDO
FROM  [192.168.10.93].SGRP2016.VEN.VENTA where numero like '%'+right(@refnbr,6)
go



----------------ACTUALIZAR PARA REINGRESAR --------------------------------------------------------------
UPDATE CF_REGVTAS SET C1 ='AFECTIVO',USER06 ='' WHERE REFERENCIAFN IN(
select  referenciafn from cf_regvtas where C1 ='CREDITO' AND USER06 ='NOPAGO' AND MONTH(FECHANEGOCIO) =1
AND TIPODOC  ='12' and exportadopa =''
)


declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='011152' -- LOTE 
set @refnbr ='331F004295' -- DOCUMENTO
DELETE FROM ARDOC WHERE BATNBR =@batnbr AND REFNBR =@refnbr
DELETE FROM ARTRAN WHERE BATNBR =@batnbr AND REFNBR =@refnbr
DELETE FROM GLTRAN WHERE BATNBR =@batnbr AND   MODULE ='AR' AND REFNBR =@refnbr
DELETE FROM REFNBR WHERE REFNBR =@refnbr
DELETE FROM CF_REGVTAS WHERE EXPORTADOFN = @batnbr AND REFERENCIAFN =@refnbr
--ACTUALIZAR BATCH DESDE ARDOC 
select BATCH.CrTot,BATCH.CtrlTot, BATCH.CuryCrTot, BATCH.CuryCtrlTot, D.CuryOrigDocAmt,D.OrigDocAmt,CuryDepositAmt,DepositAmt,*
--UPDATE BATCH SET  CrTot=CONVERT(DEC(28,2),D.OrigDocAmt), CtrlTot=CONVERT(DEC(28,2),D.OrigDocAmt), CuryCrTot= CONVERT(DEC(28,2),D.CuryOrigDocAmt), CuryCtrlTot= CONVERT(DEC(28,2),D.CuryOrigDocAmt),CuryDrTot=CONVERT(DEC(28,2),D.OrigDocAmt),DrTot=CONVERT(DEC(28,2),D.OrigDocAmt),CuryDepositAmt=CONVERT(DEC(28,2),D.OrigDocAmt), DepositAmt =CONVERT(DEC(28,2),D.OrigDocAmt)
from BATCH INNER JOIN 
(SELECT  BATNBR, CONVERT(DEC(28,2),sum(CuryOrigDocAmt)) AS CuryOrigDocAmt,CONVERT(DEC(28,2),sum(OrigDocAmt) ) AS OrigDocAmt, CONVERT(DEC(28,2),sum(CuryDocBal)) AS CuryDocBal,CONVERT(DEC(28,2),sum(DocBal)) AS DocBal
FROM ARDOC WHERE BATNBR=@batnbr
GROUP BY BATNBR
) D ON BATCH.BATNBR= D.BATNBR 
where BATCH.batnbr=@batnbr  and BATCH.MODULE='AR'




SELECT REFNBR,* FROM ARDOC WHERE REFNBR   like '331F%' AND doctype ='IN'
and refnbr in (select refnbr from ardoc where doctype ='PA')
----------------------------------------------------------------



























