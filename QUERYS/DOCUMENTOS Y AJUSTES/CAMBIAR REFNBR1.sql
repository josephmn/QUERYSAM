53632461	185985
53632460	185985
53632462	185985


11975
11987
11997


SELECT perpost,status,rlsed,sub,* from batch where  MODULE  = 'AP'  AND batnbr ='010302'  
SELECT perpost,rlsed,DOCDATE,refnbr,sub,* FROM APDOC  where batnbr ='010302'  --and refnbr like '%593%'
SELECT perpost,rlsed,refnbr,sub,* FROM APTRAN  where batnbr ='010302'
SELECT perpost,rlsed,refnbr,* FROM GLTRAN WHERE MODULE ='AP'  AND BATNBR ='010302'  
SELECT * from apadjust where adjbatnbr ='010302'
select * from xapdettran where batnbr ='010302'





select * from xAMRestriccion where UserId  ='JALVDEL'  AND Tipo  ='SUBCUENTABANCO' AND Dato  ='000000000000'
DELETE FROM xAMRestriccion where UserId  ='JALVDEL'  AND Tipo  ='SUBCUENTABANCO' AND Dato  ='000000000000'
 

0000003563 debe decir 0000003565. Gracias!!! 

declare @batnbr  char(6)
declare @refnbr_new varchar(10)
declare @refnbr_old varchar(10)
set  @batnbr = '002646' 
set @refnbr_new  = '0000003565'
set @refnbr_old  ='0000003563'
update apdoc set refnbr  =@refnbr_new where batnbr  = @batnbr and refnbr = @refnbr_old
update aptran set refnbr =@refnbr_new where batnbr  = @batnbr and refnbr = @refnbr_old
update gltran set refnbr =@refnbr_new where batnbr  = @batnbr and module ='AP' and refnbr = @refnbr_old
update apadjust set adjgrefnbr  = @refnbr_new where adjbatnbr  = @batnbr  and adjgrefnbr  = @refnbr_old

select  * from apdoc where RefNbr  ='00000015' and BatNbr  ='001646'

SELECT * from apadjust where adjbatnbr ='001646'
update apadjust set adjgrefnbr  = '0000015' where adjbatnbr  = '001646'  and adjgrefnbr  = @refnbr_old

selec