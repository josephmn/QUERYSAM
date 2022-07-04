

SELECT BatNbr, RefNbr, CuryDocBal, CuryOrigDocAmt, CuryTaxTot00, CuryTxblTot00, DocBal, OrigDocAmt, TaxTot00, TxblTot00, * FROM APDOC WHERE BatNbr IN ('002108','002150')

select 'APTRAN', LineId, CuryTranAmt, TxblAmt00, TaxId00, TranAmt, TaxAmt00, CuryTxblAmt00, CuryTaxAmt00, 
JrnlType, TaxCat, VendId, user6, * from aptran where BatNbr = '002108' --and RefNbr = @REF

select 'TOTALES APTRAN', SUM(CuryTranAmt) CuryTranAmt, SUM(TxblAmt00) TxblAmt00, SUM(TranAmt) TranAmt, SUM(TaxAmt00) TaxAmt00, SUM(CuryTxblAmt00) CuryTxblAmt00, SUM(CuryTaxAmt00) CuryTaxAmt00 
from aptran where BatNbr = '002108' --and TaxCat = 'AFECTO' --and acct = '603101' --601101
and user6 = 'AFEC1' --and RefNbr = @REF



/****** query para encontrar la retencion al exportar en excel registro de compras ******/

select * from xvr_regcom2009Xls where Retencion  = 1  and PerPost  ='201803'

--select batnbr, RefNbr, * from xvr_regcom2009Xls where Retencion  = 1  and  batnbr   ='002099'


--encontrar el RefNbr para la retencion
select s4future11, batnbr, RefNbr, * from APDoc where BatNbr = '002150'

--colocar el refNbr y colocarlo al siguiente select para la retencion
select * from apadjust where AdjdRefNbr = '002819' --colocar RefNbr para la retencion

--cuando es retencion s4future11 esta en 4
select s4future11, * from APDoc where BatNbr = '002151' --colocar el AdjBatNbr para ver la retencion


