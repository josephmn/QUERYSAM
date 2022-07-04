

/*
select rlsed,status,* from batch where batnbr ='003863' and module ='in'
select rlsed,PERPOST,* from intran where batnbr ='003863'
select rlsed,trandate,* from gltran where batnbr ='003863' and module ='IN'



UPDATE  intran SET TRANDATE   ='2016-03-30'  WHERE BATNBR  ='003863'
UPDATE   GLTRAN  SET TRANDATE   ='2016-03-30'  WHERE BATNBR  ='003863' AND MODULE  ='IN'




select rlsed,* from intran where invtid ='25482' and perpost ='201511' AND QTY =758.3 AND SITEID= 'cixprod'


delete from batch where batnbr ='028083' and module ='IN'
delete from intran where batnbr ='028083'
delete from  gltran where batnbr ='028083' and module ='IN'


select rlsed,status,* from batch where batnbr ='012861' and module ='in'

select rlsed,* from intran where batnbr ='012861'

select rlsed,* from gltran where batnbr ='012861' and module ='IN'


----------------------------------------------------------------------------------
declare @batnbr char(6)
declare @monto float
set @batnbr  ='008299'
set @monto =11590.46470296
--update batch set crtot=@monto,ctrltot=@monto,curycrtot=@monto,curyctrltot=@monto,
--curydrtot=@monto,drtot=@monto from batch where batnbr =@batnbr and module ='IN'
--go
----------------------------------------------------------------------------------





