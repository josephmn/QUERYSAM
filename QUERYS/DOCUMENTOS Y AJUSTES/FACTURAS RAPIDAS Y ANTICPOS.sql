------------
-- FACTURAS RAPIDAS Y ANTICIPOS  --
LT  018875

SELECT perpost,status,rlsed,* from batch where  MODULE  = 'AP' AND batnbr ='019203'  
SELECT perpost,rlsed,DOCDATE,* FROM APDOC  where batnbr ='019203'  
SELECT perpost,rlsed,* FROM APTRAN  where batnbr ='019203'
SELECT perpost,rlsed,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='019203'  
SELECT * from apadjust where adjbatnbr ='019203'
SELECT* FROM XAPDETTRAN WHERE BATNBR ='019203'

018514
018524
019203

SELECT perpost,status,rlsed,* from batch where  MODULE  = 'AP' AND BATNBR ='000646'  
SELECT perpost,rlsed,DOCDATE,REFNBR,* FROM APDOC  where REFNBR ='018875'  
SELECT perpost,rlsed,REFNBR,* FROM APTRAN  where REFNBR ='000646'
SELECT perpost,rlsed,REFNBR,* FROM GLTRAN WHERE MODULE ='AP'  AND REFNBR ='000646'  
SELECT ADJDREFNBR,* from apadjust where ADJDREFNBR ='000646'
SELECT* FROM XAPDETTRAN WHERE NRODOC ='000646'
--

UPDATE  batch SET PERENT ='201609',PERPOST='201609' where batnbr ='019202' and module ='ap'-- and perpost ='201507'
UPDATE apdoc SET PERENT ='201609',PERPOST='201609' where batnbr='019202'  --and perpost ='201507'
UPDATE aptran SET PERENT ='201609',PERPOST='201609' where batnbr ='019202'  --and perpost ='201507'
UPDATE gltran SET PERENT ='201609',PERPOST='201609' where batnbr ='019202'   and module ='AP' --and perpost ='201507' 





