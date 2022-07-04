
--------- ELIMINAR AP Y DESTINO
Laison,
PFV eliminar lote 
AP 007155/004839 PROVISION
DA 002654  DESTINO

SELECT perpost,status,rlsed,* from batch where  MODULE  = 'AP'  AND batnbr ='007155'  
SELECT perpost,rlsed,DOCDATE,refnbr,* FROM APDOC  where batnbr ='007155'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,* FROM APTRAN  where batnbr ='007155'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='007155'  
SELECT * from apadjust where adjbatnbr ='007155'
select * from xapdettran where batnbr ='007155'

SELECT perpost,status,rlsed,* from batch where  MODULE  = 'GL'  AND batnbr ='002654'  
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='002654'  


declare @batnbr char(6)
declare @batnbr2 char(6)
set @batnbr ='007155' -- DOCUMENTOS Y AJUSTES 
set @batnbr2 ='002654'-- POLIZAS
--DOCUMENTOS Y AJUSTES
DELETE FROM batch  where batnbr =@batnbr and module ='ap' --and perpost ='201507'
DELETE FROM apdoc  where batnbr=@batnbr --and perpost ='201507'
DELETE FROM aptran where batnbr =@batnbr --and perpost ='201507'
DELETE FROM gltran where batnbr =@batnbr  and module ='AP' --and perpost ='201507' 

----POLIZAS
DELETE FROM batch  where batnbr =@batnbr2 and module ='GL' --and perpost ='201507'
DELETE FROM GLTRAN  where batnbr =@batnbr2 and module ='GL' --and perpost ='201507'

























