

SELECT NAME, SlsperId, * FROM Salesperson WHERE Name LIKE '%RAMOS%' 

-- 785

-- LUIS ANGEL RAMON ROJAS 

-- 738


SELECT NAME, SlsperId, * FROM Salesperson WHERE SlsperId = '707' -- LIKE '%RAMOS%' 

SELECT NAME, SlsperId, * FROM Salesperson WHERE SlsperId = '785' --Name LIKE '%RAMOS%' 



SELECT INVCDATE, ARBatNbr, INBatNbr, SlsperID, Cancelled, InvcNbr, * 
-- update t set slsperid = '048'
FROM SOShipHeader t WHERE SlsperID = '048' AND PerPost >= '202205' --InvcDate > = '2018-08-01' --and ARBatNbr = '007204' -- AND Cancelled = 0 
--554

SELECT DISTINCT ARBatNbr 
FROM SOShipHeader WHERE SlsperID = '707' AND InvcDate > = '2018-08-01' AND Cancelled = 0


--SELECT RefNbr,* FROM ARDoc WHERE RefNbr IN (SELECT InvcNbr FROM SOShipHeader WHERE SlsperID = '707' AND InvcDate > = '2018-08-01')


declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='007257' -- LOTE 
--set @refnbr ='F030013476' --DOCUMENTO
--SELECT perpost,STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'AR'

select perpost,batnbr,docdate,docbal,curydocbal,refnbr,doctype,custid,rlsed,taxid00,applbatnbr,terms,slsperid,* 
--UPDATE C SET SLSPERID = '785'
from ardoc c where batnbr= @batnbr AND SlsperId = '707' --and refnbr = @refnbr

select perpost,rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc, SlsperId, * 
--UPDATE C SET SLSPERID = '785'
from artran c where batnbr= @batnbr  AND SlsperId = '707'
--and refnbr like @refnbr 
--select  *from catran where batnbr =@batnbr
--select perpost,rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran g
--where batnbr = @batnbr and module = 'AR' --and refnbr like @refnbr 
--select * from aradjust where adjbatnbr = @batnbr --and adjdrefnbr =@refnbr
--go


select * 
-- update ardoc set SlsperId = '048'
from ardoc where RefNbr in (
SELECT InvcNbr FROM SOShipHeader t WHERE SlsperID = '048' AND PerPost >= '202205'
) and SlsperId = '973'

select * 
-- update ARTran set SlsperId = '048'
from ARTran where RefNbr in (
SELECT InvcNbr FROM SOShipHeader t WHERE SlsperID = '048' AND PerPost >= '202205'
) and SlsperId = '973'


