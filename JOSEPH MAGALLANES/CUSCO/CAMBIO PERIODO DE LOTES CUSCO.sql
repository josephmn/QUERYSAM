
--003783, 003784

select perpost, * from Batch where BatNbr in ('001343')--, '003784') and module = 'IN'

select PerPost, * from GLTran where BatNbr in ('003783')--, '003784') and module = 'IN'

select PerPost, * from INTran where BatNbr in ('003783')--, '003784')

/*
update Batch
set PerPost = '201712' where BatNbr in ('003783', '003784') and module = 'IN'

update GLTran
set PerPost = '201712' where BatNbr in ('003783', '003784') and module = 'IN'

update INTran
set PerPost = '201712' where BatNbr in ('003783', '003784')

*/
/*

-- CAMBIAR PERIODO CHEQUE MANUAL, DOCUMENTOS Y AJUSTES

----------------nada mas-------------------------
declare @batnbr char(6)
declare @perpost char(6)
set @batnbr ='001343' -- DOCUMENTOS Y AJUSTES 
--set @batnbr2 ='05430'-- POLIZAS
set @perpost  ='201804'
--DOCUMENTOS Y AJUSTES
UPDATE batch SET  PERPOST=@perpost where batnbr =@batnbr and module ='AP' --and perpost ='201507'
UPDATE apdoc SET PERPOST=@perpost where batnbr=@batnbr --and perpost ='201507'
UPDATE aptran SET PERPOST=@perpost where batnbr =@batnbr --and perpost ='201507'
UPDATE gltran SET PERPOST=@perpost where batnbr =@batnbr  and module ='AP' --and perpost ='201507' 
UPDATE apadjust set AdjgPerPost =@perpost,PerAppl =@perpost where adjbatnbr  =@batnbr
*/