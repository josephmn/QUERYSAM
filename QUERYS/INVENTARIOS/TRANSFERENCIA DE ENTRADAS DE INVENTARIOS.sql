
------------INVENTARIOS
006951
Cantidad existencia de artículo '20610' almacén 'LIMINSUMOS'

006953
Cantidad existencia de artículo '25044' almacén 'LIMINSUMOS'

/*

---  TRANSFERENCIAS Y ENTRADAS DE INVENTARIOS

select perpost,s4future07,status,* from batch where batnbr  ='002178' and module = 'in'
select perent,perpost,trandate,refnbr,* from intran where batnbr  ='002178' 
select SUM(CRAMT) from gltran where batnbr  ='002178' and module = 'in'



UPDATE  intran SET  EXTCOST  = EXTCOST * -1  where batnbr  ='038727'  AND EXTCOST  < 0
002081    
1211
*/


DECLARE @CONTROL FLOAT
SET @CONTROL = 151234.51
update batch set crtot=@CONTROL,curycrtot=@CONTROL,CuryDepositAmt = @CONTROL,DepositAmt =@CONTROL
from batch where batnbr ='002178' and module ='IN'




--- actualizo la cantidad para migrar ---
UPDATE ITEMSITE SET AvgCost =15 ,TotCost  = 15 WHERE  INVTID ='I250273' and siteid  ='CFCUSCO2'
update ITEMSITE SET QTYONHAND =15, QTYAVAIL =15 WHERE INVTID ='I250273' and siteid  ='CFCUSCO2'

UPDATE ITEMSITE SET AvgCost =15 ,TotCost  =15 WHERE  INVTID ='I250273' and siteid  ='CFCUSCO2'
UPDATE LOCATION SET QTYONHAND  = 15  WHERE SiteID  ='CFCUSCO2' AND  INVTID  ='I250273' 


/*
select tranamt   from intran where batnbr  = '002080'



UPDATE BATCH SET STATUS ='B' WHERE BATNBR  ='038727' and module ='IN'

UPDATE BATCH SET CrTot = CrTot * -1 , CtrlTot = CtrlTot*-1 WHERE BATNBR  = '038727' AND MODULE  ='IN'

UPDATE  intran SET  EXTCOST  = EXTCOST * -1  where batnbr  ='038727'  AND EXTCOST  < 0


UPDATE  intran SET  TRANAMT  = TRANAMT * -1  where batnbr  ='038727'  AND TRANAMT<0


UPDATE  intran SET  QTY  = QTY * -1  where batnbr  ='038727'  AND QTY<0

038727    

CrTot
-302.31

CtrlTot
-302.31




002902INA
002902INA
002902INA
002902INA
002979INA
002979INA
002979INA
002979INA
002981INA
002981INA


update batch set s4future07 ='2017-03-31' where batnbr = '002902' and module = 'in' 
update intran set trandate ='2017-03-31' where batnbr  = '002902'
update gltran set trandate ='2017-03-31' where batnbr  = '002902' and module = 'in'



--
--update batch set s4future07 ='2016-03-30' where batnbr ='003552' and module = 'in' --and perpost ='201508'
--update intran set perpost  ='201507',trandate ='2015-07-31' where batnbr ='007921' and perpost ='201508'
--update gltran set perpost  ='201507',trandate ='2015-07-31' where batnbr ='007921' and module = 'in' and perpost ='201508'
--
--update batch set perpost  ='201507',s4future07 ='2015-07-31' where batnbr ='007925' and module = 'in'and perpost ='201508'
--update intran set perpost  ='201507',trandate ='2015-07-31' where batnbr ='007925' and perpost ='201508'
--update gltran set perpost  ='201507',trandate ='2015-07-31' where batnbr ='007925' and module = 'in'and perpost ='201508'


---------------inventarios-----------------
select * from batch where batnbr = '005640' and module = 'in'

--update batch set perpost  ='201507' where batnbr ='007925' and module = 'in'
--update intran set perpost  ='201507' where batnbr ='007925' 
--update gltran set perpost  ='201507' where batnbr ='007925' and module = 'in'

