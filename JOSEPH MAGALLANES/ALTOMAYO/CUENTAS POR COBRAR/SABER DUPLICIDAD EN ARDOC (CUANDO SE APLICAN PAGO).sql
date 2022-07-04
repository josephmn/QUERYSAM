
--EJECUTAR LA QUERY PARA SABER SI HAY DUPLICIDAD DE APLICAR PAGO EN ARDOC

select RefNbr,count(*)rr from ardoc where PerPost  ='201901'
and doctype <>'pa'
group by RefNbr having count(*) > 1


-- QUERY PARA SABER SI HAY VALORES NEGATIVOS POR LA DUPLICIDAD

select OrigDocAmt, DocBal, CuryDocBal, BATNBR, * 
-- UPDATE A SET DocBal = '0', CuryDocBal = 0
from ardoc A where DocType = 'IN' AND DocBal < 0 AND CuryDocBal < 0 ORDER BY BATSEQ ASC


DECLARE @BATNBR CHAR(6)
SET @BATNBR ='000042'
--delete from ardoc where batnbr=@BATNBR
--delete from artran where batnbr=@BATNBR
--delete from gltran where batnbr=@BATNBR and  module  ='AR'
--delete from batch where batnbr=@BATNBR  and  module  ='AR'

select * from batch where batnbr=@BATNBR  and  module  ='AR'
select RefNbr, CustId, CuryDocBal, DocBal, * from ardoc where batnbr=@BATNBR and RefNbr = 'F030020146'
select RefNbr, CustId, * from artran where batnbr=@BATNBR and RefNbr = 'F030020146'
select * from gltran where batnbr=@BATNBR and  module  ='AR' and RefNbr = 'F030020146'

----------------------------------------------------------------
SELECT RefNbr, * FROM ARTRAN WHERE BatNbr = '004147' AND TranType = 'IN' and RefNbr = 'B030031998'















