--


--CASO RENDICION GASTOS
--REVISO APDO PORQUE QUIERO VER TOTALES

Select OrigDocAmt ,CuryOrigDocAmt,TxblTot00 ,CuryTxblTot00 ,TaxTot00 ,CuryTaxTot00 ,CuryRate ,CuryId ,DocBal ,CuryDocBal ,* from apdoc where BatNbr  ='005811'

Select OrigDocAmt ,CuryOrigDocAmt,TxblTot00 ,CuryTxblTot00 ,TaxTot00 ,CuryTaxTot00 ,CuryRate ,CuryId ,DocBal ,CuryDocBal ,* from apdoc where BatNbr  ='004927'


--REVISO DETALLE PORQUE QUIERO VER TOTALES X CUENTA
SELECT TranAmt ,CuryTranAmt ,TaxAmt00 ,CuryTaxAmt00 ,User6 ,CuryRate , VendId, * FROM APTRAN WHERE BATNBR  ='005811'
SELECT TranAmt ,CuryTranAmt ,TaxAmt00 ,CuryTaxAmt00 ,User6 ,CuryRate , VendId, * FROM APTRAN WHERE BATNBR  ='004927'

--(CUENTA DE DEVOLUCION )
--update aptran set TranAmt  = 27.75, CuryTranAmt  = 8.48 where BatNbr   ='004927' and Acct  ='469902' and TranAmt  = 0

--CUANTO ES UNA RENDICION EN CUAL SE GASTA MAS DE LO QUE SE TIENE (DRAMT - CRAMT )  ENTONCES SE TIENE QUE CARGAR LA DIFERENCIA A CRAMT 
--DRAMT  = 100
--CRAMT   = 90
--ENTONCES FALTA UN CRAMT POR LOS 10 QUE SE TIENE QUE IGUALAR 

select * from gltran where BatNbr  ='004927' and Module  ='AP'
--update gltran set CuryCrAmt  = 94.74, CrAmt  = 94.74  *3.272 , DrAmt  = 0 ,CuryDrAmt  = 0 where BatNbr  ='004927' and Module  ='AP' and Acct  ='141301'

select * from gltran where BatNbr  ='005811' and Module  ='AP'




------------------------------------------------------


Select OrigDocAmt ,CuryOrigDocAmt,TxblTot00 ,CuryTxblTot00 ,TaxTot00 ,CuryTaxTot00 ,CuryRate ,CuryId ,DocBal ,CuryDocBal ,* from apdoc where BatNbr  ='005958'

Select OrigDocAmt ,CuryOrigDocAmt,TxblTot00 ,CuryTxblTot00 ,TaxTot00 ,CuryTaxTot00 ,CuryRate ,CuryId ,DocBal ,CuryDocBal ,* from apdoc where BatNbr  ='006022'


--REVISO DETALLE PORQUE QUIERO VER TOTALES X CUENTA
SELECT TranAmt ,CuryTranAmt ,TaxAmt00 ,CuryTaxAmt00 ,User6 ,CuryRate , VendId, * FROM APTRAN WHERE BATNBR  ='005958'

SELECT TranAmt ,CuryTranAmt ,TaxAmt00 ,CuryTaxAmt00 ,User6 ,CuryRate , VendId, * FROM APTRAN WHERE BATNBR  ='006022'



select * from gltran where BatNbr  ='005958' and Module  ='AP'
--update gltran set CuryCrAmt  = 94.74, CrAmt  = 94.74  *3.272 , DrAmt  = 0 ,CuryDrAmt  = 0 where BatNbr  ='004927' and Module  ='AP' and Acct  ='141301'

select * 
-- UPDATE T SET DrAmt  = 0 ,CuryDrAmt  = 0
from gltran T where BatNbr  ='006022' and Module  ='AP' AND Acct = '469902'






