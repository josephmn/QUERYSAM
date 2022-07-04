/*************** DOCUMENTOS Y AJUSTES *********************/ --COMPRAS CUSCO

DECLARE @BATNBR VARCHAR(6)
DECLARE @REF CHAR(6)

SET @BATNBR = '003281'
--SET @REF = '000779'
--5142.2
--925.6
SELECT 'TABLA BATCH', Rlsed, Status, CrTot, CtrlTot, CuryCrTot, CuryCtrlTot, CuryId, CuryRate, DrTot, * from Batch where BatNbr = @BATNBR and Module = 'AP'

select 'TABLA APDOC', Rlsed, CuryOrigDocAmt, CuryDocBal, CuryTaxTot00, 
CuryTxblTot00, DocBal, OrigDocAmt, TaxTot00, TxblTot00, 
CuryId, CuryRate, CuryMultDiv, CuryRateType, DocType, VendId, user6, RefNbr, S4Future04, S4Future12, * from APDoc where BatNbr = @BATNBR --and RefNbr = @REF

select 'APTRAN', Rlsed, Acct, user5, User6, LineId, CuryTranAmt, TxblAmt00, TaxId00, TranAmt, (CASE WHEN TaxId00 = 'IGV1' THEN ROUND((CuryTranAmt*0.18),2) ELSE 0 END) IGV2, Curyrate, TaxAmt00, CuryTxblAmt00, CuryTaxAmt00, CuryTaxAmt01,CuryTaxAmt02, CuryTaxAmt03
JrnlType, TaxCat, VendId, user6, * from aptran a where BatNbr = @BATNBR --and  user6 IN ('AFEC1')--and RefNbr = @REF
--and TaxCat = 'AFECTO' --and acct = '603101' --601101
order by a.user5

select 'TOTALES APTRAN', SUM(CuryTranAmt) CuryTranAmt, SUM(TxblAmt00) TxblAmt00, SUM(TranAmt) TranAmt, SUM(TaxAmt00) TaxAmt00, 
SUM(CuryTxblAmt00) CuryTxblAmt00, SUM(CuryTaxAmt00) CuryTaxAmt00, (SUM(CuryTranAmt)+SUM(TaxAmt00)) TOTAL_SOL, (SUM(CuryTxblAmt00) + SUM(CuryTaxAmt00)) TOTAL_DOL
from aptran where BatNbr = @BATNBR --and TaxCat = 'AFECTO' --and acct = '603101' --601101
and user6 IN ('AFEC1','AFEC3') --and RefNbr = @REF

/**** PARA APTRAN EN ALTOMAYO ***/
select LineId, user5, CuryTranAmt, TxblAmt00, TaxId00, TranAmt, TaxAmt00, CuryTxblAmt00, CuryTaxAmt00, CuryTaxAmt01,CuryTaxAmt02, CuryTaxAmt03, *
-- UPDATE ap SET CuryTaxAmt00 = '18.31', TaxAmt00 = '18.31' 
-- UPDATE ap SET TxblAmt00 = '31867.86', CuryTxblAmt00 = '31867.86'
-- UPDATE ap SET TaxAmt00 = '8.64', CuryTaxAmt00 = '8.64'
-- update ap set user5 = '5'
-- UPDATE AP SET TaxAmt00 = '2.13', CuryTaxAmt00 = '2.13'
from aptran ap WHERE BatNbr = '000343' and LineId in (94) and CuryTranAmt = 101.69
--and CurytranAmt = '31867.86'
--and user5 in (7) --1
--and TaxAmt00 = '1.53'
--27.46
select * 
-- update s set curytaxamt = '1.53', taxamt = '1.53'  ---> IGV
-- update s set CuryOrigDocAmt = '8.47', OrigDocAmt = '8.47'  -- monto original
from xApDetTran s where BatNbr = '000475' --and NroDoc in ('1100015897','1100015874') --and Ruc = '20135414931' 
-- and CuryOrigDocAmt = '8.47'
--and CuryTaxAmt = '1.53'

--commit
/*
/****** PARA MONTO ******/
DECLARE @MONTO1 FLOAT
DECLARE @ANTIGUO1 FLOAT
DECLARE @BATN CHAR(6)

SET @BATN = '001271'
SET @MONTO1 = '16.46' --A CAMBIAR
SET @ANTIGUO1 = '16.47' -- ORIGINAL

begin tran
UPDATE aptran
SET 
CuryTranAmt = @MONTO1,
TxblAmt00 = @MONTO1,
TranAmt = @MONTO1,
CuryTxblAmt00 = @MONTO1 WHERE BatNbr = @BATN and user6 = 'AFEC1' AND TranAmt = @ANTIGUO1 and LineId = '2'

--COMMIT

/***** PARA IGV ********/
DECLARE @MONTO2 FLOAT
DECLARE @ANTIGUO2 FLOAT
DECLARE @BATNB CHAR(6)

SET @BATNB = '001271'
SET @MONTO2 = '2.39' --A CAMBIAR
SET @ANTIGUO2 = '2.37' --ORIGINAL
begin tran
UPDATE aptran
SET 
TaxAmt00 = @MONTO2,
CuryTaxAmt00 = @MONTO2 WHERE BatNbr = @BATNB and user6 = 'AFEC1' AND TaxAmt00 = @ANTIGUO2 and LineId = '1'


/**** PARA APTRAN ****/

DECLARE @BATNBR1 VARCHAR(6)
DECLARE @MONTO_TOTAL FLOAT
DECLARE @IGV_TOTAL FLOAT, @SUBTOTAL FLOAT, @IGVV FLOAT

SET @BATNBR1 = '000936' --COLOCAR EL BATNBR
SET @MONTO_TOTAL = (select SUM(CuryTxblAmt00) CuryTxblAmt00 from aptran where BatNbr = @BATNBR1 and user6 = 'AFEC1')
SET @IGV_TOTAL = (select SUM(CuryTaxAmt00) CuryTaxAmt00 from aptran where BatNbr = @BATNBR1 and user6 = 'AFEC1')

SET @SUBTOTAL = (select sum(tranAmt) tranAmt from aptran where BatNbr = @BATNBR1 and user6 IN ('AFEC1','AFEC2'))

SET @IGVV = (select sum(taxamt00) taxamt00 from aptran where BatNbr = @BATNBR1 and user6 IN ('AFEC1','AFEC2'))

BEGIN TRAN
update APDoc
set
--MONTO SUB TOTAL
CuryTxblTot00 = @MONTO_TOTAL,
TxblTot00 = @MONTO_TOTAL,
--IGV
CuryTaxTot00 = @IGV_TOTAL,
TaxTot00 = @IGV_TOTAL, 
--MONTO TOTAL TOTAL
CuryOrigDocAmt = @SUBTOTAL + @IGVV,
OrigDocAmt = @SUBTOTAL + @IGVV
WHERE BatNbr = @BATNBR1
--COMMIT
--ROLLBACK TRAN
*/

/******* MONTO EN EL BATCH ********/

DECLARE @BATNBRR VARCHAR(6)
DECLARE @REFG CHAR(6),
@MONTO_TOTbat FLOAT, @IGV_TOTbat FLOAT,
@MONTO_ANT FLOAT, @MONT_ANT FLOAT

SET @BATNBRR = '001450'

SET @MONTO_TOTbat = (select sum(tranAmt) tranAmt from aptran where BatNbr = @BATNBRR and user6 IN ('AFEC1','AFEC2'))
SET @IGV_TOTbat = (select sum(taxamt00) taxamt00 from aptran where BatNbr = @BATNBRR and user6 IN ('AFEC1','AFEC2'))
SET @MONTO_ANT = (SELECT CuryCtrlTot FROM Batch WHERE BatNbr = @BATNBRR AND Module = 'AP')
SET @MONT_ANT = (SELECT CuryDrTot FROM Batch WHERE BatNbr = @BATNBRR AND Module = 'AP')

PRINT @MONTO_TOTbat + @IGV_TOTbat
PRINT @MONTO_ANT
PRINT @MONT_ANT
/*
UPDATE Batch
SET
CrTot = @MONTO_TOTbat + @IGV_TOTbat,
CtrlTot	= @MONTO_TOTbat + @IGV_TOTbat,
CuryCrTot =	@MONTO_TOTbat + @IGV_TOTbat,
CuryCtrlTot = @MONTO_TOTbat + @IGV_TOTbat,
CuryDrTot = @MONTO_TOTbat + @IGV_TOTbat,
DrTot = @MONTO_TOTbat + @IGV_TOTbat
WHERE BatNbr = @BATNBRR AND Module = 'AP'
*/
SELECT 'TABLA BATCH', CrTot, CtrlTot, CuryCrTot, CuryCtrlTot, CuryDrTot, DrTot FROM Batch WHERE BatNbr = @BATNBRR AND Module = 'AP'