/***************** documento y ajuste **************************/
/***************** IGV PARA COMPRAS **************************/

select TaxIdDflt, * from aptran where BatNbr = '000883' and acct = '601101'
select TaxIdDflt, * from aptran where BatNbr = '000023' and acct = '603101'

/*** referencia *****/
select CuryOrigDocAmt, CuryDocBal, CuryTaxTot00, CuryTxblTot00, DocBal, OrigDocAmt, TaxTot00, TxblTot00, CuryId, CuryMultDiv, CuryRateType, DocType, VendId, user6, * from APDoc where BatNbr = '000883' and RefNbr = '000457'

select CuryOrigDocAmt, CuryDocBal, CuryTaxTot00, CuryTxblTot00, DocBal, OrigDocAmt, TaxTot00, TxblTot00, CuryId, CuryMultDiv, CuryRateType, DocType, VendId, user6, * from APDoc where BatNbr = '000811' and RefNbr = '000595'
select CuryOrigDocAmt, CuryDocBal, CuryTaxTot00, CuryTxblTot00, DocBal, OrigDocAmt, TaxTot00, TxblTot00, CuryId, CuryMultDiv, CuryRateType, DocType, VendId, user6, * from APDoc where BatNbr = '000580' and RefNbr = '000467'

select CuryOrigDocAmt, CuryDocBal, CuryTaxTot00, CuryTxblTot00, DocBal, OrigDocAmt, TaxTot00, TxblTot00, CuryId, CuryMultDiv, CuryRateType, DocType, VendId, user6, * from APDoc where BatNbr = '000582' and RefNbr = '000468'
select CuryOrigDocAmt, CuryDocBal, CuryTaxTot00, CuryTxblTot00, DocBal, OrigDocAmt, TaxTot00, TxblTot00, CuryId, CuryMultDiv, CuryRateType, DocType, VendId, user6, * from APDoc where BatNbr = '000822' --and RefNbr = '000468'


/*** CUADRAR IGV ERRONEO ****/ -- CONSULTA
select CuryOrigDocAmt, CuryDocBal, CuryTaxTot00, CuryTxblTot00, DocBal, OrigDocAmt, TaxTot00, TxblTot00, CuryId, CuryMultDiv, CuryRateType, DocType, VendId, user6, * from APDoc where BatNbr = '000811' and RefNbr = '000595'
select TaxId00, TranAmt, TaxAmt00, CuryTxblAmt00, CuryTaxAmt00, JrnlType, TaxCat, VendId, user6, * from aptran where BatNbr = '000811' --and acct = '603101'

select TaxId00, TranAmt, TaxAmt00, CuryTxblAmt00, CuryTaxAmt00, JrnlType, TaxCat, VendId, user6, * from aptran where BatNbr = '000582' --and acct = '603101'

--select CuryDocBal, * from APDoc where BatNbr = '000811' and RefNbr = '000468'

--select * from aptran where BatNbr = '000582'

--TxblAmt00
--83.31

--TaxId00 = 'IGV1'
--TranAmt
--= 31.55     

--TaxAmt00
--5.68     

--CuryTxblAmt00
--31.55

--CuryTaxAmt00
--5.68

/*** cambio montos ***/

--update APDoc
--set CuryTxblTot00 = '9.69' , TaxTot00 = '9.69' where BatNbr = '000582' and RefNbr = '000468'

--set CuryDocBal = 0, DocBal = 0 where BatNbr = '000582' and RefNbr = '000468'
/*
select CuryOrigDocAmt, CuryDocBal, CuryTaxTot00, CuryTxblTot00, DocBal, OrigDocAmt, TaxTot00, TxblTot00, * from APDoc where BatNbr = '000582' and RefNbr = '000468'
*/