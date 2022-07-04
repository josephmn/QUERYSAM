-- CAMBIO DE PERIODOS


000083 Y 000096
000084 Y 000097
000100
000100
000100
000041
000025
000022
000026
000027
000028
000029
000029
000081
000030
000031
000032
000033
000034
000035
000036
000037
000038
000040
000092


-------------

013131
012768
013108    

select perpost,Status,* from batch where batnbr ='013131' and module ='ap' --and perpost ='201507'
select perpost,docdate,InvcNbr,InvcDate,* from apdoc where batnbr='013131' --and perpost ='201507'
select perpost,RefNbr,* from aptran where batnbr ='013131'-- and perpost ='201507'
select perpost,* from gltran where batnbr ='013131'  and module ='AP'-- and perpost ='201507'
select * from apadjust where adjbatnbr = '013131'
select * from xapdettran where BatNbr  ='013131'


select perpost,Status,* from batch where batnbr ='011868' and module ='ap' --and perpost ='201507'
select perpost,docdate,* from apdoc where batnbr='011868' --and perpost ='201507'
select perpost,RefNbr,* from aptran where batnbr ='011868'-- and perpost ='201507'
select perpost,* from gltran where batnbr ='011868'  and module ='AP'-- and perpost ='201507'
select * from apadjust where adjbatnbr = '011868'
select * from xapdettran where BatNbr  ='011868'


select InvcNbr,InvcDate,DocDate,* from apdoc where InvcNbr  like '%00133620'













-- POLIZAS --
select perpost,* from batch where batnbr ='005460' and module ='GL' --and perpost ='201507'
select perpost,* from gltran where batnbr ='005460' and module ='GL' --and perpost ='201507' 



----------------nada mas-------------------------
declare @batnbr char(6)
declare @perpost char(6)
set @batnbr ='000096' -- DOCUMENTOS Y AJUSTES 
--set @batnbr2 ='05430'-- POLIZAS
set @perpost  ='201612'
--DOCUMENTOS Y AJUSTES
UPDATE  batch SET  PERPOST=@perpost where batnbr =@batnbr and module ='ap' --and perpost ='201507'
UPDATE apdoc SET PERPOST=@perpost where batnbr=@batnbr --and perpost ='201507'
UPDATE aptran SET PERPOST=@perpost where batnbr =@batnbr --and perpost ='201507'
UPDATE gltran SET PERPOST=@perpost where batnbr =@batnbr  and module ='AP' --and perpost ='201507' 
update apadjust set AdjgPerPost =@perpost,PerAppl =@perpost where adjbatnbr  =@batnbr


AdjgPerPost
201607
PerAppl
201607

----POLIZAS
UPDATE  batch SET PERPOST=@perpost where batnbr =@batnbr2 and module ='GL'-- and perpost ='201507'
UPDATE gltran SET PERPOST=@perpost where batnbr =@batnbr2  and module ='GL'-- and perpost ='201507' 







----DOCUMENTOS Y AJUSTES----
select status,rlsed,* from batch where batnbr ='000765' and module ='ap' --and perpost ='201507'
select * from apdoc where batnbr='000765' --and perpost ='201507'
select * from aptran where batnbr ='000765' -- and perpost ='201507'
select * from gltran where batnbr ='000765' and module ='AP' -- and perpost ='201507'
select * from apadjust where adjbatnbr = '000765'



--update batch set status = 'B' WHERE batnbr ='019280' and module ='AP'
--
--update batch set status = 'B' WHERE batnbr ='019281' and module ='AP'




/*
declare @batnbr char(6)
declare @batnbr2 char(6)
set @batnbr ='011651' -- DOCUMENTOS Y AJUSTES 
set @batnbr2 ='004353'-- POLIZAS
--DOCUMENTOS Y AJUSTES
UPDATE  batch SET PERENT ='201606',PERPOST='201606' where batnbr =@batnbr and module ='ap' --and perpost ='201507'
UPDATE apdoc SET PERENT ='201606',PERPOST='201606' where batnbr=@batnbr --and perpost ='201507'
UPDATE aptran SET PERENT ='201606',PERPOST='201606' where batnbr =@batnbr --and perpost ='201507'
UPDATE gltran SET PERENT ='201606',PERPOST='201606' where batnbr =@batnbr  and module ='AP' --and perpost ='201507' 
----POLIZAS
UPDATE  batch SET PERENT ='201606',PERPOST='201606' where batnbr =@batnbr2 and module ='GL'-- and perpost ='201507'
UPDATE gltran SET PERENT ='201606',PERPOST='201606' where batnbr =@batnbr2  and module ='GL'-- and perpost ='201507' 

--- BUSQUEDA ----------------------------------------------------
declare @batnbr char(6)
declare @refnbr char(10)
set @batnbr ='003787' -- LOTE 
--set @refnbr ='b080010753' -- DOCUMENTO
SELECT STATUS,module,rlsed,* FROM BATCH WHERE BATNBR=@batnbr AND MODULE = 'ar'
select perpost,batnbr,docbal,refnbr,doctype,rlsed,taxid00,applbatnbr,* from ardoc where batnbr= @batnbr --and refnbr = @refnbr
select rlsed,batnbr,acct,curyid, curytranamt,tranamt,jrnltype,refnbr,trantype,whseloc,* from artran
where batnbr= @batnbr-- and refnbr like @refnbr
select rlsed,batnbr,refnbr,acct,cramt,curycramt,dramt,curydramt,curyid,curyrate,jrnltype,trantype,module,posted,* from gltran 
where batnbr = @batnbr and module = 'ar'   --and trantype ='pa'   and refnbr like @refnbr and jr
-----------------------------------------------------------------

select extrefnbr,* from gltran where batnbr ='008938' and acct in ('401110','471001','945201')
select invcnbr,* from apdoc where batnbr='008938'
select extrefnbr,* from aptran where batnbr ='008938'
Select * From xapdettran where ruc =  '20490436945'  and doctypeid=  '01'  and nrodoc= '0010001844'
select apdoc.refnbr,apdoc.doctype,apdoc.vendid,
apdoc.invcnbr,apdoc.ponbr,apdoc.origdocamt,
apdoc.cycle from apdoc (FASTFIRSTROW)  where apdoc.batnbr =  '012175'  and apdoc.docclass =  'N'   and apdoc.refnbr like  '%'
 and (apdoc.doctype <> 'MC' and apdoc.doctype <> 'SC' and apdoc.doctype <> 'VT') and (apdoc.refnbr between '007324' and 'zzzzzzzzzz')
 order by apdoc.batnbr, apdoc.refnbr

USE [CA2015APP]
GO


use [ca2015app]
go








