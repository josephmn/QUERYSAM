declare @ALMACEN char(10), @COD_PROD char(10),  @qtyonhand FLOAT, @totcost FLOAT


set @ALMACEN = 'CFCUSCO2' set @COD_PROD = 'I300003' 

SET @qtyonhand = 2750930 SET   @totcost= 79573.73
/*
SELECT *FROM BATCH WHERE BATNBR ='016383' AND  MODULE ='IN'
SELECT SUM(QTY),SUM(EXTCOST)  FROM INTRAN WHERE BATNBR ='016383' 

SELECT INVTID, SITEID,SUM(QTY),SUM(EXTCOST) 
SELECT * 
FROM INTRAN 
WHERE BATNBR ='003786' AND INVTID IN ('I250153')AND SITEID IN ('CIXPT','SURCOPT')
GROUP BY  SITEID,INVTID
*/


select STOCK,*from xamitemsite where  siteid=@ALMACEN and  invtid  in (  @COD_PROD)

select siteid, INVTID, qtyonhand, totcost,AllocQty, QtyAvail, QtyCustOrd,round(qtyonhand,2), * 
from itemsite
where siteid=@ALMACEN and  invtid  in (  @COD_PROD)

select siteid, INVTID, qtyonhand,WhseLoc,* 
from location
where siteid=@ALMACEN and  invtid  in ( @COD_PROD) and whseloc='BUENESTADO'



--210.01
--UPDATE 
--****
--update itemsite set  qtyonhand = @qtyonhand ,QtyAvail =  @qtyonhand
--,
--totcost =@totcost * @qtyonhand  , AvgCost= @totcost
--where siteid=@ALMACEN and  invtid   in ( @COD_PROD)


--update location set qtyonhand = @qtyonhand --qtyonhand = qtyonhand+ @qtyonhand
--where siteid=@ALMACEN and  invtid   in (  @COD_PROD)
--and whseloc='BUENESTADO'

--update xamitemsite SET stock =@qtyonhand 
--,COSTO = @totcost * stock
--from xamitemsite where  siteid=@ALMACEN and  invtid  in (  @COD_PROD)
