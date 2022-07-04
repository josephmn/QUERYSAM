--004357 OBS IGV CALCULADO MAL
DECLARE @BATNBR VARCHAR(6)
DECLARE @REF CHAR(6)

SET @BATNBR = '004357'
--SET @REF = '000779'

select 'TABLA APDOC', CuryOrigDocAmt, CuryDocBal, CuryTaxTot00, 
CuryTxblTot00, DocBal, OrigDocAmt, TaxTot00, TxblTot00, 
CuryId, CuryMultDiv, CuryRateType, DocType, VendId, user6, RefNbr, * from APDoc where BatNbr = @BATNBR --and RefNbr = @REF

select 'APTRAN', LineId, CuryTranAmt, TxblAmt00, TaxId00, TranAmt, TaxAmt00, CuryTxblAmt00, CuryTaxAmt00, CuryTaxAmt01,CuryTaxAmt02, CuryTaxAmt03
JrnlType, TaxCat, VendId, user6, * from aptran where BatNbr = @BATNBR --and RefNbr = @REF
--and TaxCat = 'AFECTO' --and acct = '603101' --601101

SELECT 'CALCULO CORRECTO', CuryTranAmt, (CuryTranAmt*0.18) 'IGV CuryTranAmt', 
TxblAmt00, (TxblAmt00*0.18) 'IGV TxblAmt00', TaxId00, TranAmt, (TranAmt*0.18) 'IGV TranAmt', 
TaxAmt00 'IGV TaxAmt00 SISTEMA', CuryTxblAmt00, (CuryTxblAmt00*0.18) 'IGV CuryTxblAmt00', CuryTaxAmt00 'IGV CuryTaxAmt00 SISTEMA' ,* FROM aptran where BatNbr = @BATNBR AND TaxId00 = 'IGV1' 
--AND TaxCat = 'AFECTO'
--AND user6 = 'AFEC1'
select 'TOTALES APTRAN', SUM(CuryTranAmt) CuryTranAmt, SUM(TxblAmt00) TxblAmt00, SUM(TranAmt) TranAmt, SUM(TaxAmt00) TaxAmt00, 
SUM(CuryTxblAmt00) CuryTxblAmt00, SUM(CuryTaxAmt00) CuryTaxAmt00
from aptran where BatNbr = @BATNBR --and TaxCat = 'AFECTO' --and acct = '603101' --601101
and user6 = 'AFEC1' --and RefNbr = @REF


/*
SELECT BatNbr, * FROM APDoc where DocDate >= '2018-05-01'


select DISTINCT DocType from ardoc --where DocType = 'IN'

*/















































