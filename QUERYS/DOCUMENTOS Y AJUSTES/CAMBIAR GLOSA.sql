




SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='012653'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,* FROM APDOC  where batnbr ='012653'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,sub,* FROM APTRAN  where batnbr ='012653'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='012653'  
SELECT * from apadjust where adjbatnbr ='012653'
select * from xapdettran where batnbr ='012653'



UPDATE APTRAN SET   trandesc ='06/2016 ALQUILER VARIABLE-ADIC' where batnbr  ='012653' and acct  ='955301'
UPDATE GLTRAN SET   trandesc ='06/2016 ALQUILER VARIABLE-ADIC' where batnbr  ='012653'  AND MODULE ='AP' and acct  ='955301'



UPDATE APTRAN SET ponbr ='000381' WHERE RCPTNBR ='000365' and trandesc ='BONLE QUESO FRESCO GRANDE X KG'


