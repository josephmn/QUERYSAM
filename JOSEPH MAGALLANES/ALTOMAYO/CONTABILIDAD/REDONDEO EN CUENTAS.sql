
select Acct, BatNbr, RefNbr, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, * from GLTran where RefNbr = 'B140063645' and Acct = '121301' and TranType = 'IN' and Module = 'AR'  --121301

select Acct, BatNbr, RefNbr, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, * from GLTran where RefNbr = 'B140063645' and Acct = '701110' and TranType = 'IN' and Module = 'AR'  --701110

select Acct, BatNbr, RefNbr, CrAmt, CuryCrAmt, CuryDrAmt, DrAmt, * from GLTran where RefNbr = 'B140063645' and Acct = '401110' and TranType = 'IN' and Module = 'AR'  --401110

--select BankAcct, BatNbr, RefNbr, DocDate, CuryOrigDocAmt, OrigDocAmt, * from Ardoc where RefNbr = 'B140063903' and PerPost = '201804'  and DocType = 'IN'

--select Acct, BatNbr, RefNbr, CuryTranAmt, TranAmt, TranType, TranDesc, * from ARTran where RefNbr = 'B140063903' and Acct = '121301' and TranType = 'IN'


--SUCULENTO REDONDEO
DECLARE
@REFNBR CHAR(10),
@MONTO_ORIGINAL FLOAT,
@MONTO_IGV FLOAT

SET @REFNBR = 'F140008649'
SET @MONTO_ORIGINAL = (select DrAmt from GLTran where RefNbr = @REFNBR and Acct = '121301' and TranType = 'IN' and Module = 'AR')


--UPDATE GLTran
--SET CrAmt = round((@MONTO_ORIGINAL/1.18),2), CuryCrAmt = round((@MONTO_ORIGINAL/1.18),2)
--WHERE RefNbr = @REFNBR and Acct = '701110' and TranType = 'IN' and Module = 'AR'

--SET @MONTO_IGV = ROUND(round((@MONTO_ORIGINAL/1.18),2)*0.18,2)
 
--UPDATE GLTran
--SET CrAmt = @MONTO_IGV, CuryCrAmt = @MONTO_IGV
--WHERE RefNbr = @REFNBR and Acct = '401110' and TranType = 'IN' and Module = 'AR'

/******/
--select * from XVR_Sales_Report2009 where PerPost  ='201804' and TipoDoc in (01,03,07,08,12,29)

