-----------CAMBIAR PROVEEDOR AP


017136

Cambiar de RUC de:99999999999 a 20394862704

SELECT perpost,status,rlsed,* from batch where  MODULE  = 'AP'  AND batnbr ='017136'  
SELECT perpost,rlsed,DOCDATE,* FROM APDOC  where batnbr ='017136'  --and refnbr like '%593%'
SELECT perpost,rlsed,* FROM APTRAN  where batnbr ='017136'
SELECT perpost,rlsed,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='017136'  
SELECT * from apadjust where adjbatnbr ='017136'
select * from xapdettran where batnbr ='017136'



019417
019416
20100113610

update 



/*
UPDATE APDOC SET VENDID ='20394862704' WHERE BATNBR ='017136'--AND VENDID ='11111111114'
UPDATE APTRAN SET VENDID ='20394862704' WHERE BATNBR ='017136'--AND VENDID ='11111111114'
UPDATE GLTRAN SET ID ='20394862704' WHERE BATNBR ='017136' -- AND MODULE ='AP' AND ID ='11111111114'
*/