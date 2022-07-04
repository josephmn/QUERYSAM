SELECT perpost,status,rlsed,* from batch where  MODULE  = 'AP' AND batnbr ='013539'  
SELECT perpost,rlsed,DOCDATE,* FROM APDOC  where batnbr ='013539'  
SELECT perpost,rlsed,* FROM APTRAN  where batnbr ='013539'
SELECT perpost,rlsed,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='013539'  
SELECT * from apadjust where adjbatnbr ='013539'
SELECT* FROM XAPDETTRAN WHERE BATNBR ='013539'


--013092--
--013411
--013338

--013539